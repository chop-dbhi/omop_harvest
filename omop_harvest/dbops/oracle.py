from south.db import oracle
from omop_harvest.dbops import generic as custom

class DatabaseOperations(oracle.DatabaseOperations, custom.DatabaseOperations):
    pass
