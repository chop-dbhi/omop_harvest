import os
import json

def get_env_variable(var_name):
    """ Get the environment variable or return an exception"""
    try:
        return os.environ[var_name]
    except KeyError:
        error_msg = "Set the %s environment variable" % var_name
        raise ImproperlyConfigured(error_msg)

curdir = os.path.dirname(os.path.abspath(__file__))
project_settings = json.loads(open(os.path.join(curdir, '../../../.project_config.json'), 'r').read())['project_settings']

environment = get_env_variable('APP_ENV')

if environment not in project_settings.keys():
    error_msg = "Settings for {0} environment not found in project configuration.".format(environment)
    raise ImproperlyConfigured(error_msg)

LOGSTASH_CONFIG = project_settings[environment]['logstash']['config']

with open(os.path.join(curdir, 'omop_harvest.logstash.conf'), 'w') as outfile:
  outfile.write(LOGSTASH_CONFIG)
  outfile.close()
