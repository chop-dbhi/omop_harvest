from __future__ import print_function, with_statement
import os
import json
from functools import wraps
from fabric.api import *
from fabric.colors import red, yellow, white
from fabric.contrib.console import confirm
from fabric.contrib.files import exists


__doc__ = """\
Before using this fabfile, you must create a .fabhosts in your project
directory. It is a JSON file with the following structure:

    {
        "_": {
            "host_string": "example.com",
            "path": "~/sites/project-env/project",
            "repo_url": "git@github.com/bruth/project.git",
            "nginx_conf_dir": "~/etc/nginx/conf.d",
            "supervisor_conf_dir": "~/etc/supervisor.d"
        },
        "production": {},
        "development": {
            "path": "~/sites/project-dev-env/project"
        },
        "staging": {
            "path": "~/sites/project-stage-env/project"
        }
    }

The "_" entry acts as the default/fallback for the other host
settings, so you only have to define the host-specific settings.
The below settings are required:

* `host_string` - hostname or IP address of the host server
* `path` - path to the deployed project *within* it's virtual environment
* `repo_url` - URL to project git repository
* `nginx_conf_dir` - path to host's nginx conf.d directory
* `supervisor_conf_dir` - path to host's supervisor

Note, additional settings can be defined and will be set on the `env`
object, but the above settings are required at a minimum.
"""

# A few setup steps and environment checks
curdir = os.path.dirname(os.path.abspath(__file__))
hosts_file = os.path.join(curdir, '.fabhosts')

# Check for the .fabhosts file
if not os.path.exists(hosts_file):
    abort(white(__doc__))

base_settings = {
    'host_string': '',
    'path': '',
    'repo_url': '',
    'nginx_conf_dir': '',
    'supervisor_conf_dir': '',
}

required_settings = ['host_string', 'path', 'repo_url',
    'nginx_conf_dir', 'supervisor_conf_dir']


def get_hosts_settings():
    # Load all the host settings
    hosts = json.loads(open(hosts_file).read())

    # Pop the default settings
    default_settings = hosts.pop('_', {})

    # Pre-populated defaults
    for host in hosts:
        base = base_settings.copy()
        base.update(default_settings)
        base.update(hosts[host])
        hosts[host] = base

    if not env.hosts:
        abort(red('Error: At least one host must be specified'))

    # Validate all hosts have an entry in the .hosts file
    for target in env.hosts:
        if target not in hosts:
            abort(red('Error: No settings have been defined for the "{}" host'.format(target)))
        settings = hosts[target]
        for key in required_settings:
            if not settings[key]:
                abort(red('Error: The setting "{}" is not defined for "{}" host'.format(key, target)))
    return hosts


def host_context(func):
    "Sets the context of the setting to the current host"
    @wraps(func)
    def decorator(*args, **kwargs):
        hosts = get_hosts_settings()
        with settings(**hosts[env.host]):
            return func(*args, **kwargs)
    return decorator


@host_context
def merge_commit(commit):
    "Fetches the latest code and merges up the specified commit."
    with cd(env.path):
        run('git fetch')
        if '@' in commit:
            branch, commit = commit.split('@')
            run('git checkout {}'.format(branch))
        run('git merge {}'.format(commit))


@host_context
def current_commit():
    with cd(env.path):
        run('git log -1')
        run('git status')


@host_context
def migrate(app_name=None, revision=None):
    "Syncs and migrates the database using South."
    cmd = ['python bin/manage.py syncdb --migrate']
    verun('uname')
    if app_name:
        cmd.append(app_name)
        if revision:
            cmd.append(revision)
    verun(' '.join(cmd))

@host_context
def collect_static():
    "Run Django's collectstatic utility."
    cmd = 'python bin/manage.py collectstatic --noinput'
    verun(cmd)

@host_context
def rebuild_index():
    "Run Django's collectstatic utility."
    cmd = 'python bin/manage.py rebuild_index --noinput'
    verun(cmd)

@host_context
def symlink_nginx():
    "Symlinks the nginx config to the host's nginx conf directory."
    with cd(env.path):
        sudo('ln -sf $PWD/server/nginx/{host}.conf '
            '{nginx_conf_dir}/omop_harvest_{host}.conf'.format(**env))


@host_context
def reload_nginx():
    "Reloads nginx if the config test succeeds."
    symlink_nginx()

    if sudo('/etc/init.d/nginx configtest').succeeded:
        sudo('/etc/init.d/nginx reload')
    elif not confirm(yellow('nginx config test failed. continue?')):
        abort('nginx config test failed. Aborting')


@host_context
def reload_supervisor():
    "Re-link supervisor config and force an update to supervisor."
    with cd(env.path):
        sudo('ln -sf $PWD/server/supervisor/{host}.ini '
            '{supervisor_conf_dir}/omop_harvest_{host}.ini'.format(**env))
    run('supervisorctl update')


@host_context
def reload_wsgi():
    "Gets the PID for the wsgi process and sends a HUP signal."
    if env.command == 'ci_deploy':
        run('supervisorctl restart omop_harvest_development')
    else:
        pid = run('supervisorctl pid omop_harvest_{host}'.format(host=env.host))
        try:
            int(pid)
            sudo('kill -HUP {}'.format(pid))
        except (TypeError, ValueError):
            pass


@host_context
def reload_memcached():
    "Reloads memcached. WARNING this flushes all cache!"
    sudo('/etc/init.d/memcached reload')

@host_context
def deploy(force=False):
    setup()
    upload_settings()
    # upload_etl_config()
    mm_on()
    # merge_commit(commit)
    install_deps(force)
    migrate()
    make()
    collect_static()
    rebuild_index()
    symlink_nginx()
    reload_nginx()
    reload_supervisor()
    reload_wsgi()
    if confirm(yellow('Reload memcached?')):
        reload_memcached()
    mm_off()

@host_context
def ci_deploy():
    print(env.host)
    if env.host == 'test':
        env.user = 'user001'
        env.password = 'user001'
    else:
        env.host_string = "devuser@resrhtiuws06.research.chop.edu"
        env.user = "devuser"
        env.password = "devuser"
    setup() 
    upload_settings() 
    install_deps() 
    migrate() 
    make() 
    collect_static() 
    rebuild_index() 
    reload_wsgi()

@host_context
def make():
    "Rebuilds all static files using the Makefile."
    verun('make')

@host_context
def setup():
    "Sets up the initial environment."
    parent, project = os.path.split(env.path)
    if not exists(parent):
        run('mkdir -p {}'.format(parent))
        run('virtualenv {}'.format(parent))

    with cd(parent):
        if not exists(project):
            run('git clone {repo_url} {project}'.format(project=project, **env))
            with cd(project):
                run('git checkout {branch}'.format(**env))
                run('git pull origin {branch}'.format(**env))
        else:
            with cd(project):
                run('git checkout {branch}'.format(**env))
                run('git pull origin {branch}'.format(**env))

@host_context
def upload_settings():
    "Uploads the non-versioned local settings to the server."
    if env.host == 'integration-server':
        local_path = os.path.join(curdir, 'settings/development.py')
    else:
        local_path = os.path.join(curdir, 'settings/{}.py'.format(env.host))

    if os.path.exists(local_path):
        remote_path = os.path.join(env.path, 'omop_harvest/conf/local_settings.py')
        put(local_path, remote_path)

    elif not confirm(yellow('No local settings found for host "{}". Continue anyway?'.format(env.host))):
        abort('No local settings found for host "{}". Aborting.')

@host_context
def upload_de_config():
    "Uploads the DataExpress properties file associated with the target"
    if env.host == 'etl':
        etl_targets = ['production','development']
        for target in etl_targets:
            local_path = os.path.join(curdir, 'etl/de/conf/{}.properties'.format(target))
            if os.path.exists(local_path):
                remote_path = os.path.join(env.path, 'etl/de/conf/{}.properties'.format(target))
                put(local_path, remote_path)
            elif not confirm(yellow('No Configuration settings found for ETL. Continue anyway?')):
                abort('No ETL Configuration found. Aborting.')    
    else:
        local_path = os.path.join(curdir, 'etl/de/conf/{}.properties'.format(env.host))

        if os.path.exists(local_path):
            remote_path = os.path.join(env.path, 'etl/de/conf/{}.properties'.format(env.host))
            local_path = os.path.join(curdir, 'etl/de/conf/{}.properties'.format(env.host))
            put(local_path, remote_path)

        elif not confirm(yellow('No Configuration settings found for ETL. Continue anyway?')):
            abort('No ETL Configuration found. Aborting.')


@host_context
def upload_etl_config():
    "Uploads the non-versioned ETL configuration to the server"
    local_path = os.path.join(curdir, 'etl/etl_config.json')

    if os.path.exists(local_path):
        remote_path = os.path.join(env.path, 'etl/etl_config.json')
        put(local_path, remote_path)

    elif not confirm(yellow('No Configuration settings found for ETL. Continue anyway?')):
        abort('No ETL Configuration found. Aborting.')

@host_context
def upload_pgpass():
    "Uploads the non-versioned pgpass file for ETL to production"
    local_path = os.path.join(curdir, '.pgpass')

    if os.path.exists(local_path):
        remote_path = os.path.join('/home/devuser/')
        put(local_path, remote_path)

@host_context
def install_deps(force=False):
    "Install dependencies via pip."
    if force:
        verun('pip install --pre -U -r requirements.txt')
    else:
        verun('pip install --pre -r requirements.txt')


@host_context
def verun(cmd):
    "Runs a command after the virtualenv is activated."
    cd(env.path)
    with cd(env.path):
        with prefix('source ../bin/activate'):
            run(cmd)

@host_context
def mm_on():
    "Turns on maintenance mode."
    with cd(env.path):
        run('touch MAINTENANCE_MODE')


@host_context
def mm_off():
    "Turns off maintenance mode."
    with cd(env.path):
        run('rm -f MAINTENANCE_MODE')
