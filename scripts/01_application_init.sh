#!/bin/bash
APP_DIR=/opt/app/

cd $APP_DIR

source /opt/ve/bin/activate

python bin/manage.py syncdb --noinput
if ! $(jq '.omop.create' .project_config.json); then
    python bin/manage.py migrate --noinput --fake omop_harvest 0002
fi
python bin/manage.py migrate --noinput
python bin/manage.py collectstatic --noinput

deactivate
