from south.db import sqlite3 as sqlite
from omop_harvest.dbops import generic as custom

class DatabaseOperations(sqlite.DatabaseOperations, custom.DatabaseOperations):
    pass
