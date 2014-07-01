#!/bin/sh

ARGS="$@"

if [ ! $ARGS ]; then
    ARGS="harvest_project"
fi

DJANGO_SETTINGS_MODULE='tests.settings' PYTHONPATH=. `which django-admin.py` test $ARGS
