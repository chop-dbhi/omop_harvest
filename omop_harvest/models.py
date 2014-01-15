from __future__ import unicode_literals
from django.db import models

class CareSite(models.Model):
    care_site_id = models.IntegerField(primary_key=True)
    location = models.ForeignKey('Location', null=True, blank=True)
    organization = models.ForeignKey('Organization', null=True, blank=True)
    place_of_service_concept_id = models.IntegerField(null=True, blank=True)
    care_site_source_value = models.CharField(max_length=50, blank=True, help_text='The identifier for the care site as it appears in the source data, stored here for reference.')
    place_of_service_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the place of service as it appears in the source data, stored here for reference.')
    class Meta:
        db_table = 'omop_care_site'

class Cohort(models.Model):
    cohort_id = models.IntegerField(primary_key=True)
    cohort_concept_id = models.IntegerField()
    cohort_start_date = models.DateField(help_text='The date when the cohort definition criteria for the person, provider or visit first match.')
    cohort_end_date = models.DateField(null=True, blank=True, help_text='The date when the cohort definition criteria for the person, provider or visit no longer match or the cohort membership was terminated.')
    subject_id = models.IntegerField()
    stop_reason = models.CharField(max_length=20, blank=True, help_text='The reason for the end of a cohort membership other than defined by the cohort definition criteria as it appears in the source data.')
    class Meta:
        db_table = 'omop_cohort'

class Concept(models.Model):
    concept_id = models.IntegerField(primary_key=True)
    concept_name = models.CharField(max_length=256, help_text='An unambiguous, meaningful and descriptive name for the concept.')
    concept_level = models.IntegerField(help_text='The level of hierarchy associated with the concept. Different concept levels are assigned to concepts to depict their seniority in a clearly defined hierarchy, such as drugs, conditions, etc. A concept level of 0 is assigned to concepts that are not part of a standard vocabulary, but are part of the vocabulary for reference purposes (e.g. drug form).')
    concept_class = models.CharField(max_length=60, help_text='The category or class of the concept along both the hierarchical tree as well as different domains within a vocabulary. Examples are \'Clinical Drug\', \'Ingredient\', \'Clinical Finding\' etc.')
    vocabulary = models.ForeignKey('Vocabulary')
    concept_code = models.CharField(max_length=40, help_text='The concept code represents the identifier of the concept in the source data it originates from, such as SNOMED-CT concept IDs, RxNorm RXCUIs etc. Note that concept codes are not unique across vocabularies.')
    valid_start_date = models.DateField(help_text='The date when the was first recorded.')
    valid_end_date = models.DateField(help_text='The date when the concept became invalid because it was deleted or superseded (updated) by a new concept. The default value is 31-Dec-2099.')
    invalid_reason = models.CharField(max_length=1, blank=True, help_text='Concepts that are replaced with a new concept are designated \'Updated\' (U) and concepts that are removed without replacement are \'Deprecated\' (D).')
    class Meta:
        db_table = 'omop_concept'

class ConceptAncestor(models.Model):
    ancestry_id = models.IntegerField(primary_key=True)
    ancestor_concept = models.ForeignKey(Concept, related_name='descendent_relations')
    descendant_concept = models.ForeignKey(Concept, related_name='ancestor_relations')
    max_levels_of_separation = models.IntegerField(null=True, blank=True, help_text='The maximum separation in number of levels of hierarchy between ancestor and descendant concepts. This is an optional attribute that is used to simplify hierarchic analysis. ')
    min_levels_of_separation = models.IntegerField(null=True, blank=True, help_text='The minimum separation in number of levels of hierarchy between ancestor and descendant concepts. This is an optional attribute that is used to simplify hierarchic analysis.')
    class Meta:
        db_table = 'omop_concept_ancestor'

class ConceptRelationship(models.Model):
    concept_relationship_id = models.IntegerField(primary_key=True)
    concept_id_1 = models.ForeignKey(Concept, db_column='concept_id_1', related_name='relations_to')
    concept_id_2 = models.ForeignKey(Concept, db_column='concept_id_2', related_name='relations_from')
    relationship = models.ForeignKey('Relationship')
    valid_start_date = models.DateField(help_text='The date when the the relationship was first recorded.')
    valid_end_date = models.DateField(help_text='The date when the relationship became invalid because it was deleted or superseded (updated) by a new relationship. Default value is 31-Dec-2099.')
    invalid_reason = models.CharField(max_length=1, blank=True, help_text='Reason the relationship was invalidated. Possible values are D (deleted), U (replaced with an update) or NULL when valid_end_date has the default  value.')
    class Meta:
        db_table = 'omop_concept_relationship'

class ConceptSynonym(models.Model):
    concept_synonym_id = models.IntegerField(primary_key=True)
    concept = models.ForeignKey(Concept)
    concept_synonym_name = models.CharField(max_length=1000, help_text='The alternative name for the concept.')
    class Meta:
        db_table = 'omop_concept_synonym'

class ConditionEra(models.Model):
    condition_era_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    condition_concept_id = models.IntegerField()
    condition_era_start_date = models.DateField(help_text='The start date for the condition era constructed from the individual instances of condition occurrences. It is the start date of the very first chronologically recorded instance of the condition.')
    condition_era_end_date = models.DateField(help_text='The end date for the condition era constructed from the individual instances of condition occurrences. It is the end date of the final continuously recorded instance of the condition.')
    condition_type_concept_id = models.IntegerField(help_text='')
    condition_occurrence_count = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True, help_text='The number of individual condition occurrences used to construct the condition era.')
    confidence = models.NullBooleanField(null=True, blank=True, help_text='Deprecated CDMV2 field.')
    class Meta:
        db_table = 'omop_condition_era'

class ConditionOccurrence(models.Model):
    condition_occurrence_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    condition_concept_id = models.IntegerField()
    condition_start_date = models.DateField(help_text='The date when the instance of the condition is recorded.')
    condition_end_date = models.DateField(null=True, blank=True, help_text='The date when the instance of the Condition is last recorded.')
    condition_type_concept_id = models.IntegerField()
    stop_reason = models.CharField(max_length=20, blank=True, help_text='The reason, if available, that the condition was no longer recorded, as indicated in the source data. Valid values include discharged, resolved, etc.')
    associated_provider = models.ForeignKey('Provider', null=True, blank=True)
    visit_occurrence = models.ForeignKey('VisitOccurrence', null=True, blank=True)
    condition_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the condition as it appears in the source data. This code is mapped to a standard condition concept in the vocabulary and the original code is , stored here for reference. Condition source codes are typically ICD-9-CM diagnosis codes from medical claims or discharge status/disposition codes from EHRs.')
    class Meta:
        db_table = 'omop_condition_occurrence'

class Death(models.Model):
    person_death_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    death_date = models.DateField(help_text='The date the person deceased. If the precise date including day or month is not known or not allowed, December is used as the default month, and the last day of the month the default day.')
    death_type_concept_id = models.IntegerField()
    cause_of_death_concept_id = models.IntegerField(null=True, blank=True)
    cause_of_death_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the cause of death as it appears in the source data. This code is mapped to a standard concept in the vocabulary and the original code is , stored here for reference. ')
    class Meta:
        db_table = 'omop_death'

class DrugApproval(models.Model):
    ingredient_concept_id = models.IntegerField(primary_key=True)
    approval_date = models.DateField()
    approved_by = models.CharField(max_length=20)
    class Meta:
        db_table = 'omop_drug_approval'

class DrugCost(models.Model):
    drug_cost_id = models.IntegerField(primary_key=True)
    drug_exposure = models.ForeignKey('DrugExposure')
    paid_copay = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The amount paid by the person as a fixed contribution to the expenses. Copay does not contribute to the out_of_pocket expenses.')
    paid_coinsurance = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The amount paid by the person as a joint assumption of risk. Typically, this is a percentage of the expenses defined by the payer plan (policy) after the person\'s deductible is exceeded.')
    paid_toward_deductible = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The amount paid by the person that is counted toward the deductible defined by the payer plan (policy).')
    paid_by_payer = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The amount paid by the payer (insurer). If there is more than one payer, several drug_cost records indicate that fact.')
    paid_by_coordination_benefits = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The amount paid by a secondary payer through the coordination of benefits.')
    total_out_of_pocket = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The total amount paid by the person as a share of the expenses, excluding the copay.')
    total_paid = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The total amount paid for the expenses of drug exposure.')
    ingredient_cost = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The portion of the drug expenses due to the cost charged by the manufacturer for the drug, typically a percentage of the Average Wholesale Price.')
    dispensing_fee = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The portion of the drug expenses due to the dispensing fee charged by the pharmacy, typically a fixed amount.')
    average_wholesale_price = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='List price of a drug set by the manufacturer.')
    payer_plan_period = models.ForeignKey('PayerPlanPeriod', null=True, blank=True)
    class Meta:
        db_table = 'omop_drug_cost'

class DrugEra(models.Model):
    drug_era_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    drug_concept_id = models.IntegerField()
    drug_era_start_date = models.DateField(help_text='The start date for the drug era constructed from the individual instances of drug exposures. It is the start date of the very first chronologically recorded instance of utilization of a drug.')
    drug_era_end_date = models.DateField(help_text='The end date for the drug era constructed from the individual instance of drug exposures. It is the end date of the final continuously recorded instance of utilization of a drug.')
    drug_type_concept_id = models.IntegerField()
    drug_exposure_count = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True, help_text='The number of individual drug exposure occurrences used to construct the drug era.')
    class Meta:
        db_table = 'omop_drug_era'

class DrugExposure(models.Model):
    drug_exposure_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    drug_concept_id = models.IntegerField()
    drug_exposure_start_date = models.DateField(help_text='The start date for the current instance of drug utilization. Valid entries include a start date of a prescription, the date a prescription was filled, or the date on which a drug administration procedure was recorded.')
    drug_exposure_end_date = models.DateField(null=True, blank=True, help_text='The end date for the current instance of drug utilization. It is not available from all sources.')
    drug_type_concept_id = models.IntegerField()
    stop_reason = models.CharField(max_length=20, blank=True, help_text='The reason the medication was stopped, where available. Reasons include regimen completed, changed, removed, etc..')
    refills = models.DecimalField(null=True, max_digits=3, decimal_places=0, blank=True, help_text='The number of refills after the initial prescription. The initial prescription is not counted,  Values start with 0.')
    quantity = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True, help_text='The quantity of drug as recorded in the original prescription or dispensing record.')
    days_supply = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True, help_text='The number of days of supply of the medication as recorded in the original prescription or dispensing record.')
    sig = models.CharField(max_length=500, blank=True, help_text='The directions (\'signetur\') on the drug prescription as recorded in the original prescription (and printed on the container) or dispensing record.')
    prescribing_provider = models.ForeignKey('Provider', null=True, blank=True)
    visit_occurrence = models.ForeignKey('VisitOccurrence', null=True, blank=True)
    relevant_condition_concept_id = models.IntegerField(null=True, blank=True)
    drug_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the drug as it appears in the source data. This code is mapped to a standard drug concept in the vocabulary and the original code is , stored here for reference.')
    class Meta:
        db_table = 'omop_drug_exposure'

class DrugStrength(models.Model):
    drug_concept_id = models.IntegerField(primary_key=True)
    ingredient_concept_id = models.IntegerField()
    amount_value = models.DecimalField(null=True, max_digits=50, decimal_places=0, blank=True)
    amount_unit = models.CharField(max_length=60, blank=True)
    concentration_value = models.DecimalField(null=True, max_digits=50, decimal_places=0, blank=True)
    concentration_enum_unit = models.CharField(max_length=60, blank=True)
    concentration_denom_unit = models.CharField(max_length=60, blank=True)
    valid_start_date = models.DateField()
    valid_end_date = models.DateField()
    invalid_reason = models.CharField(max_length=1, blank=True)
    class Meta:
        db_table = 'omop_drug_strength'

class Location(models.Model):
    location_id = models.IntegerField(primary_key=True)
    address_1 = models.CharField(max_length=50, blank=True, help_text='The address field 1, typically used for the street address, as it appears in the source data.')
    address_2 = models.CharField(max_length=50, blank=True, help_text='The address field 2, typically used for additional detail such as buildings, suites, floors, as it appears in the source data.')
    city = models.CharField(max_length=50, blank=True, help_text='The city field as it appears in the source data.')
    state = models.CharField(max_length=2, blank=True, help_text='The state field as it appears in the source data.')
    zip = models.CharField(max_length=9, blank=True, help_text='The zip code. For US addresses, valid zip codes can be 3, 5 or 9 digits long, depending on the source data.')
    county = models.CharField(max_length=20, blank=True, help_text='The county. The county information is necessary because not all zip codes fall into one and the same county.')
    location_source_value = models.CharField(max_length=50, blank=True, help_text='The verbatim information that is used to uniquely identify the location as it appears in the source data.')
    class Meta:
        db_table = 'omop_location'

class Observation(models.Model):
    observation_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    observation_concept_id = models.IntegerField()
    observation_date = models.DateField(help_text='The date of the observation')
    observation_time = models.DateField(null=True, blank=True, help_text='The time of the observation')
    value_as_number = models.DecimalField(null=True, max_digits=14, decimal_places=3, blank=True, help_text='The observation result stored as a number. This is applicable to observations where the result is expressed as a numeric value.')
    value_as_string = models.CharField(max_length=60, blank=True, help_text='The observation result stored as a string. This is applicable to observations where the result is expressed as verbatim text, such as in radiology or pathology report')
    value_as_concept_id = models.IntegerField(null=True, blank=True)
    unit_concept_id = models.IntegerField(null=True, blank=True)
    range_low = models.DecimalField(null=True, max_digits=14, decimal_places=3, blank=True, help_text='The lower limit of the normal range of the observation. It is not applicable if the observation results are non-numeric or categorical, and must be in the same units of measure as the observation value.')
    range_high = models.DecimalField(null=True, max_digits=14, decimal_places=3, blank=True, help_text='The upper limit of the normal range of the observation. It is not applicable if the observation results are non-numeric or categorical, and must be in the same units of measure as the observation value.')
    observation_type_concept_id = models.IntegerField()
    associated_provider = models.ForeignKey('Provider')
    visit_occurrence = models.ForeignKey('VisitOccurrence', null=True, blank=True)
    relevant_condition_concept_id = models.IntegerField(null=True, blank=True)
    observation_source_value = models.CharField(max_length=50, blank=True, help_text='The observation code as it appears in the source data. This code is mapped to a standard concept in the vocabulary and the original code is , stored here for reference.')
    units_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the unit as it appears in the source data. This code is mapped to a standard unit concept in the vocabulary and the original code is , stored here for reference. ')
    class Meta:
        db_table = 'omop_observation'

class ObservationPeriod(models.Model):
    observation_period_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    observation_period_start_date = models.DateField(help_text='The start date of the observation period for which data are available from the data source.')
    observation_period_end_date = models.DateField(help_text='The end date of the observation period for which data are available from the data source.')
    person_status_concept_id = models.IntegerField(null=True, blank=True)
    rx_data_availability = models.CharField(max_length=1, blank=True, help_text='Deprecated CDMV2 field that tracks the availability of prescription data for the observation period.')
    dx_data_availability = models.CharField(max_length=1, blank=True, help_text='Deprecated CDMV2 field that tracks the availability of diagnosis data for the observation period.')
    hospital_data_availability = models.CharField(max_length=1, blank=True, help_text='Deprecated CDMV2 field recording the availability of hospital data for the observation period.')
    confidence = models.NullBooleanField(null=True, blank=True, help_text='Deprecated CDMV2 field.')
    class Meta:
        db_table = 'omop_observation_period'

class Organization(models.Model):
    organization_id = models.IntegerField(primary_key=True)
    place_of_service_concept_id = models.IntegerField(null=True, blank=True)
    location = models.ForeignKey(Location, null=True, blank=True)
    organization_source_value = models.CharField(max_length=50, blank=True, help_text='The identifier for the organization in the source data , stored here for reference.')
    place_of_service_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the place of service as it appears in the source data, stored here for reference.')
    class Meta:
        db_table = 'omop_organization'

class PayerPlanPeriod(models.Model):
    payer_plan_period_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    payer_plan_period_start_date = models.DateField(help_text='The start date of the payer plan period.')
    payer_plan_period_end_date = models.DateField(help_text='The end date of the payer plan period defined for the person.')
    payer_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the payer as it appears in the source data.')
    plan_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the person\'s coverage plan as it appears in the source data.')
    family_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the person\'s family as it appears in the source data.')
    class Meta:
        db_table = 'omop_payer_plan_period'

class Person(models.Model):
    person_id = models.IntegerField(primary_key=True)
    gender_concept_id = models.IntegerField()
    year_of_birth = models.DecimalField(max_digits=4, decimal_places=0, help_text='The year of birth of the Person. For data sources with date of birth, only the year is extracted. For data sources where the year of birth is not available, the approximate year of birth is derived based on any age group categorization available.')
    month_of_birth = models.DecimalField(null=True, max_digits=2, decimal_places=0, blank=True, help_text='The month of birth of the person. For data sources that provide the precise date of birth, the month is extracted and stored in this field.')
    day_of_birth = models.DecimalField(null=True, max_digits=2, decimal_places=0, blank=True, help_text='The day of the month of birth of the person. For data sources that provide the precise date of birth, the day is extracted and stored in this field.')
    race_concept_id = models.IntegerField(null=True, blank=True)
    ethnicity_concept_id = models.IntegerField(null=True, blank=True)
    location = models.ForeignKey(Location, null=True, blank=True)
    provider = models.ForeignKey('Provider', null=True, blank=True)
    care_site = models.ForeignKey(CareSite, null=True, blank=True)
    person_source_value = models.CharField(max_length=50, blank=True, help_text='An encrypted key derived from the person identifier in the source data. This is necessary when a drug safety issue requires a link back to the person data at the source dataset. No value with any medical or demographic significance must be stored.')
    gender_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the gender of the person as it appears in the source data. The person gender is mapped to a standard gender concept in the vocabulary and the corresponding concept identifier is, stored here for reference.')
    race_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the race of the person as it appears in the source data. The person race is mapped to a standard race concept in the vocabulary and the original code is, stored here for reference.')
    ethnicity_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the ethnicity of the person as it appears in the source data. The person ethnicity is mapped to a standard ethnicity concept in the vocabulary and the original code is, stored here for reference.')
    location_concept_id = models.IntegerField(null=True, blank=True)
    source_location_code = models.CharField(max_length=50, blank=True, help_text='Deprecated CDMV2 field to store source location values. Locations are now stored in the location table.')
    class Meta:
        db_table = 'omop_person'

class ProcedureCost(models.Model):
    procedure_cost_id = models.IntegerField(primary_key=True)
    procedure_occurrence = models.ForeignKey('ProcedureOccurrence')
    paid_copay = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The amount paid by the person as a fixed contribution to the expenses. Copay does not contribute to the out_of_pocket expenses.')
    paid_coinsurance = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The amount paid by the person as a joint assumption of risk. Typically, this is a percentage of the expenses defined by the payer plan (policy) after the person\'s deductible is exceeded.')
    paid_toward_deductible = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The amount paid by the person that is counted toward the deductible defined by the payer plan (policy).')
    paid_by_payer = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The amount paid by the payer (insurer). If there is more than one payer, several procedure_cost records indicate that fact.')
    paid_by_coordination_benefits = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The amount paid by a secondary payer through the coordination of benefits.')
    total_out_of_pocket = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The total amount paid by the person as a share of the expenses, excluding the copay.')
    total_paid = models.DecimalField(null=True, max_digits=8, decimal_places=2, blank=True, help_text='The total amount paid for the expenses of the procedure.')
    disease_class_concept_id = models.IntegerField(null=True, blank=True)
    revenue_code_concept_id = models.IntegerField(null=True, blank=True)
    payer_plan_period = models.ForeignKey(PayerPlanPeriod, null=True, blank=True)
    disease_class_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the disease class as it appears in the source data , stored here for reference.')
    revenue_code_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the revenue code as it appears in the source data , stored here for reference.')
    class Meta:
        db_table = 'omop_procedure_cost'

class ProcedureOccurrence(models.Model):
    procedure_occurrence_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey(Person)
    procedure_concept_id = models.IntegerField()
    procedure_date = models.DateField(help_text='The date on which the procedure was performed.')
    procedure_type_concept_id = models.IntegerField()
    associated_provider = models.ForeignKey('Provider', null=True, blank=True)
    visit_occurrence = models.ForeignKey('VisitOccurrence', null=True, blank=True)
    relevant_condition_concept_id = models.IntegerField(null=True, blank=True)
    procedure_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the procedure as it appears in the source data. This code is mapped to a standard procedure concept in the vocabulary and the original code is , stored here for reference. Procedure source codes are typically ICD-9-Proc, CPT-4 or HCPCS codes.')
    class Meta:
        db_table = 'omop_procedure_occurrence'

class Provider(models.Model):
    provider_id = models.IntegerField(primary_key=True)
    npi = models.CharField(max_length=20, blank=True, help_text='The National Provider Identifier (NPI) of the provider.')
    dea = models.CharField(max_length=20, blank=True, help_text='The Drug Enforcement Administration (DEA) number of the provider.')
    specialty_concept_id = models.IntegerField(null=True, blank=True)
    care_site = models.ForeignKey(CareSite, null=True, blank=True)
    provider_source_value = models.CharField(max_length=50, help_text='The identifier used for the provider in the source data.rmation that is used to uniquely identify the provider as it appears in the source data , stored here for reference.')
    specialty_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the provider specialty as it appears in the source data , stored here for reference.')
    class Meta:
        db_table = 'omop_provider'

class Relationship(models.Model):
    relationship_id = models.IntegerField(primary_key=True)
    relationship_name = models.CharField(max_length=256, help_text='The text that describes the relationship type.')
    is_hierarchical = models.IntegerField(help_text='Defines whether a relationship defines concepts into classes or hierarchies. Values are Y for hierarchical relationship or NULL if not')
    defines_ancestry = models.IntegerField(help_text='Defines whether a hierarchical relationship contributes to the concept_ancestor table. These are subsets of the hierarchical relationships. Valid values are Y or NULL.')
    reverse_relationship = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = 'omop_relationship'

class SourceToConceptMap(models.Model):
    source_to_concept_map_id = models.IntegerField(primary_key=True)
    source_code = models.CharField(max_length=40, help_text='The source code being translated into a standard concept.')
    source_vocabulary = models.ForeignKey('Vocabulary', related_name='source_for_mappings')
    source_code_description = models.CharField(max_length=256, blank=True, help_text='An optional description for the source code. This is included as a convenience to compare the description of the source code to the name of the concept.')
    target_concept_id = models.IntegerField()
    target_vocabulary = models.ForeignKey('Vocabulary', related_name='target_of_mappings')
    mapping_type = models.CharField(max_length=20, blank=True, help_text='A string identifying the observational data element being translated. Examples include \'DRUG\', \'CONDITION\', \'PROCEDURE\', \'PROCEDURE DRUG\' etc. It is important to pick the appropriate mapping record when the same source code is being mapped to different concepts in different contexts. As an example a procedure code for drug administration can be mapped to a procedure concept or a drug concept.')
    primary_map = models.CharField(max_length=1, blank=True, help_text='A boolean value identifying the primary mapping relationship for those sets where the source_code, the source_concept_type_id and the mapping type is identical (one-to-many mappings). The ETL will only consider the primary map. Permitted values are Y and null.')
    valid_start_date = models.DateField(help_text='The date when the mapping instance was first recorded.')
    valid_end_date = models.DateField(help_text='The date when the mapping instance became invalid because it was deleted or superseded (updated) by a new relationship. Default value is 31-Dec-2099.')
    invalid_reason = models.CharField(max_length=1, blank=True, help_text='Reason the mapping instance was invalidated. Possible values are D (deleted), U (replaced with an update) or NULL when valid_end_date has the default  value.')
    class Meta:
        db_table = 'omop_source_to_concept_map'

class VisitOccurrence(models.Model):
    visit_occurrence_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey(Person)
    visit_start_date = models.DateField(help_text='The start date of the visit.')
    visit_end_date = models.DateField(help_text='The end date of the visit. If this is a one-day visit the end date should match the start date.')
    place_of_service_concept_id = models.IntegerField()
    care_site_id = models.IntegerField(null=True, blank=True)
    place_of_service_source_value = models.CharField(max_length=50, blank=True, help_text='The source code used to reflect the type or source of the visit in the source data. Valid entries include office visits, hospital admissions, etc. These source codes can also be type-of service codes and activity type codes.')
    class Meta:
        db_table = 'omop_visit_occurrence'

class Vocabulary(models.Model):
    vocabulary_id = models.IntegerField(primary_key=True)
    vocabulary_name = models.CharField(max_length=256, unique=True, help_text='Unique identifier for each of the vocabulary sources used in the observational analysis.')
    class Meta:
        db_table = 'omop_vocabulary'

