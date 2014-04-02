# -*- coding: utf-8 -*-
from south.v2 import DataMigration

class Migration(DataMigration):

    depends_on = (
       ("avocado", "0031_auto__add_field_dataquery_tree__add_field_datacontext_tree"),
    )

    def forwards(self, orm):
        "Perform a 'safe' load using Avocado's backup utilities."
        from avocado.core import backup
        backup.safe_load(u'0001_avocado_metadata', backup_path=None,
            using='default')

    def backwards(self, orm):
        "No backwards migration applicable."
        pass
