class OmopRouter(object):
    """Router for omop_harvest. If the model is defined in this app, then
    read from the omop database. And if a syncdb is attempted against the
    omop database, return False. All other operations will get passed to
    the default (harvest) database.
    """
    app_name = 'omop_harvest'
    database_name = 'omop'

    def db_for_read(self, model, **hints):
        if model._meta.app_label == self.app_name:
            return self.database_name

    def allow_syncdb(self, db, model):
        if db == self.database_name:
            return False
