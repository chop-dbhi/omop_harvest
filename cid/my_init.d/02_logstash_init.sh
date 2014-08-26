#!/bin/bash
APP_DIR=/opt/app/

cd $APP_DIR

source /opt/ve/bin/activate

# Get Container/App Run Time Settings
cd /opt/app/ && /opt/ve/bin/fab get_configuration:noinput=True

# Get Container/App Run Time Logging Config
cd /opt/app/cid/lib/logstash && /opt/ve/bin/python init.py

deactivate
