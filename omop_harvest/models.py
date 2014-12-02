# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.
from __future__ import unicode_literals

from datetime import datetime
from django.db import models
from south.db import dbs
if 'omop' in dbs:
    db = dbs['omop']
else:
    from south.db import db

DELETED = 'D'
UPDATED = 'U'
INVALID_REASON_CHOICES = (
    (DELETED, 'deleted'),
    (UPDATED, 'updated')
)

class ViewManager(models.Manager):

    def refresh(self):
        db.start_transaction()
        db.refresh_view(self.model)
        db.commit_transaction()

class CareSite(models.Model):
    care_site_id = models.IntegerField(primary_key=True)
    location = models.ForeignKey('Location', null=True, blank=True)
    organization = models.ForeignKey('Organization', null=True, blank=True)
    place_of_service_concept_id = models.IntegerField(null=True, blank=True)
    care_site_source_value = models.CharField(max_length=50, null=True, blank=True)
    place_of_service_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'care_site'

class Cohort(models.Model):
    cohort_id = models.IntegerField(primary_key=True)
    cohort_concept_id = models.IntegerField()
    cohort_start_date = models.DateTimeField()
    cohort_end_date = models.DateTimeField(null=True, blank=True)
    subject_id = models.IntegerField()
    stop_reason = models.CharField(max_length=20, blank=True, null=True)
    class Meta:
        db_table = 'cohort'

class ConceptBase(models.Model):
    DELETED = DELETED
    UPDATED = UPDATED
    INVALID_REASON_CHOICES = INVALID_REASON_CHOICES
    concept_id = models.IntegerField(primary_key=True)
    concept_name = models.CharField(max_length=256)
    concept_level = models.DecimalField(max_digits=38, decimal_places=0)
    concept_class = models.CharField(max_length=60)
    concept_code = models.CharField(max_length=40)
    valid_start_date = models.DateTimeField()
    valid_end_date = models.DateTimeField(default=lambda:datetime(2099, 12, 31, 0, 0, 0))
    invalid_reason = models.CharField(max_length=1, blank=True, null=True, choices=INVALID_REASON_CHOICES)

    objects = models.Manager()
    SRC_TABLE_PKEY = 'concept.concept_id'
    JOIN_TABLE_FIELD = 'concept.concept_id'
    view = ViewManager()

    class Meta:
        abstract = True

class Concept(ConceptBase):
    vocabulary = models.ForeignKey('Vocabulary')
    class Meta(ConceptBase.Meta):
        db_table = 'concept'

class Gender(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'person.gender_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'gender'

class Race(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'person.race_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'race'

class Ethnicity(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'person.ethnicity_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'ethnicity'

class ConditionConcept(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'condition_occurrence.condition_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'condition_concept'

class ConditionType(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'condition_occurrence.condition_type_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'condition_type'

class DrugConcept(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'drug_exposure.drug_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'drug_concept'

class DrugType(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'drug_exposure.drug_type_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'drug_type'

class DrugCondition(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'drug_exposure.relevant_condition_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'drug_condition'

class ProcedureConcept(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'procedure_occurrence.procedure_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'procedure_concept'

class ProcedureType(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'procedure_occurrence.procedure_type_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'procedure_type'

class ObservationConcept(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'observation.observation_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'observation_concept'

class ObservationType(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'observation.observation_type_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'observation_type'

class ObservationCondition(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'observation.relevant_condition_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'observation_condition'

class ObservationValue(ConceptBase):
    vocabulary_id = models.IntegerField()
    JOIN_TABLE_FIELD = 'observation.value_as_concept_id'
    class Meta(ConceptBase.Meta):
        db_table = 'observation_value'

class ConceptAncestor(models.Model):
    ancestor_concept = models.ForeignKey(Concept, related_name='conceptancestor_descendant_set')
    descendant_concept = models.ForeignKey(Concept, related_name='conceptancestor_ancestor_set')
    max_levels_of_separation = models.DecimalField(null=True, max_digits=38, decimal_places=0, blank=True)
    min_levels_of_separation = models.DecimalField(null=True, max_digits=38, decimal_places=0, blank=True)
    class Meta:
        db_table = 'concept_ancestor'
        unique_together = (
            ('ancestor_concept', 'descendant_concept'),
        )

class ConceptRelationship(models.Model):
    DELETED = DELETED
    UPDATED = UPDATED
    INVALID_REASON_CHOICES = INVALID_REASON_CHOICES
    concept_id_1 = models.ForeignKey(Concept, db_column='concept_id_1', related_name='conceptrelationship_2_set')
    concept_id_2 = models.ForeignKey(Concept, db_column='concept_id_2', related_name='conceptrelationship_1_set')
    relationship = models.ForeignKey('Relationship')
    valid_start_date = models.DateTimeField()
    valid_end_date = models.DateTimeField(default=lambda:datetime(2099, 12, 31, 0, 0, 0))
    invalid_reason = models.CharField(max_length=1, blank=True, null=True, choices=INVALID_REASON_CHOICES)
    class Meta:
        db_table = 'concept_relationship'
        unique_together = (
            ('concept_id_1', 'concept_id_2', 'relationship'),
        )

class ConceptSynonym(models.Model):
    concept_synonym_id = models.IntegerField(primary_key=True)
    concept = models.ForeignKey(Concept)
    concept_synonym_name = models.CharField(max_length=1000)
    class Meta:
        db_table = 'concept_synonym'

class ConditionEra(models.Model):
    condition_era_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    condition_concept_id = models.IntegerField()
    condition_era_start_date = models.DateTimeField()
    condition_era_end_date = models.DateTimeField()
    condition_type_concept_id = models.IntegerField()
    condition_occurrence_count = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)
    class Meta:
        db_table = 'condition_era'

class ConditionOccurrence(models.Model):
    condition_occurrence_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    condition_concept_id = models.ForeignKey(ConditionConcept, db_column='condition_concept_id')
    condition_start_date = models.DateTimeField()
    condition_end_date = models.DateTimeField(null=True, blank=True)
    condition_type_concept_id = models.ForeignKey(ConditionType, db_column='condition_type_concept_id')
    stop_reason = models.CharField(max_length=20, blank=True, null=True)
    associated_provider = models.ForeignKey('Provider', null=True, blank=True)
    visit_occurrence = models.ForeignKey('VisitOccurrence', null=True, blank=True)
    condition_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'condition_occurrence'

class Death(models.Model):
    person = models.ForeignKey('Person')
    death_date = models.DateTimeField()
    death_type_concept_id = models.IntegerField()
    cause_of_death_concept_id = models.IntegerField(null=True, blank=True)
    cause_of_death_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'death'
        unique_together = (
            ('person', 'death_type_concept_id'),
        )

class DrugApproval(models.Model):
    ingredient_concept_id = models.IntegerField()
    approval_date = models.DateTimeField()
    approved_by = models.CharField(max_length=20, default='FDA')
    class Meta:
        db_table = 'drug_approval'

class DrugCost(models.Model):
    drug_cost_id = models.IntegerField(primary_key=True)
    drug_exposure = models.ForeignKey('DrugExposure')
    paid_copay = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    paid_coinsurance = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    paid_toward_deductible = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    paid_by_payer = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    paid_by_coordination_benefits = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    total_out_of_pocket = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    total_paid = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    ingredient_cost = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    dispensing_fee = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    average_wholesale_price = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    payer_plan_period = models.ForeignKey('PayerPlanPeriod', null=True, blank=True)
    class Meta:
        db_table = 'drug_cost'

class DrugEra(models.Model):
    drug_era_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    drug_concept_id = models.IntegerField()
    drug_era_start_date = models.DateTimeField()
    drug_era_end_date = models.DateTimeField()
    drug_type_concept_id = models.IntegerField()
    drug_exposure_count = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)
    class Meta:
        db_table = 'drug_era'

class DrugExposure(models.Model):
    drug_exposure_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    drug_concept_id = models.ForeignKey(DrugConcept, db_column='drug_concept_id')
    drug_exposure_start_date = models.DateTimeField()
    drug_exposure_end_date = models.DateTimeField(null=True, blank=True)
    drug_type_concept_id = models.ForeignKey(DrugType, db_column='drug_type_concept_id')
    stop_reason = models.CharField(max_length=20, blank=True, null=True)
    refills = models.DecimalField(null=True, max_digits=3, decimal_places=0, blank=True)
    quantity = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)
    days_supply = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True)
    sig = models.CharField(max_length=500, blank=True, null=True)
    prescribing_provider = models.ForeignKey('Provider', null=True, blank=True)
    visit_occurrence = models.ForeignKey('VisitOccurrence', null=True, blank=True)
    relevant_condition_concept_id = models.ForeignKey(DrugCondition, db_column='relevant_condition_concept_id', null=True, blank=True)
    drug_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'drug_exposure'

class DrugStrength(models.Model):
    DELETED = DELETED
    UPDATED = UPDATED
    INVALID_REASON_CHOICES = INVALID_REASON_CHOICES
    drug_concept_id = models.IntegerField()
    ingredient_concept_id = models.IntegerField()
    amount_value = models.DecimalField(null=True, max_digits=38, decimal_places=0, blank=True)
    amount_unit = models.CharField(max_length=60, blank=True, null=True)
    concentration_value = models.DecimalField(null=True, max_digits=38, decimal_places=0, blank=True)
    concentration_enum_unit = models.CharField(max_length=60, blank=True, null=True)
    concentration_denom_unit = models.CharField(max_length=60, blank=True, null=True)
    valid_start_date = models.DateTimeField()
    valid_end_date = models.DateTimeField()
    invalid_reason = models.CharField(max_length=1, blank=True, null=True, choices=INVALID_REASON_CHOICES)
    class Meta:
        db_table = 'drug_strength'

class Location(models.Model):
    location_id = models.IntegerField(primary_key=True)
    address_1 = models.CharField(max_length=50, blank=True, null=True)
    address_2 = models.CharField(max_length=50, blank=True, null=True)
    city = models.CharField(max_length=50, blank=True, null=True)
    state = models.CharField(max_length=2, blank=True, null=True)
    zip = models.CharField(max_length=9, blank=True, null=True)
    county = models.CharField(max_length=20, blank=True, null=True)
    location_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'location'

class Observation(models.Model):
    observation_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    observation_concept_id = models.ForeignKey(ObservationConcept, db_column='observation_concept_id')
    observation_date = models.DateTimeField()
    observation_time = models.DateTimeField(null=True, blank=True)
    value_as_number = models.DecimalField(null=True, max_digits=14, decimal_places=3, blank=True)
    value_as_string = models.CharField(max_length=60, blank=True, null=True)
    value_as_concept_id = models.ForeignKey(ObservationValue, db_column='value_as_concept_id', null=True, blank=True)
    unit_concept_id = models.IntegerField(null=True, blank=True)
    range_low = models.DecimalField(null=True, max_digits=14, decimal_places=3, blank=True)
    range_high = models.DecimalField(null=True, max_digits=14, decimal_places=3, blank=True)
    observation_type_concept_id = models.ForeignKey(ObservationType, db_column='observation_type_concept_id')
    associated_provider = models.ForeignKey('Provider', null=True, blank=True)
    visit_occurrence = models.ForeignKey('VisitOccurrence', null=True, blank=True)
    relevant_condition_concept_id = models.ForeignKey(ObservationCondition, db_column='relevant_condition_concept_id', null=True, blank=True)
    observation_source_value = models.CharField(max_length=50, blank=True, null=True)
    units_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'observation'
        index_together = [
            ['person', 'observation_concept_id']
        ]

class ObservationPeriod(models.Model):
    observation_period_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    observation_period_start_date = models.DateTimeField()
    observation_period_end_date = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = 'observation_period'
        unique_together = (
            ('person', 'observation_period_start_date'),
        )

class Organization(models.Model):
    organization_id = models.IntegerField(primary_key=True)
    place_of_service_concept_id = models.IntegerField(null=True, blank=True)
    location = models.ForeignKey(Location, null=True, blank=True)
    organization_source_value = models.CharField(max_length=50)
    place_of_service_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'organization'
        index_together = [
            ['organization_source_value', 'place_of_service_source_value']
        ]

class PayerPlanPeriod(models.Model):
    payer_plan_period_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    payer_plan_period_start_date = models.DateTimeField()
    payer_plan_period_end_date = models.DateTimeField()
    payer_source_value = models.CharField(max_length=50, blank=True, null=True)
    plan_source_value = models.CharField(max_length=50, blank=True, null=True)
    family_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'payer_plan_period'

class Person(models.Model):
    person_id = models.IntegerField(primary_key=True)
    gender_concept_id = models.ForeignKey(Gender, db_column='gender_concept_id')
    year_of_birth = models.DecimalField(max_digits=4, decimal_places=0)
    month_of_birth = models.DecimalField(null=True, max_digits=2, decimal_places=0, blank=True)
    day_of_birth = models.DecimalField(null=True, max_digits=2, decimal_places=0, blank=True)
    race_concept_id = models.ForeignKey(Race, null=True, blank=True, db_column='race_concept_id')
    ethnicity_concept_id = models.ForeignKey(Ethnicity, null=True, blank=True, db_column='ethnicity_concept_id')
    location = models.ForeignKey(Location, null=True, blank=True)
    provider = models.ForeignKey('Provider', null=True, blank=True)
    care_site = models.ForeignKey(CareSite, null=True, blank=True)
    person_source_value = models.CharField(max_length=50, blank=True, null=True)
    gender_source_value = models.CharField(max_length=50, blank=True, null=True)
    race_source_value = models.CharField(max_length=50, blank=True, null=True)
    ethnicity_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'person'

class ProcedureCost(models.Model):
    procedure_cost_id = models.IntegerField(primary_key=True)
    procedure_occurrence = models.ForeignKey('ProcedureOccurrence')
    paid_copay = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    paid_coinsurance = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    paid_toward_deductible = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    paid_by_payer = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    paid_by_coordination_benefits = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    total_out_of_pocket = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    total_paid = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True)
    disease_class_concept_id = models.IntegerField(null=True, blank=True)
    revenue_code_concept_id = models.IntegerField(null=True, blank=True)
    payer_plan_period = models.ForeignKey(PayerPlanPeriod, null=True, blank=True)
    disease_class_source_value = models.CharField(max_length=50, blank=True, null=True)
    revenue_code_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'procedure_cost'

class ProcedureOccurrence(models.Model):
    procedure_occurrence_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey(Person)
    procedure_concept_id = models.ForeignKey(ProcedureConcept, db_column='procedure_concept_id')
    procedure_date = models.DateTimeField()
    procedure_type_concept_id = models.ForeignKey(ProcedureType, db_column='procedure_type_concept_id')
    associated_provider = models.ForeignKey('Provider', null=True, blank=True)
    visit_occurrence = models.ForeignKey('VisitOccurrence', null=True, blank=True)
    relevant_condition_concept_id = models.IntegerField(null=True, blank=True)
    procedure_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'procedure_occurrence'

class Provider(models.Model):
    provider_id = models.IntegerField(primary_key=True)
    npi = models.CharField(max_length=20, blank=True, null=True)
    dea = models.CharField(max_length=20, blank=True, null=True)
    specialty_concept_id = models.IntegerField(null=True, blank=True)
    care_site = models.ForeignKey(CareSite, null=True, blank=True)
    provider_source_value = models.CharField(max_length=50)
    specialty_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'provider'

class Relationship(models.Model):
    relationship_id = models.IntegerField(primary_key=True)
    relationship_name = models.CharField(max_length=256)
    is_hierarchical = models.IntegerField()
    defines_ancestry = models.IntegerField(default=1)
    reverse_relationship = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = 'relationship'

class SourceToConceptMap(models.Model):
    YES = 'Y'
    PRIMARY_MAP_CHOICES = ((YES, 'yes'),)
    DELETED = DELETED
    UPDATED = UPDATED
    INVALID_REASON_CHOICES = INVALID_REASON_CHOICES
    source_code = models.CharField(max_length=40, db_index=True)
    source_vocabulary = models.ForeignKey('Vocabulary', related_name='sourcetoconceptmap_target_set')
    source_code_description = models.CharField(max_length=256, blank=True, null=True)
    target_concept = models.ForeignKey(Concept)
    target_vocabulary = models.ForeignKey('Vocabulary', related_name='sourcetoconceptmap_source_set')
    mapping_type = models.CharField(max_length=20, blank=True, null=True)
    primary_map = models.CharField(max_length=1, blank=True, null=True, choices=PRIMARY_MAP_CHOICES)
    valid_start_date = models.DateTimeField()
    valid_end_date = models.DateTimeField(default=lambda:datetime(2099, 12, 31, 0, 0, 0))
    invalid_reason = models.CharField(max_length=1, blank=True, null=True, choices=INVALID_REASON_CHOICES)
    class Meta:
        db_table = 'source_to_concept_map'
        unique_together = (
            ('source_vocabulary', 'target_concept', 'source_code', 'valid_end_date'),
        )

class VisitOccurrence(models.Model):
    visit_occurrence_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey(Person)
    visit_start_date = models.DateTimeField()
    visit_end_date = models.DateTimeField()
    place_of_service_concept_id = models.IntegerField()
    care_site_id = models.IntegerField(null=True, blank=True)
    place_of_service_source_value = models.CharField(max_length=50, blank=True, null=True)
    class Meta:
        db_table = 'visit_occurrence'
        index_together = [
            ['person', 'visit_start_date']
        ]

class Vocabulary(models.Model):
    vocabulary_id = models.IntegerField(primary_key=True)
    vocabulary_name = models.CharField(max_length=256, unique=True)
    class Meta:
        db_table = 'vocabulary'

