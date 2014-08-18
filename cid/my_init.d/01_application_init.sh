#!/bin/bash
APP_DIR=/opt/app/

cd $APP_DIR

source /opt/ve/bin/activate

python bin/manage.py syncdb --noinput
#python bin/manage.py migrate --noinput
python bin/manage.py collectstatic --noinput

deactivate
