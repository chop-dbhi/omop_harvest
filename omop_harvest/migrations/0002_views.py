# -*- coding: utf-8 -*-
import datetime
import os
from StringIO import StringIO
from south.db import db
from south.v2 import SchemaMigration
from django.db import models
from django.core.management import call_command


class Migration(SchemaMigration):

    def forwards(self, orm):
        sql = """
        BEGIN;
        CREATE MATERIALIZED VIEW omop_person_gender_concept AS SELECT DISTINCT omop_concept.* FROM omop_concept JOIN omop_person ON omop_concept.concept_id = omop_person.gender_concept_id;
        CREATE MATERIALIZED VIEW omop_person_race_concept AS SELECT DISTINCT omop_concept.* FROM omop_concept JOIN omop_person ON omop_concept.concept_id = omop_person.race_concept_id;
        CREATE MATERIALIZED VIEW omop_person_ethnicity_concept AS SELECT DISTINCT omop_concept.* FROM omop_concept JOIN omop_person ON omop_concept.concept_id = omop_person.ethnicity_concept_id;
        CREATE MATERIALIZED VIEW omop_person_location_concept AS SELECT DISTINCT omop_concept.* FROM omop_concept JOIN omop_person ON omop_concept.concept_id = omop_person.location_concept_id;
        CREATE MATERIALIZED VIEW omop_observation_period_person_status_concept AS SELECT DISTINCT omop_concept.* FROM omop_concept JOIN omop_observation_period ON omop_concept.concept_id = omop_observation_period.person_status_concept_id;
        CREATE MATERIALIZED VIEW omop_drug_era_drug_concept AS SELECT DISTINCT omop_concept.* FROM omop_concept JOIN omop_drug_era ON omop_concept.concept_id = omop_drug_era.drug_concept_id;
        CREATE MATERIALIZED VIEW omop_condition_era_condition_concept AS SELECT DISTINCT omop_concept.* FROM omop_concept JOIN omop_condition_era ON omop_concept.concept_id = omop_condition_era.condition_concept_id;
        COMMIT;
        """
        db.execute_many(sql)

    def backwards(self, orm):
        sql = """
        BEGIN;
        DROP MATERIALIZED VIEW omop_person_gender_concept;
        DROP MATERIALIZED VIEW omop_person_race_concept;
        DROP MATERIALIZED VIEW omop_person_ethnicity_concept;
        DROP MATERIALIZED VIEW omop_person_location_concept;
        DROP MATERIALIZED VIEW omop_observation_period_person_status_concept;
        DROP MATERIALIZED VIEW omop_drug_era_drug_concept;
        DROP MATERIALIZED VIEW omop_condition_era_condition_concept;
        COMMIT;
        """
        db.execute_many(sql)

    models = {
        u'omop_harvest.conditionera': {
            'Meta': {'object_name': 'ConditionEra', 'db_table': "u'omop_condition_era'"},
            'condition_concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.ConditionEraConditionConcept']"}),
            'condition_era_end_date': ('django.db.models.fields.DateField', [], {}),
            'condition_era_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'condition_era_start_date': ('django.db.models.fields.DateField', [], {}),
            'condition_occurrence_count': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '4', 'decimal_places': '0', 'blank': 'True'}),
            'condition_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'confidence': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"})
        },
        u'omop_harvest.conditioneraconditionconcept': {
            'Meta': {'object_name': 'ConditionEraConditionConcept', 'db_table': "u'omop_condition_era_condition_concept'", 'managed': 'False'},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.IntegerField', [], {}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.drugera': {
            'Meta': {'object_name': 'DrugEra', 'db_table': "u'omop_drug_era'"},
            'drug_concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.DrugEraDrugConcept']"}),
            'drug_era_end_date': ('django.db.models.fields.DateField', [], {}),
            'drug_era_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'drug_era_start_date': ('django.db.models.fields.DateField', [], {}),
            'drug_exposure_count': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '4', 'decimal_places': '0', 'blank': 'True'}),
            'drug_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"})
        },
        u'omop_harvest.drugeradrugconcept': {
            'Meta': {'object_name': 'DrugEraDrugConcept', 'db_table': "u'omop_drug_era_drug_concept'", 'managed': 'False'},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.IntegerField', [], {}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.observationperiod': {
            'Meta': {'object_name': 'ObservationPeriod', 'db_table': "u'omop_observation_period'"},
            'confidence': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'dx_data_availability': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'hospital_data_availability': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'observation_period_end_date': ('django.db.models.fields.DateField', [], {}),
            'observation_period_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'observation_period_start_date': ('django.db.models.fields.DateField', [], {}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'person_status_concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.ObservationPeriodPersonStatusConcept']", 'null': 'True', 'blank': 'True'}),
            'rx_data_availability': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'})
        },
        u'omop_harvest.observationperiodpersonstatusconcept': {
            'Meta': {'object_name': 'ObservationPeriodPersonStatusConcept', 'db_table': "u'omop_observation_period_person_status_concept'", 'managed': 'False'},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.IntegerField', [], {}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.person': {
            'Meta': {'object_name': 'Person', 'db_table': "u'omop_person'"},
            'care_site_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'day_of_birth': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '2', 'decimal_places': '0', 'blank': 'True'}),
            'ethnicity_concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.PersonEthnicityConcept']", 'null': 'True', 'blank': 'True'}),
            'ethnicity_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'gender_concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.PersonGenderConcept']"}),
            'gender_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'location_concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.PersonLocationConcept']", 'null': 'True', 'blank': 'True'}),
            'location_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'month_of_birth': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '2', 'decimal_places': '0', 'blank': 'True'}),
            'person_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'person_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'provider_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'race_concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.PersonRaceConcept']", 'null': 'True', 'blank': 'True'}),
            'race_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'source_location_code': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'year_of_birth': ('django.db.models.fields.DecimalField', [], {'max_digits': '4', 'decimal_places': '0'})
        },
        u'omop_harvest.personethnicityconcept': {
            'Meta': {'object_name': 'PersonEthnicityConcept', 'db_table': "u'omop_person_ethnicity_concept'", 'managed': 'False'},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.IntegerField', [], {}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.persongenderconcept': {
            'Meta': {'object_name': 'PersonGenderConcept', 'db_table': "u'omop_person_gender_concept'", 'managed': 'False'},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.IntegerField', [], {}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.personlocationconcept': {
            'Meta': {'object_name': 'PersonLocationConcept', 'db_table': "u'omop_person_location_concept'", 'managed': 'False'},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.IntegerField', [], {}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.personraceconcept': {
            'Meta': {'object_name': 'PersonRaceConcept', 'db_table': "u'omop_person_race_concept'", 'managed': 'False'},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.IntegerField', [], {}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateField', [], {}),
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {})
        }
    }

    complete_apps = ['omop_harvest']
