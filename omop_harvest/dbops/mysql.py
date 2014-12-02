from south.db import mysql
from omop_harvest.dbops import generic as custom

class DatabaseOperations(mysql.DatabaseOperations, custom.DatabaseOperations):
    pass
