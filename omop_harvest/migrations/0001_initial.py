# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'CareSite'
        db.create_table(u'omop_care_site', (
            ('care_site_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('location', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Location'], null=True, blank=True)),
            ('organization', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Organization'], null=True, blank=True)),
            ('place_of_service_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('care_site_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('place_of_service_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['CareSite'])

        # Adding model 'Cohort'
        db.create_table(u'omop_cohort', (
            ('cohort_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('cohort_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('cohort_start_date', self.gf('django.db.models.fields.DateField')()),
            ('cohort_end_date', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('subject_id', self.gf('django.db.models.fields.IntegerField')()),
            ('stop_reason', self.gf('django.db.models.fields.CharField')(max_length=20, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['Cohort'])

        # Adding model 'Concept'
        db.create_table(u'omop_concept', (
            ('concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('concept_level', self.gf('django.db.models.fields.IntegerField')()),
            ('concept_class', self.gf('django.db.models.fields.CharField')(max_length=60)),
            ('vocabulary', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Vocabulary'])),
            ('concept_code', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('valid_start_date', self.gf('django.db.models.fields.DateField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateField')()),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['Concept'])

        # Adding model 'ConceptAncestor'
        db.create_table(u'omop_concept_ancestor', (
            ('ancestry_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('ancestor_concept', self.gf('django.db.models.fields.related.ForeignKey')(related_name=u'descendent_relations', to=orm['omop_harvest.Concept'])),
            ('descendant_concept', self.gf('django.db.models.fields.related.ForeignKey')(related_name=u'ancestor_relations', to=orm['omop_harvest.Concept'])),
            ('max_levels_of_separation', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('min_levels_of_separation', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['ConceptAncestor'])

        # Adding model 'ConceptRelationship'
        db.create_table(u'omop_concept_relationship', (
            ('concept_relationship_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept_id_1', self.gf('django.db.models.fields.related.ForeignKey')(related_name=u'relations_to', db_column=u'concept_id_1', to=orm['omop_harvest.Concept'])),
            ('concept_id_2', self.gf('django.db.models.fields.related.ForeignKey')(related_name=u'relations_from', db_column=u'concept_id_2', to=orm['omop_harvest.Concept'])),
            ('relationship', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Relationship'])),
            ('valid_start_date', self.gf('django.db.models.fields.DateField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateField')()),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['ConceptRelationship'])

        # Adding model 'ConceptSynonym'
        db.create_table(u'omop_concept_synonym', (
            ('concept_synonym_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('concept', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Concept'])),
            ('concept_synonym_name', self.gf('django.db.models.fields.CharField')(max_length=1000)),
        ))
        db.send_create_signal(u'omop_harvest', ['ConceptSynonym'])

        # Adding model 'ConditionEra'
        db.create_table(u'omop_condition_era', (
            ('condition_era_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('person', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Person'])),
            ('condition_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('condition_era_start_date', self.gf('django.db.models.fields.DateField')()),
            ('condition_era_end_date', self.gf('django.db.models.fields.DateField')()),
            ('condition_type_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('condition_occurrence_count', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=4, decimal_places=0, blank=True)),
            ('confidence', self.gf('django.db.models.fields.NullBooleanField')(null=True, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['ConditionEra'])

        # Adding model 'ConditionOccurrence'
        db.create_table(u'omop_condition_occurrence', (
            ('condition_occurrence_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('person', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Person'])),
            ('condition_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('condition_start_date', self.gf('django.db.models.fields.DateField')()),
            ('condition_end_date', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('condition_type_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('stop_reason', self.gf('django.db.models.fields.CharField')(max_length=20, blank=True)),
            ('associated_provider', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Provider'], null=True, blank=True)),
            ('visit_occurrence', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.VisitOccurrence'], null=True, blank=True)),
            ('condition_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['ConditionOccurrence'])

        # Adding model 'Death'
        db.create_table(u'omop_death', (
            ('person_death_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('person', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Person'])),
            ('death_date', self.gf('django.db.models.fields.DateField')()),
            ('death_type_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('cause_of_death_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('cause_of_death_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['Death'])

        # Adding model 'DrugApproval'
        db.create_table(u'omop_drug_approval', (
            ('ingredient_concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('approval_date', self.gf('django.db.models.fields.DateField')()),
            ('approved_by', self.gf('django.db.models.fields.CharField')(max_length=20)),
        ))
        db.send_create_signal(u'omop_harvest', ['DrugApproval'])

        # Adding model 'DrugCost'
        db.create_table(u'omop_drug_cost', (
            ('drug_cost_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('drug_exposure', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.DrugExposure'])),
            ('paid_copay', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('paid_coinsurance', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('paid_toward_deductible', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('paid_by_payer', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('paid_by_coordination_benefits', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('total_out_of_pocket', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('total_paid', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('ingredient_cost', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('dispensing_fee', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('average_wholesale_price', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('payer_plan_period', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.PayerPlanPeriod'], null=True, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['DrugCost'])

        # Adding model 'DrugEra'
        db.create_table(u'omop_drug_era', (
            ('drug_era_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('person', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Person'])),
            ('drug_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('drug_era_start_date', self.gf('django.db.models.fields.DateField')()),
            ('drug_era_end_date', self.gf('django.db.models.fields.DateField')()),
            ('drug_type_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('drug_exposure_count', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=4, decimal_places=0, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['DrugEra'])

        # Adding model 'DrugExposure'
        db.create_table(u'omop_drug_exposure', (
            ('drug_exposure_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('person', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Person'])),
            ('drug_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('drug_exposure_start_date', self.gf('django.db.models.fields.DateField')()),
            ('drug_exposure_end_date', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('drug_type_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('stop_reason', self.gf('django.db.models.fields.CharField')(max_length=20, blank=True)),
            ('refills', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=3, decimal_places=0, blank=True)),
            ('quantity', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=4, decimal_places=0, blank=True)),
            ('days_supply', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=4, decimal_places=0, blank=True)),
            ('sig', self.gf('django.db.models.fields.CharField')(max_length=500, blank=True)),
            ('prescribing_provider', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Provider'], null=True, blank=True)),
            ('visit_occurrence', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.VisitOccurrence'], null=True, blank=True)),
            ('relevant_condition_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('drug_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['DrugExposure'])

        # Adding model 'DrugStrength'
        db.create_table(u'omop_drug_strength', (
            ('drug_concept_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('ingredient_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('amount_value', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=50, decimal_places=0, blank=True)),
            ('amount_unit', self.gf('django.db.models.fields.CharField')(max_length=60, blank=True)),
            ('concentration_value', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=50, decimal_places=0, blank=True)),
            ('concentration_enum_unit', self.gf('django.db.models.fields.CharField')(max_length=60, blank=True)),
            ('concentration_denom_unit', self.gf('django.db.models.fields.CharField')(max_length=60, blank=True)),
            ('valid_start_date', self.gf('django.db.models.fields.DateField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateField')()),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['DrugStrength'])

        # Adding model 'Location'
        db.create_table(u'omop_location', (
            ('location_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('address_1', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('address_2', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('city', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('state', self.gf('django.db.models.fields.CharField')(max_length=2, blank=True)),
            ('zip', self.gf('django.db.models.fields.CharField')(max_length=9, blank=True)),
            ('county', self.gf('django.db.models.fields.CharField')(max_length=20, blank=True)),
            ('location_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['Location'])

        # Adding model 'Observation'
        db.create_table(u'omop_observation', (
            ('observation_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('person', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Person'])),
            ('observation_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('observation_date', self.gf('django.db.models.fields.DateField')()),
            ('observation_time', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('value_as_number', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=14, decimal_places=3, blank=True)),
            ('value_as_string', self.gf('django.db.models.fields.CharField')(max_length=60, blank=True)),
            ('value_as_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('unit_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('range_low', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=14, decimal_places=3, blank=True)),
            ('range_high', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=14, decimal_places=3, blank=True)),
            ('observation_type_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('associated_provider', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Provider'])),
            ('visit_occurrence', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.VisitOccurrence'], null=True, blank=True)),
            ('relevant_condition_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('observation_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('units_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['Observation'])

        # Adding model 'ObservationPeriod'
        db.create_table(u'omop_observation_period', (
            ('observation_period_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('person', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Person'])),
            ('observation_period_start_date', self.gf('django.db.models.fields.DateField')()),
            ('observation_period_end_date', self.gf('django.db.models.fields.DateField')()),
            ('person_status_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('rx_data_availability', self.gf('django.db.models.fields.CharField')(max_length=1, blank=True)),
            ('dx_data_availability', self.gf('django.db.models.fields.CharField')(max_length=1, blank=True)),
            ('hospital_data_availability', self.gf('django.db.models.fields.CharField')(max_length=1, blank=True)),
            ('confidence', self.gf('django.db.models.fields.NullBooleanField')(null=True, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['ObservationPeriod'])

        # Adding model 'Organization'
        db.create_table(u'omop_organization', (
            ('organization_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('place_of_service_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('location', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Location'], null=True, blank=True)),
            ('organization_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('place_of_service_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['Organization'])

        # Adding model 'PayerPlanPeriod'
        db.create_table(u'omop_payer_plan_period', (
            ('payer_plan_period_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('person', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Person'])),
            ('payer_plan_period_start_date', self.gf('django.db.models.fields.DateField')()),
            ('payer_plan_period_end_date', self.gf('django.db.models.fields.DateField')()),
            ('payer_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('plan_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('family_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['PayerPlanPeriod'])

        # Adding model 'Person'
        db.create_table(u'omop_person', (
            ('person_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('gender_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('year_of_birth', self.gf('django.db.models.fields.DecimalField')(max_digits=4, decimal_places=0)),
            ('month_of_birth', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=2, decimal_places=0, blank=True)),
            ('day_of_birth', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=2, decimal_places=0, blank=True)),
            ('race_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('ethnicity_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('location', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Location'], null=True, blank=True)),
            ('provider', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Provider'], null=True, blank=True)),
            ('care_site', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.CareSite'], null=True, blank=True)),
            ('person_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('gender_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('race_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('ethnicity_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('location_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('source_location_code', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['Person'])

        # Adding model 'ProcedureCost'
        db.create_table(u'omop_procedure_cost', (
            ('procedure_cost_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('procedure_occurrence', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.ProcedureOccurrence'])),
            ('paid_copay', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('paid_coinsurance', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('paid_toward_deductible', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('paid_by_payer', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('paid_by_coordination_benefits', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('total_out_of_pocket', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('total_paid', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=8, decimal_places=2, blank=True)),
            ('disease_class_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('revenue_code_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('payer_plan_period', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.PayerPlanPeriod'], null=True, blank=True)),
            ('disease_class_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
            ('revenue_code_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['ProcedureCost'])

        # Adding model 'ProcedureOccurrence'
        db.create_table(u'omop_procedure_occurrence', (
            ('procedure_occurrence_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('person', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Person'])),
            ('procedure_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('procedure_date', self.gf('django.db.models.fields.DateField')()),
            ('procedure_type_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('associated_provider', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Provider'], null=True, blank=True)),
            ('visit_occurrence', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.VisitOccurrence'], null=True, blank=True)),
            ('relevant_condition_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('procedure_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['ProcedureOccurrence'])

        # Adding model 'Provider'
        db.create_table(u'omop_provider', (
            ('provider_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('npi', self.gf('django.db.models.fields.CharField')(max_length=20, blank=True)),
            ('dea', self.gf('django.db.models.fields.CharField')(max_length=20, blank=True)),
            ('specialty_concept_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('care_site', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.CareSite'], null=True, blank=True)),
            ('provider_source_value', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('specialty_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['Provider'])

        # Adding model 'Relationship'
        db.create_table(u'omop_relationship', (
            ('relationship_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('relationship_name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('is_hierarchical', self.gf('django.db.models.fields.IntegerField')()),
            ('defines_ancestry', self.gf('django.db.models.fields.IntegerField')()),
            ('reverse_relationship', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['Relationship'])

        # Adding model 'SourceToConceptMap'
        db.create_table(u'omop_source_to_concept_map', (
            ('source_to_concept_map_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('source_code', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('source_vocabulary', self.gf('django.db.models.fields.related.ForeignKey')(related_name=u'source_for_mappings', to=orm['omop_harvest.Vocabulary'])),
            ('source_code_description', self.gf('django.db.models.fields.CharField')(max_length=256, blank=True)),
            ('target_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('target_vocabulary', self.gf('django.db.models.fields.related.ForeignKey')(related_name=u'target_of_mappings', to=orm['omop_harvest.Vocabulary'])),
            ('mapping_type', self.gf('django.db.models.fields.CharField')(max_length=20, blank=True)),
            ('primary_map', self.gf('django.db.models.fields.CharField')(max_length=1, blank=True)),
            ('valid_start_date', self.gf('django.db.models.fields.DateField')()),
            ('valid_end_date', self.gf('django.db.models.fields.DateField')()),
            ('invalid_reason', self.gf('django.db.models.fields.CharField')(max_length=1, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['SourceToConceptMap'])

        # Adding model 'VisitOccurrence'
        db.create_table(u'omop_visit_occurrence', (
            ('visit_occurrence_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('person', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['omop_harvest.Person'])),
            ('visit_start_date', self.gf('django.db.models.fields.DateField')()),
            ('visit_end_date', self.gf('django.db.models.fields.DateField')()),
            ('place_of_service_concept_id', self.gf('django.db.models.fields.IntegerField')()),
            ('care_site_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('place_of_service_source_value', self.gf('django.db.models.fields.CharField')(max_length=50, blank=True)),
        ))
        db.send_create_signal(u'omop_harvest', ['VisitOccurrence'])

        # Adding model 'Vocabulary'
        db.create_table(u'omop_vocabulary', (
            ('vocabulary_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('vocabulary_name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=256)),
        ))
        db.send_create_signal(u'omop_harvest', ['Vocabulary'])


    def backwards(self, orm):
        # Deleting model 'CareSite'
        db.delete_table(u'omop_care_site')

        # Deleting model 'Cohort'
        db.delete_table(u'omop_cohort')

        # Deleting model 'Concept'
        db.delete_table(u'omop_concept')

        # Deleting model 'ConceptAncestor'
        db.delete_table(u'omop_concept_ancestor')

        # Deleting model 'ConceptRelationship'
        db.delete_table(u'omop_concept_relationship')

        # Deleting model 'ConceptSynonym'
        db.delete_table(u'omop_concept_synonym')

        # Deleting model 'ConditionEra'
        db.delete_table(u'omop_condition_era')

        # Deleting model 'ConditionOccurrence'
        db.delete_table(u'omop_condition_occurrence')

        # Deleting model 'Death'
        db.delete_table(u'omop_death')

        # Deleting model 'DrugApproval'
        db.delete_table(u'omop_drug_approval')

        # Deleting model 'DrugCost'
        db.delete_table(u'omop_drug_cost')

        # Deleting model 'DrugEra'
        db.delete_table(u'omop_drug_era')

        # Deleting model 'DrugExposure'
        db.delete_table(u'omop_drug_exposure')

        # Deleting model 'DrugStrength'
        db.delete_table(u'omop_drug_strength')

        # Deleting model 'Location'
        db.delete_table(u'omop_location')

        # Deleting model 'Observation'
        db.delete_table(u'omop_observation')

        # Deleting model 'ObservationPeriod'
        db.delete_table(u'omop_observation_period')

        # Deleting model 'Organization'
        db.delete_table(u'omop_organization')

        # Deleting model 'PayerPlanPeriod'
        db.delete_table(u'omop_payer_plan_period')

        # Deleting model 'Person'
        db.delete_table(u'omop_person')

        # Deleting model 'ProcedureCost'
        db.delete_table(u'omop_procedure_cost')

        # Deleting model 'ProcedureOccurrence'
        db.delete_table(u'omop_procedure_occurrence')

        # Deleting model 'Provider'
        db.delete_table(u'omop_provider')

        # Deleting model 'Relationship'
        db.delete_table(u'omop_relationship')

        # Deleting model 'SourceToConceptMap'
        db.delete_table(u'omop_source_to_concept_map')

        # Deleting model 'VisitOccurrence'
        db.delete_table(u'omop_visit_occurrence')

        # Deleting model 'Vocabulary'
        db.delete_table(u'omop_vocabulary')


    models = {
        u'omop_harvest.caresite': {
            'Meta': {'object_name': 'CareSite', 'db_table': "u'omop_care_site'"},
            'care_site_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'care_site_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Location']", 'null': 'True', 'blank': 'True'}),
            'organization': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Organization']", 'null': 'True', 'blank': 'True'}),
            'place_of_service_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'place_of_service_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'})
        },
        u'omop_harvest.cohort': {
            'Meta': {'object_name': 'Cohort', 'db_table': "u'omop_cohort'"},
            'cohort_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'cohort_end_date': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'cohort_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'cohort_start_date': ('django.db.models.fields.DateField', [], {}),
            'stop_reason': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'}),
            'subject_id': ('django.db.models.fields.IntegerField', [], {})
        },
        u'omop_harvest.concept': {
            'Meta': {'object_name': 'Concept', 'db_table': "u'omop_concept'"},
            'concept_class': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'concept_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_level': ('django.db.models.fields.IntegerField', [], {}),
            'concept_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateField', [], {}),
            'vocabulary': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Vocabulary']"})
        },
        u'omop_harvest.conceptancestor': {
            'Meta': {'object_name': 'ConceptAncestor', 'db_table': "u'omop_concept_ancestor'"},
            'ancestor_concept': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'descendent_relations'", 'to': u"orm['omop_harvest.Concept']"}),
            'ancestry_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'descendant_concept': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'ancestor_relations'", 'to': u"orm['omop_harvest.Concept']"}),
            'max_levels_of_separation': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'min_levels_of_separation': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.conceptrelationship': {
            'Meta': {'object_name': 'ConceptRelationship', 'db_table': "u'omop_concept_relationship'"},
            'concept_id_1': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'relations_to'", 'db_column': "u'concept_id_1'", 'to': u"orm['omop_harvest.Concept']"}),
            'concept_id_2': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'relations_from'", 'db_column': "u'concept_id_2'", 'to': u"orm['omop_harvest.Concept']"}),
            'concept_relationship_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'relationship': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Relationship']"}),
            'valid_end_date': ('django.db.models.fields.DateField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateField', [], {})
        },
        u'omop_harvest.conceptsynonym': {
            'Meta': {'object_name': 'ConceptSynonym', 'db_table': "u'omop_concept_synonym'"},
            'concept': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Concept']"}),
            'concept_synonym_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'concept_synonym_name': ('django.db.models.fields.CharField', [], {'max_length': '1000'})
        },
        u'omop_harvest.conditionera': {
            'Meta': {'object_name': 'ConditionEra', 'db_table': "u'omop_condition_era'"},
            'condition_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'condition_era_end_date': ('django.db.models.fields.DateField', [], {}),
            'condition_era_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'condition_era_start_date': ('django.db.models.fields.DateField', [], {}),
            'condition_occurrence_count': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '4', 'decimal_places': '0', 'blank': 'True'}),
            'condition_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'confidence': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"})
        },
        u'omop_harvest.conditionoccurrence': {
            'Meta': {'object_name': 'ConditionOccurrence', 'db_table': "u'omop_condition_occurrence'"},
            'associated_provider': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Provider']", 'null': 'True', 'blank': 'True'}),
            'condition_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'condition_end_date': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'condition_occurrence_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'condition_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'condition_start_date': ('django.db.models.fields.DateField', [], {}),
            'condition_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'stop_reason': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'}),
            'visit_occurrence': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.VisitOccurrence']", 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.death': {
            'Meta': {'object_name': 'Death', 'db_table': "u'omop_death'"},
            'cause_of_death_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'cause_of_death_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'death_date': ('django.db.models.fields.DateField', [], {}),
            'death_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'person_death_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'})
        },
        u'omop_harvest.drugapproval': {
            'Meta': {'object_name': 'DrugApproval', 'db_table': "u'omop_drug_approval'"},
            'approval_date': ('django.db.models.fields.DateField', [], {}),
            'approved_by': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'ingredient_concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'})
        },
        u'omop_harvest.drugcost': {
            'Meta': {'object_name': 'DrugCost', 'db_table': "u'omop_drug_cost'"},
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
            'Meta': {'object_name': 'DrugEra', 'db_table': "u'omop_drug_era'"},
            'drug_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'drug_era_end_date': ('django.db.models.fields.DateField', [], {}),
            'drug_era_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'drug_era_start_date': ('django.db.models.fields.DateField', [], {}),
            'drug_exposure_count': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '4', 'decimal_places': '0', 'blank': 'True'}),
            'drug_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"})
        },
        u'omop_harvest.drugexposure': {
            'Meta': {'object_name': 'DrugExposure', 'db_table': "u'omop_drug_exposure'"},
            'days_supply': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '4', 'decimal_places': '0', 'blank': 'True'}),
            'drug_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'drug_exposure_end_date': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'drug_exposure_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'drug_exposure_start_date': ('django.db.models.fields.DateField', [], {}),
            'drug_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'drug_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'prescribing_provider': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Provider']", 'null': 'True', 'blank': 'True'}),
            'quantity': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '4', 'decimal_places': '0', 'blank': 'True'}),
            'refills': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '3', 'decimal_places': '0', 'blank': 'True'}),
            'relevant_condition_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'sig': ('django.db.models.fields.CharField', [], {'max_length': '500', 'blank': 'True'}),
            'stop_reason': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'}),
            'visit_occurrence': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.VisitOccurrence']", 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.drugstrength': {
            'Meta': {'object_name': 'DrugStrength', 'db_table': "u'omop_drug_strength'"},
            'amount_unit': ('django.db.models.fields.CharField', [], {'max_length': '60', 'blank': 'True'}),
            'amount_value': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '50', 'decimal_places': '0', 'blank': 'True'}),
            'concentration_denom_unit': ('django.db.models.fields.CharField', [], {'max_length': '60', 'blank': 'True'}),
            'concentration_enum_unit': ('django.db.models.fields.CharField', [], {'max_length': '60', 'blank': 'True'}),
            'concentration_value': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '50', 'decimal_places': '0', 'blank': 'True'}),
            'drug_concept_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'ingredient_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'valid_end_date': ('django.db.models.fields.DateField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateField', [], {})
        },
        u'omop_harvest.location': {
            'Meta': {'object_name': 'Location', 'db_table': "u'omop_location'"},
            'address_1': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'address_2': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'county': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'}),
            'location_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'location_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'state': ('django.db.models.fields.CharField', [], {'max_length': '2', 'blank': 'True'}),
            'zip': ('django.db.models.fields.CharField', [], {'max_length': '9', 'blank': 'True'})
        },
        u'omop_harvest.observation': {
            'Meta': {'object_name': 'Observation', 'db_table': "u'omop_observation'"},
            'associated_provider': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Provider']"}),
            'observation_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'observation_date': ('django.db.models.fields.DateField', [], {}),
            'observation_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'observation_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'observation_time': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'observation_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'range_high': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '14', 'decimal_places': '3', 'blank': 'True'}),
            'range_low': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '14', 'decimal_places': '3', 'blank': 'True'}),
            'relevant_condition_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'unit_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'units_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'value_as_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'value_as_number': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '14', 'decimal_places': '3', 'blank': 'True'}),
            'value_as_string': ('django.db.models.fields.CharField', [], {'max_length': '60', 'blank': 'True'}),
            'visit_occurrence': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.VisitOccurrence']", 'null': 'True', 'blank': 'True'})
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
            'person_status_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rx_data_availability': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'})
        },
        u'omop_harvest.organization': {
            'Meta': {'object_name': 'Organization', 'db_table': "u'omop_organization'"},
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Location']", 'null': 'True', 'blank': 'True'}),
            'organization_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'organization_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'place_of_service_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'place_of_service_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'})
        },
        u'omop_harvest.payerplanperiod': {
            'Meta': {'object_name': 'PayerPlanPeriod', 'db_table': "u'omop_payer_plan_period'"},
            'family_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'payer_plan_period_end_date': ('django.db.models.fields.DateField', [], {}),
            'payer_plan_period_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'payer_plan_period_start_date': ('django.db.models.fields.DateField', [], {}),
            'payer_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'plan_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'})
        },
        u'omop_harvest.person': {
            'Meta': {'object_name': 'Person', 'db_table': "u'omop_person'"},
            'care_site': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.CareSite']", 'null': 'True', 'blank': 'True'}),
            'day_of_birth': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '2', 'decimal_places': '0', 'blank': 'True'}),
            'ethnicity_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'ethnicity_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'gender_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'gender_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'location': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Location']", 'null': 'True', 'blank': 'True'}),
            'location_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'month_of_birth': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '2', 'decimal_places': '0', 'blank': 'True'}),
            'person_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'person_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'provider': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Provider']", 'null': 'True', 'blank': 'True'}),
            'race_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'race_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'source_location_code': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'year_of_birth': ('django.db.models.fields.DecimalField', [], {'max_digits': '4', 'decimal_places': '0'})
        },
        u'omop_harvest.procedurecost': {
            'Meta': {'object_name': 'ProcedureCost', 'db_table': "u'omop_procedure_cost'"},
            'disease_class_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'disease_class_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'paid_by_coordination_benefits': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_by_payer': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_coinsurance': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_copay': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'paid_toward_deductible': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'payer_plan_period': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.PayerPlanPeriod']", 'null': 'True', 'blank': 'True'}),
            'procedure_cost_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'procedure_occurrence': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.ProcedureOccurrence']"}),
            'revenue_code_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'revenue_code_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'total_out_of_pocket': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'}),
            'total_paid': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '8', 'decimal_places': '2', 'blank': 'True'})
        },
        u'omop_harvest.procedureoccurrence': {
            'Meta': {'object_name': 'ProcedureOccurrence', 'db_table': "u'omop_procedure_occurrence'"},
            'associated_provider': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Provider']", 'null': 'True', 'blank': 'True'}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'procedure_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'procedure_date': ('django.db.models.fields.DateField', [], {}),
            'procedure_occurrence_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'procedure_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'procedure_type_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'relevant_condition_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'visit_occurrence': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.VisitOccurrence']", 'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.provider': {
            'Meta': {'object_name': 'Provider', 'db_table': "u'omop_provider'"},
            'care_site': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.CareSite']", 'null': 'True', 'blank': 'True'}),
            'dea': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'}),
            'npi': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'}),
            'provider_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'provider_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'specialty_concept_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'specialty_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'})
        },
        u'omop_harvest.relationship': {
            'Meta': {'object_name': 'Relationship', 'db_table': "u'omop_relationship'"},
            'defines_ancestry': ('django.db.models.fields.IntegerField', [], {}),
            'is_hierarchical': ('django.db.models.fields.IntegerField', [], {}),
            'relationship_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'relationship_name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'reverse_relationship': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'})
        },
        u'omop_harvest.sourcetoconceptmap': {
            'Meta': {'object_name': 'SourceToConceptMap', 'db_table': "u'omop_source_to_concept_map'"},
            'invalid_reason': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'mapping_type': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'}),
            'primary_map': ('django.db.models.fields.CharField', [], {'max_length': '1', 'blank': 'True'}),
            'source_code': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'source_code_description': ('django.db.models.fields.CharField', [], {'max_length': '256', 'blank': 'True'}),
            'source_to_concept_map_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'source_vocabulary': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'source_for_mappings'", 'to': u"orm['omop_harvest.Vocabulary']"}),
            'target_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'target_vocabulary': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "u'target_of_mappings'", 'to': u"orm['omop_harvest.Vocabulary']"}),
            'valid_end_date': ('django.db.models.fields.DateField', [], {}),
            'valid_start_date': ('django.db.models.fields.DateField', [], {})
        },
        u'omop_harvest.visitoccurrence': {
            'Meta': {'object_name': 'VisitOccurrence', 'db_table': "u'omop_visit_occurrence'"},
            'care_site_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'person': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['omop_harvest.Person']"}),
            'place_of_service_concept_id': ('django.db.models.fields.IntegerField', [], {}),
            'place_of_service_source_value': ('django.db.models.fields.CharField', [], {'max_length': '50', 'blank': 'True'}),
            'visit_end_date': ('django.db.models.fields.DateField', [], {}),
            'visit_occurrence_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'visit_start_date': ('django.db.models.fields.DateField', [], {})
        },
        u'omop_harvest.vocabulary': {
            'Meta': {'object_name': 'Vocabulary', 'db_table': "u'omop_vocabulary'"},
            'vocabulary_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'vocabulary_name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '256'})
        }
    }

    complete_apps = ['omop_harvest']