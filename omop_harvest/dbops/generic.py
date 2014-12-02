from south.db import generic

class DatabaseOperations(generic.DatabaseOperations):

    def refresh_view(self, model):
        table_name = model._meta.db_table
        self.clear_table(table_name)
        params = {'table_name': self.quote_name(table_name)}
        src_table_name, src_field_name = model.SRC_TABLE_PKEY.split('.')
        params['src_table_name'] = self.quote_name(src_table_name)
        params['src_field_name'] = self.quote_name(src_field_name)
        join_table_name, join_field_name = model.JOIN_TABLE_FIELD.split('.')
        params['join_table_name'] = self.quote_name(join_table_name)
        params['join_field_name'] = self.quote_name(join_field_name)
        field_list = [fld.column for fld in model._meta.fields]
        quoted_fields = [self.quote_name(fld) for fld in field_list]
        params['fields_str'] = ', '.join(quoted_fields)
        self.execute("INSERT INTO %(table_name)s (%(fields_str)s) SELECT"
                     " DISTINCT %(fields_str)s FROM %(src_table_name)s JOIN"
                     " %(join_table_name)s ON %(src_table_name)s."
                     "%(src_field_name)s = %(join_table_name)s."
                     "%(join_field_name)s" % params)
