import os
import json
from .base import *
import dj_database_url

curdir = os.path.dirname(os.path.abspath(__file__))
project_settings = json.loads(open(os.path.join(curdir, '../../.project_config.json'), 'r').read())

# Check here to see if memcache details exist in env
LINKED_MEMCACHE = os.environ.get('MC_PORT_11211_TCP_ADDR')

if 'default' in project_settings['databases']:
    DATABASES['default'] = dj_database_url.parse(project_settings['databases']['default'])
if 'omop' in project_settings['databases']:
    DATABASES['omop'] = dj_database_url.parse(project_settings['databases']['omop'])
    DATABASE_ROUTERS = ('omop_harvest.routers.OmopRouter',)
    SOUTH_DATABASE_ADAPTERS = {
        'omop': 'omop_harvest.dbops.{}'.format(DATABASES['omop']['ENGINE'].split('.')[-1])
    }
else:
    SOUTH_DATABASE_ADAPTERS = {
        'default': 'omop_harvest.dbops.{}'.format(DATABASES['default']['ENGINE'].split('.')[-1])
    }

if LINKED_MEMCACHE:
    CACHES['default'].update({
        'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
        'LOCATION': '{0}:11211'.format(LINKED_MEMCACHE)
    })

EMAIL_HOST = project_settings['django']['EMAIL_HOST']

EMAIL_PORT = project_settings['django']['EMAIL_PORT']

EMAIL_SUBJECT_PREFIX = '[OMOP Harvest] '

DEBUG = project_settings['django']['DEBUG']

FORCE_SCRIPT_NAME = project_settings['django']['FORCE_SCRIPT_NAME']

SECRET_KEY = project_settings['django']['SECRET_KEY']

if FORCE_SCRIPT_NAME:
    ADMIN_MEDIA_PREFIX = os.path.join(FORCE_SCRIPT_NAME, ADMIN_MEDIA_PREFIX[1:])

    STATIC_URL = os.path.join(FORCE_SCRIPT_NAME, STATIC_URL[1:])
    MEDIA_URL = os.path.join(FORCE_SCRIPT_NAME, MEDIA_URL[1:])

    LOGIN_URL = os.path.join(FORCE_SCRIPT_NAME, LOGIN_URL[1:])
    LOGOUT_URL = os.path.join(FORCE_SCRIPT_NAME, LOGOUT_URL[1:])
    LOGIN_REDIRECT_URL = os.path.join(FORCE_SCRIPT_NAME, LOGIN_REDIRECT_URL[1:])
