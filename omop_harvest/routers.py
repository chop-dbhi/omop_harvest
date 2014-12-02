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
        return None

    def db_for_write(self, model, **hints):
        if model._meta.app_label == self.app_name:
            return self.database_name
        return None

    def allow_syncdb(self, db, model):
        if db == self.database_name:
            return model._meta.app_label in (self.app_name, 'south')
        elif model._meta.app_label == self.app_name:
            return False
        return None
