# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'ObservationConcept'
        db.create_table(u'observation_concept', (
            ('concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('concept_level', self.gf('django.db.models.fields.DecimalField')(max_digits=38, decimal_places=0)),
            ('concept_class', self.gf('django.db.models.fields.CharField')(max_length=60)),
            ('concept_code', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('valid_start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2099, 12, 31, 0, 0))),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, null=True, blank=True)),
            ('vocabulary_id', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'omop_harvest', ['ObservationConcept'])

        # Adding model 'Race'
        db.create_table(u'race', (
            ('concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('concept_level', self.gf('django.db.models.fields.DecimalField')(max_digits=38, decimal_places=0)),
            ('concept_class', self.gf('django.db.models.fields.CharField')(max_length=60)),
            ('concept_code', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('valid_start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2099, 12, 31, 0, 0))),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, null=True, blank=True)),
            ('vocabulary_id', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'omop_harvest', ['Race'])

        # Adding model 'ConditionConcept'
        db.create_table(u'condition_concept', (
            ('concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('concept_level', self.gf('django.db.models.fields.DecimalField')(max_digits=38, decimal_places=0)),
            ('concept_class', self.gf('django.db.models.fields.CharField')(max_length=60)),
            ('concept_code', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('valid_start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2099, 12, 31, 0, 0))),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, null=True, blank=True)),
            ('vocabulary_id', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'omop_harvest', ['ConditionConcept'])

        # Adding model 'Gender'
        db.create_table(u'gender', (
            ('concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('concept_level', self.gf('django.db.models.fields.DecimalField')(max_digits=38, decimal_places=0)),
            ('concept_class', self.gf('django.db.models.fields.CharField')(max_length=60)),
            ('concept_code', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('valid_start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2099, 12, 31, 0, 0))),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, null=True, blank=True)),
            ('vocabulary_id', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'omop_harvest', ['Gender'])

        # Adding model 'ProcedureConcept'
        db.create_table(u'procedure_concept', (
            ('concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('concept_level', self.gf('django.db.models.fields.DecimalField')(max_digits=38, decimal_places=0)),
            ('concept_class', self.gf('django.db.models.fields.CharField')(max_length=60)),
            ('concept_code', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('valid_start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2099, 12, 31, 0, 0))),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, null=True, blank=True)),
            ('vocabulary_id', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'omop_harvest', ['ProcedureConcept'])

        # Adding model 'ConditionType'
        db.create_table(u'condition_type', (
            ('concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('concept_level', self.gf('django.db.models.fields.DecimalField')(max_digits=38, decimal_places=0)),
            ('concept_class', self.gf('django.db.models.fields.CharField')(max_length=60)),
            ('concept_code', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('valid_start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2099, 12, 31, 0, 0))),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, null=True, blank=True)),
            ('vocabulary_id', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'omop_harvest', ['ConditionType'])

        # Adding model 'Ethnicity'
        db.create_table(u'ethnicity', (
            ('concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('concept_level', self.gf('django.db.models.fields.DecimalField')(max_digits=38, decimal_places=0)),
            ('concept_class', self.gf('django.db.models.fields.CharField')(max_length=60)),
            ('concept_code', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('valid_start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2099, 12, 31, 0, 0))),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, null=True, blank=True)),
            ('vocabulary_id', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'omop_harvest', ['Ethnicity'])

        # Adding model 'ProcedureType'
        db.create_table(u'procedure_type', (
            ('concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('concept_level', self.gf('django.db.models.fields.DecimalField')(max_digits=38, decimal_places=0)),
            ('concept_class', self.gf('django.db.models.fields.CharField')(max_length=60)),
            ('concept_code', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('valid_start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2099, 12, 31, 0, 0))),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, null=True, blank=True)),
            ('vocabulary_id', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'omop_harvest', ['ProcedureType'])

        # Adding model 'ObservationType'
        db.create_table(u'observation_type', (
            ('concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('concept_level', self.gf('django.db.models.fields.DecimalField')(max_digits=38, decimal_places=0)),
            ('concept_class', self.gf('django.db.models.fields.CharField')(max_length=60)),
            ('concept_code', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('valid_start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2099, 12, 31, 0, 0))),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, null=True, blank=True)),
            ('vocabulary_id', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'omop_harvest', ['ObservationType'])

        # The alter_column to ForeignKey statements below are commented out
        # since we don't actually want the database to enforce referential
        # integrity on the concept view tables (in order to be able to load
        # data into the referencing tables and refresh the view data).

        # Changing field 'Observation.observation_concept_id'
        # db.alter_column(u'observation', u'observation_concept_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.ObservationConcept'], db_column=u'observation_concept_id'))
        # Adding index on 'Observation', fields ['observation_concept_id']
        db.create_index(u'observation', [u'observation_concept_id'])


        # Changing field 'Observation.observation_type_concept_id'
        # db.alter_column(u'observation', u'observation_type_concept_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.ObservationType'], db_column=u'observation_type_concept_id'))
        # Adding index on 'Observation', fields ['observation_type_concept_id']
        db.create_index(u'observation', [u'observation_type_concept_id'])


        # Changing field 'ConditionOccurrence.condition_concept_id'
        # db.alter_column(u'condition_occurrence', u'condition_concept_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.ConditionConcept'], db_column=u'condition_concept_id'))
        # Adding index on 'ConditionOccurrence', fields ['condition_concept_id']
        db.create_index(u'condition_occurrence', [u'condition_concept_id'])


        # Changing field 'ConditionOccurrence.condition_type_concept_id'
        # db.alter_column(u'condition_occurrence', u'condition_type_concept_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.ConditionType'], db_column=u'condition_type_concept_id'))
        # Adding index on 'ConditionOccurrence', fields ['condition_type_concept_id']
        db.create_index(u'condition_occurrence', [u'condition_type_concept_id'])


        # Changing field 'Person.ethnicity_concept_id'
        # db.alter_column(u'person', u'ethnicity_concept_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Ethnicity'], null=True, db_column=u'ethnicity_concept_id'))
        # Adding index on 'Person', fields ['ethnicity_concept_id']
        db.create_index(u'person', [u'ethnicity_concept_id'])


        # Changing field 'Person.gender_concept_id'
        # db.alter_column(u'person', u'gender_concept_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Gender'], db_column=u'gender_concept_id'))
        # Adding index on 'Person', fields ['gender_concept_id']
        db.create_index(u'person', [u'gender_concept_id'])


        # Changing field 'Person.race_concept_id'
        # db.alter_column(u'person', u'race_concept_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Race'], null=True, db_column=u'race_concept_id'))
        # Adding index on 'Person', fields ['race_concept_id']
        db.create_index(u'person', [u'race_concept_id'])


        # Changing field 'ProcedureOccurrence.procedure_concept_id'
        # db.alter_column(u'procedure_occurrence', u'procedure_concept_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.ProcedureConcept'], db_column=u'procedure_concept_id'))
        # Adding index on 'ProcedureOccurrence', fields ['procedure_concept_id']
        db.create_index(u'procedure_occurrence', [u'procedure_concept_id'])


        # Changing field 'ProcedureOccurrence.procedure_type_concept_id'
        # db.alter_column(u'procedure_occurrence', u'procedure_type_concept_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.ProcedureType'], db_column=u'procedure_type_concept_id'))
        # Adding index on 'ProcedureOccurrence', fields ['procedure_type_concept_id']
        db.create_index(u'procedure_occurrence', [u'procedure_type_concept_id'])


    def backwards(self, orm):
        # Removing index on 'ProcedureOccurrence', fields ['procedure_type_concept_id']
        db.delete_index(u'procedure_occurrence', [u'procedure_type_concept_id'])

        # Removing index on 'ProcedureOccurrence', fields ['procedure_concept_id']
        db.delete_index(u'procedure_occurrence', [u'procedure_concept_id'])

        # Removing index on 'Person', fields ['race_concept_id']
        db.delete_index(u'person', [u'race_concept_id'])

        # Removing index on 'Person', fields ['gender_concept_id']
        db.delete_index(u'person', [u'gender_concept_id'])

        # Removing index on 'Person', fields ['ethnicity_concept_id']
        db.delete_index(u'person', [u'ethnicity_concept_id'])

        # Removing index on 'ConditionOccurrence', fields ['condition_type_concept_id']
        db.delete_index(u'condition_occurrence', [u'condition_type_concept_id'])

        # Removing index on 'ConditionOccurrence', fields ['condition_concept_id']
        db.delete_index(u'condition_occurrence', [u'condition_concept_id'])

        # Removing index on 'Observation', fields ['observation_type_concept_id']
        db.delete_index(u'observation', [u'observation_type_concept_id'])

        # Removing index on 'Observation', fields ['observation_concept_id']
        db.delete_index(u'observation', [u'observation_concept_id'])

        # Deleting model 'ObservationConcept'
        db.delete_table(u'observation_concept')

        # Deleting model 'Race'
        db.delete_table(u'race')

        # Deleting model 'ConditionConcept'
        db.delete_table(u'condition_concept')

        # Deleting model 'Gender'
        db.delete_table(u'gender')

        # Deleting model 'ProcedureConcept'
        db.delete_table(u'procedure_concept')

        # Deleting model 'ConditionType'
        db.delete_table(u'condition_type')

        # Deleting model 'Ethnicity'
        db.delete_table(u'ethnicity')

        # Deleting model 'ProcedureType'
        db.delete_table(u'procedure_type')

        # Deleting model 'ObservationType'
        db.delete_table(u'observation_type')

        # The alter_column to IntegerField statements are commented out below
        # since the fields are not actually converted to ForeignKey in the
        # forward migration (see comment above).

        # Changing field 'Observation.observation_concept_id'
        # db.alter_column(u'observation', 'observation_concept_id', self.gf('django.db.models.fields.IntegerField')())

        # Changing field 'Observation.observation_type_concept_id'
        # db.alter_column(u'observation', 'observation_type_concept_id', self.gf('django.db.models.fields.IntegerField')())

        # Changing field 'ConditionOccurrence.condition_concept_id'
        # db.alter_column(u'condition_occurrence', 'condition_concept_id', self.gf('django.db.models.fields.IntegerField')())

        # Changing field 'ConditionOccurrence.condition_type_concept_id'
        # db.alter_column(u'condition_occurrence', 'condition_type_concept_id', self.gf('django.db.models.fields.IntegerField')())

        # Changing field 'Person.ethnicity_concept_id'
        # db.alter_column(u'person', 'ethnicity_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True))

        # Changing field 'Person.gender_concept_id'
        # db.alter_column(u'person', 'gender_concept_id', self.gf('django.db.models.fields.IntegerField')())

        # Changing field 'Person.race_concept_id'
        # db.alter_column(u'person', 'race_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True))

        # Changing field 'ProcedureOccurrence.procedure_concept_id'
        # db.alter_column(u'procedure_occurrence', 'procedure_concept_id', self.gf('django.db.models.fields.IntegerField')())

        # Changing field 'ProcedureOccurrence.procedure_type_concept_id'
        # db.alter_column(u'procedure_occurrence', 'procedure_type_concept_id', self.gf('django.db.models.fields.IntegerField')())

    models = {
        u'omop_harvest.caresite': {
            'Meta': {'object_name': 'CareSite', 'db_table': "u'care_site'"},
            'care_site_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'care_site_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Location']", 'null': 'True', 'blank': 'True'}),
            'organization': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Organization']", 'null': 'True', 'blank': 'True'}),
            'place_of_service_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'place_of_service_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.cohort': {
            'Meta': {'object_name': 'Cohort', 'db_table': "u'cohort'"},
            'cohort_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'cohort_end_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'cohort_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'cohort_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'stop_reason': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'subject_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.concept': {
            'Meta': {'object_name': 'Concept', 'db_table': "u'concept'"},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.DecimalField', [], {'max_digits': '38', 'decimal_places': '0'}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'vocabulary': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Vocabulary']"})
        },
        u'omop_harvest.conceptancestor': {
            'Meta': {'unique_together': "((u'ancestor_concept', u'descendant_concept'),)", 'object_name': 'ConceptAncestor', 'db_table': "u'concept_ancestor'"},
            'ancestor_concept': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'conceptancestor_descendant_set'", 'to': u"orm['omop_harvest.Concept']"}),
            'descendant_concept': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'conceptancestor_ancestor_set'", 'to': u"orm['omop_harvest.Concept']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'max_levels_of_separation': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '38', 'decimal_places': '0', 'blank': 'True'}),
            'min_levels_of_separation': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '38', 'decimal_places': '0', 'blank': 'True'})
        },
        u'omop_harvest.conceptrelationship': {
            'Meta': {'unique_together': "((u'concept_id_1', u'concept_id_2', u'relationship'),)", 'object_name': 'ConceptRelationship', 'db_table': "u'concept_relationship'"},
            'concept_id_1': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'conceptrelationship_2_set'", 'db_column': "u'concept_id_1'", 'to': u"orm['omop_harvest.Concept']"}),
            'concept_id_2': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'conceptrelationship_1_set'", 'db_column': "u'concept_id_2'", 'to': u"orm['omop_harvest.Concept']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'relationship': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Relationship']"}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {})
        },
        u'omop_harvest.conceptsynonym': {
            'Meta': {'object_name': 'ConceptSynonym', 'db_table': "u'concept_synonym'"},
            'concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Concept']"}),
            'concept_synonym_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_synonym_name': ('django.db.models.fields.CharField', [], {'max_length': '1000'})
        },
        u'omop_harvest.conditionconcept': {
            'Meta': {'object_name': 'ConditionConcept', 'db_table': "u'condition_concept'"},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.DecimalField', [], {'max_digits': '38', 'decimal_places': '0'}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.conditionera': {
            'Meta': {'object_name': 'ConditionEra', 'db_table': "u'condition_era'"},
            'condition_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'condition_era_end_date': ('django.db.models.fields.DateTimeField', [], {}),
            'condition_era_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'condition_era_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'condition_occurrence_count': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '4', 'decimal_places': '0', 'blank': 'True'}),
            'condition_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"})
        },
        u'omop_harvest.conditionoccurrence': {
            'Meta': {'object_name': 'ConditionOccurrence', 'db_table': "u'condition_occurrence'"},
            'associated_provider': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Provider']", 'null': 'True', 'blank': 'True'}),
            'condition_concept_id': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.ConditionConcept']", 'db_column': "u'condition_concept_id'"}),
            'condition_end_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'condition_occurrence_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'condition_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'condition_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'condition_type_concept_id': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.ConditionType']", 'db_column': "u'condition_type_concept_id'"}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'stop_reason': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'visit_occurrence': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.VisitOccurrence']", 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.conditiontype': {
            'Meta': {'object_name': 'ConditionType', 'db_table': "u'condition_type'"},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.DecimalField', [], {'max_digits': '38', 'decimal_places': '0'}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.death': {
            'Meta': {'unique_together': "((u'person', u'death_type_concept_id'),)", 'object_name': 'Death', 'db_table': "u'death'"},
            'cause_of_death_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'cause_of_death_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'death_date': ('django.db.models.fields.DateTimeField', [], {}),
            'death_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"})
        },
        u'omop_harvest.drugapproval': {
            'Meta': {'object_name': 'DrugApproval', 'db_table': "u'drug_approval'"},
            'approval_date': ('django.db.models.fields.DateTimeField', [], {}),
            'approved_by': ('django.db.models.fields.CharField', [], {'default': "u'FDA'", 'max_length': '20'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'ingredient_concept_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.drugcost': {
            'Meta': {'object_name': 'DrugCost', 'db_table': "u'drug_cost'"},
            'average_wholesale_price': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'dispensing_fee': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'drug_cost_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'drug_exposure': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.DrugExposure']"}),
            'ingredient_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_by_coordination_benefits': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_by_payer': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_coinsurance': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_copay': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_toward_deductible': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'payer_plan_period': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.PayerPlanPeriod']", 'null': 'True', 'blank': 'True'}),
            'total_out_of_pocket': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'total_paid': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'})
        },
        u'omop_harvest.drugera': {
            'Meta': {'object_name': 'DrugEra', 'db_table': "u'drug_era'"},
            'drug_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'drug_era_end_date': ('django.db.models.fields.DateTimeField', [], {}),
            'drug_era_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'drug_era_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'drug_exposure_count': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '4', 'decimal_places': '0', 'blank': 'True'}),
            'drug_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"})
        },
        u'omop_harvest.drugexposure': {
            'Meta': {'object_name': 'DrugExposure', 'db_table': "u'drug_exposure'"},
            'days_supply': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '4', 'decimal_places': '0', 'blank': 'True'}),
            'drug_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'drug_exposure_end_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'drug_exposure_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'drug_exposure_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'drug_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'drug_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'prescribing_provider': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Provider']", 'null': 'True', 'blank': 'True'}),
            'quantity': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '4', 'decimal_places': '0', 'blank': 'True'}),
            'refills': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '3', 'decimal_places': '0', 'blank': 'True'}),
            'relevant_condition_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'sig': ('django.db.models.fields.CharField', [], {'max_length': '500', 'null': 'True', 'blank': 'True'}),
            'stop_reason': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'visit_occurrence': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.VisitOccurrence']", 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.drugstrength': {
            'Meta': {'object_name': 'DrugStrength', 'db_table': "u'drug_strength'"},
            'amount_unit': ('django.db.models.fields.CharField', [], {'max_length': '60', 'null': 'True', 'blank': 'True'}),
            'amount_value': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '38', 'decimal_places': '0', 'blank': 'True'}),
            'concentration_denom_unit': ('django.db.models.fields.CharField', [], {'max_length': '60', 'null': 'True', 'blank': 'True'}),
            'concentration_enum_unit': ('django.db.models.fields.CharField', [], {'max_length': '60', 'null': 'True', 'blank': 'True'}),
            'concentration_value': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '38', 'decimal_places': '0', 'blank': 'True'}),
            'drug_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'ingredient_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {})
        },
        u'omop_harvest.ethnicity': {
            'Meta': {'object_name': 'Ethnicity', 'db_table': "u'ethnicity'"},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.DecimalField', [], {'max_digits': '38', 'decimal_places': '0'}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.gender': {
            'Meta': {'object_name': 'Gender', 'db_table': "u'gender'"},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.DecimalField', [], {'max_digits': '38', 'decimal_places': '0'}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.location': {
            'Meta': {'object_name': 'Location', 'db_table': "u'location'"},
            'address_1': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'address_2': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'county': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'location_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'location_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'state': ('django.db.models.fields.CharField', [], {'max_length': '2', 'null': 'True', 'blank': 'True'}),
            'zip': ('django.db.models.fields.CharField', [], {'max_length': '9', 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.observation': {
            'Meta': {'object_name': 'Observation', 'db_table': "u'observation'", 'index_together': "[[u'person', u'observation_concept_id']]"},
            'associated_provider': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Provider']", 'null': 'True', 'blank': 'True'}),
            'observation_concept_id': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.ObservationConcept']", 'db_column': "u'observation_concept_id'"}),
            'observation_date': ('django.db.models.fields.DateTimeField', [], {}),
            'observation_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'observation_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'observation_time': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'observation_type_concept_id': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.ObservationType']", 'db_column': "u'observation_type_concept_id'"}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'range_high': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '14', 'decimal_places': '3', 'blank': 'True'}),
            'range_low': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '14', 'decimal_places': '3', 'blank': 'True'}),
            'relevant_condition_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'unit_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'units_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'value_as_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'value_as_number': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '14', 'decimal_places': '3', 'blank': 'True'}),
            'value_as_string': ('django.db.models.fields.CharField', [], {'max_length': '60', 'null': 'True', 'blank': 'True'}),
            'visit_occurrence': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.VisitOccurrence']", 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.observationconcept': {
            'Meta': {'object_name': 'ObservationConcept', 'db_table': "u'observation_concept'"},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.DecimalField', [], {'max_digits': '38', 'decimal_places': '0'}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.observationperiod': {
            'Meta': {'unique_together': "((u'person', u'observation_period_start_date'),)", 'object_name': 'ObservationPeriod', 'db_table': "u'observation_period'"},
            'observation_period_end_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'observation_period_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'observation_period_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"})
        },
        u'omop_harvest.observationtype': {
            'Meta': {'object_name': 'ObservationType', 'db_table': "u'observation_type'"},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.DecimalField', [], {'max_digits': '38', 'decimal_places': '0'}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.organization': {
            'Meta': {'object_name': 'Organization', 'db_table': "u'organization'", 'index_together': "[[u'organization_source_value', u'place_of_service_source_value']]"},
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Location']", 'null': 'True', 'blank': 'True'}),
            'organization_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'organization_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'place_of_service_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'place_of_service_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.payerplanperiod': {
            'Meta': {'object_name': 'PayerPlanPeriod', 'db_table': "u'payer_plan_period'"},
            'family_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'payer_plan_period_end_date': ('django.db.models.fields.DateTimeField', [], {}),
            'payer_plan_period_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'payer_plan_period_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'payer_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'plan_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.person': {
            'Meta': {'object_name': 'Person', 'db_table': "u'person'"},
            'care_site': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.CareSite']", 'null': 'True', 'blank': 'True'}),
            'day_of_birth': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '2', 'decimal_places': '0', 'blank': 'True'}),
            'ethnicity_concept_id': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Ethnicity']", 'null': 'True', 'db_column': "u'ethnicity_concept_id'", 'blank': 'True'}),
            'ethnicity_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'gender_concept_id': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Gender']", 'db_column': "u'gender_concept_id'"}),
            'gender_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Location']", 'null': 'True', 'blank': 'True'}),
            'month_of_birth': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '2', 'decimal_places': '0', 'blank': 'True'}),
            'person_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'person_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'provider': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Provider']", 'null': 'True', 'blank': 'True'}),
            'race_concept_id': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Race']", 'null': 'True', 'db_column': "u'race_concept_id'", 'blank': 'True'}),
            'race_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'year_of_birth': ('django.db.models.fields.DecimalField', [], {'max_digits': '4', 'decimal_places': '0'})
        },
        u'omop_harvest.procedureconcept': {
            'Meta': {'object_name': 'ProcedureConcept', 'db_table': "u'procedure_concept'"},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.DecimalField', [], {'max_digits': '38', 'decimal_places': '0'}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.procedurecost': {
            'Meta': {'object_name': 'ProcedureCost', 'db_table': "u'procedure_cost'"},
            'disease_class_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'disease_class_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'paid_by_coordination_benefits': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_by_payer': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_coinsurance': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_copay': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_toward_deductible': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'payer_plan_period': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.PayerPlanPeriod']", 'null': 'True', 'blank': 'True'}),
            'procedure_cost_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'procedure_occurrence': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.ProcedureOccurrence']"}),
            'revenue_code_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'revenue_code_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'total_out_of_pocket': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'total_paid': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'})
        },
        u'omop_harvest.procedureoccurrence': {
            'Meta': {'object_name': 'ProcedureOccurrence', 'db_table': "u'procedure_occurrence'"},
            'associated_provider': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Provider']", 'null': 'True', 'blank': 'True'}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'procedure_concept_id': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.ProcedureConcept']", 'db_column': "u'procedure_concept_id'"}),
            'procedure_date': ('django.db.models.fields.DateTimeField', [], {}),
            'procedure_occurrence_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'procedure_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'procedure_type_concept_id': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.ProcedureType']", 'db_column': "u'procedure_type_concept_id'"}),
            'relevant_condition_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'visit_occurrence': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.VisitOccurrence']", 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.proceduretype': {
            'Meta': {'object_name': 'ProcedureType', 'db_table': "u'procedure_type'"},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.DecimalField', [], {'max_digits': '38', 'decimal_places': '0'}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.provider': {
            'Meta': {'object_name': 'Provider', 'db_table': "u'provider'"},
            'care_site': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.CareSite']", 'null': 'True', 'blank': 'True'}),
            'dea': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'npi': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'provider_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'provider_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'specialty_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'specialty_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.race': {
            'Meta': {'object_name': 'Race', 'db_table': "u'race'"},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.DecimalField', [], {'max_digits': '38', 'decimal_places': '0'}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.relationship': {
            'Meta': {'object_name': 'Relationship', 'db_table': "u'relationship'"},
            'defines_ancestry': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
            'is_hierarchical': ('django.db.models.fields.IntegerField', [], {}),
            'relationship_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'relationship_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'reverse_relationship': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.sourcetoconceptmap': {
            'Meta': {'unique_together': "((u'source_vocabulary', u'target_concept', u'source_code', u'valid_end_date'),)", 'object_name': 'SourceToConceptMap', 'db_table': "u'source_to_concept_map'"},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'mapping_type': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'primary_map': ('django.db.models.fields.CharField', [], {'max_length': '1', 'null': 'True', 'blank': 'True'}),
            'source_code': ('django.db.models.fields.CharField', [], {'max_length': '40', 'db_index': 'True'}),
            'source_code_description': ('django.db.models.fields.CharField', [], {'max_length': '256', 'null': 'True', 'blank': 'True'}),
            'source_vocabulary': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'sourcetoconceptmap_target_set'", 'to': u"orm['omop_harvest.Vocabulary']"}),
            'target_concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Concept']"}),
            'target_vocabulary': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'sourcetoconceptmap_source_set'", 'to': u"orm['omop_harvest.Vocabulary']"}),
            'valid_end_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2099, 12, 31, 0, 0)'}),
            'valid_start_date': ('django.db.models.fields.DateTimeField', [], {})
        },
        u'omop_harvest.visitoccurrence': {
            'Meta': {'object_name': 'VisitOccurrence', 'db_table': "u'visit_occurrence'", 'index_together': "[[u'person', u'visit_start_date']]"},
            'care_site_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'place_of_service_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'place_of_service_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'visit_end_date': ('django.db.models.fields.DateTimeField', [], {}),
            'visit_occurrence_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'visit_start_date': ('django.db.models.fields.DateTimeField', [], {})
        },
        u'omop_harvest.vocabulary': {
            'Meta': {'object_name': 'Vocabulary', 'db_table': "u'vocabulary'"},
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'vocabulary_name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '256'})
        }
    }

    complete_apps = ['omop_harvest']
