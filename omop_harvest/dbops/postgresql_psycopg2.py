from django.db.models import fields
from south.db import postgresql_psycopg2 as pgsql
from omop_harvest.dbops import generic as custom


class DatabaseOperations(pgsql.DatabaseOperations, custom.DatabaseOperations):
    pass
