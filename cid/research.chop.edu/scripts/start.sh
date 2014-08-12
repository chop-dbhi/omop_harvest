#!/bin/bash

if [ "$CID_ENV" = "research.chop.edu" ]; then
    # Install CHOP Authentication for CHOP/CID
    cd /opt/apps/harvest-app/ && /opt/ve/harvest-app/bin/pip install -r /opt/apps/harvest-app/cid/research.chop.edu/requirements.txt
    cd /opt/apps/harvest-app/ && /opt/ve/harvest-app/bin/pip install http://github.research.chop.edu/cbmi/django-chopauth/archive/master.tar.gz
    
    # Copy in and setup cid_env  specific files
    cd /opt/apps/harvest-app/ && cp cid/research.chop.edu/app/conf/app.py omop_harvest/conf/app.py
    cd /opt/apps/harvest-app/ && cp cid/research.chop.edu/logstash/supervisor_logstash_run.conf /opt/supervisor_logstash_run.conf

    # Get Container/App Run Time Settings
    cd /opt/apps/harvest-app/ && /opt/ve/harvest-app/bin/fab get_configuration:noinput=True

    # Get Container/App Run Time Logging Config
    cd /opt/apps/harvest-app/cid/research.chop.edu/logstash && /opt/ve/harvest-app/bin/python get_logstash_config.py

    # Build and Run
    DJANGO_SETTINGS_MODULE=omop_harvest.conf.setting
    cd /opt/apps/harvest-app/ && DJANGO_SETTINGS_MODULE=omop_harvest.conf.setting make build
    cd /opt/apps/harvest-app/ && DJANGO_SETTINGS_MODULE=omop_harvest.conf.setting make sass
    cd /opt/apps/harvest-app/ && DJANGO_SETTINGS_MODULE=omop_harvest.conf.setting make collect
    #cd /opt/apps/harvest-app/ && /opt/ve/harvest-app/bin/python ./bin/manage.py syncdb --noinput
    #cd /opt/apps/harvest-app/ && /opt/ve/harvest-app/bin/python ./bin/manage.py migrate --noinput
    cd /opt/apps/harvest-app/ && /opt/ve/harvest-app/bin/python ./bin/manage.py collectstatic --noinput
    #cd /opt/apps/harvest-app/ && /opt/ve/harvest-app/bin/python ./bin/manage.py rebuild_index --noinput
    supervisord -c /opt/supervisor_run.conf -n 
    #supervisord -c /opt/supervisor_logstash_run.conf 
else

    # Copy in and setup cid_env  specific files

    # Build and Run
    cd /opt/apps/harvest-app/ && make build
    cd /opt/apps/harvest-app/ && make sass
    cd /opt/apps/harvest-app/ && make collect
    cd /opt/apps/harvest-app/ && /opt/ve/harvest-app/bin/python ./bin/manage.py syncdb --noinput
    cd /opt/apps/harvest-app/ && /opt/ve/harvest-app/bin/python ./bin/manage.py migrate --noinput
    cd /opt/apps/harvest-app/ && /opt/ve/harvest-app/bin/python ./bin/manage.py collectstatic --noinput
    cd /opt/apps/harvest-app/ && /opt/ve/harvest-app/bin/python ./bin/manage.py rebuild_index --noinput
    supervisord -c /opt/supervisor_run.conf -n
fi
