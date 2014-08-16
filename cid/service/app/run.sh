#!/bin/bash
if [ "$(ls -A /opt/app)" ]; then
    if [ "$APP_ENV" = "ci" -o "$FORCE_SCRIPT_NAME" = "" ]; then
        exec /usr/local/bin/uwsgi --chdir /opt/app/ --die-on-term --logto /var/log/app/uwsgi.log --http-socket 0.0.0.0:8000 -p 2 -b 32768 -T --master --max-requests 5000 -H /opt/ve/ --static-map $FORCE_SCRIPT_NAME/static=/opt/app/_site/static --static-map /static=/opt/ve/lib/python2.7/site-packages/django/contrib/admin/static --module wsgi:application
    else
        exec /usr/local/bin/uwsgi --chdir /opt/app/ --die-on-term --logto /var/log/app/uwsgi.log --uwsgi-socket 0.0.0.0:8000 -p 2 -b 32768 -T --master --max-requests 5000 -H /opt/ve/ --static-map $FORCE_SCRIPT_NAME/static=/opt/app/_site/static --static-map /static=/opt/ve/lib/python2.7/site-packages/django/contrib/admin/static --module wsgi:application
    fi
fi
