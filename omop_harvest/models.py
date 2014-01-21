from __future__ import unicode_literals
from django.db import models

class Person(models.Model):
    person_id = models.IntegerField(primary_key=True)
    gender_concept = models.ForeignKey('PersonGenderConcept')
    year_of_birth = models.DecimalField(max_digits=4, decimal_places=0, help_text='The year of birth of the Person. For data sources with date of birth, only the year is extracted. For data sources where the year of birth is not available, the approximate year of birth is derived based on any age group categorization available.')
    month_of_birth = models.DecimalField(null=True, max_digits=2, decimal_places=0, blank=True, help_text='The month of birth of the person. For data sources that provide the precise date of birth, the month is extracted and stored in this field.')
    day_of_birth = models.DecimalField(null=True, max_digits=2, decimal_places=0, blank=True, help_text='The day of the month of birth of the person. For data sources that provide the precise date of birth, the day is extracted and stored in this field.')
    race_concept = models.ForeignKey('PersonRaceConcept', null=True, blank=True)
    ethnicity_concept = models.ForeignKey('PersonEthnicityConcept', null=True, blank=True)
    location_id = models.IntegerField(null=True, blank=True)
    provider_id = models.IntegerField(null=True, blank=True)
    care_site_id = models.IntegerField(null=True, blank=True)
    person_source_value = models.CharField(max_length=50, blank=True, help_text='An encrypted key derived from the person identifier in the source data. This is necessary when a drug safety issue requires a link back to the person data at the source dataset. No value with any medical or demographic significance must be stored.')
    gender_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the gender of the person as it appears in the source data. The person gender is mapped to a standard gender concept in the vocabulary and the corresponding concept identifier is, stored here for reference.')
    race_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the race of the person as it appears in the source data. The person race is mapped to a standard race concept in the vocabulary and the original code is, stored here for reference.')
    ethnicity_source_value = models.CharField(max_length=50, blank=True, help_text='The source code for the ethnicity of the person as it appears in the source data. The person ethnicity is mapped to a standard ethnicity concept in the vocabulary and the original code is, stored here for reference.')
    location_concept = models.ForeignKey('PersonLocationConcept', null=True, blank=True)
    source_location_code = models.CharField(max_length=50, blank=True, help_text='Deprecated CDMV2 field to store source location values. Locations are now stored in the location table.')
    class Meta:
        db_table = 'omop_person'

class ObservationPeriod(models.Model):
    observation_period_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    observation_period_start_date = models.DateField(help_text='The start date of the observation period for which data are available from the data source.')
    observation_period_end_date = models.DateField(help_text='The end date of the observation period for which data are available from the data source.')
    person_status_concept = models.ForeignKey('ObservationPeriodPersonStatusConcept', null=True, blank=True)
    rx_data_availability = models.CharField(max_length=1, blank=True, help_text='Deprecated CDMV2 field that tracks the availability of prescription data for the observation period.')
    dx_data_availability = models.CharField(max_length=1, blank=True, help_text='Deprecated CDMV2 field that tracks the availability of diagnosis data for the observation period.')
    hospital_data_availability = models.CharField(max_length=1, blank=True, help_text='Deprecated CDMV2 field recording the availability of hospital data for the observation period.')
    confidence = models.NullBooleanField(null=True, blank=True, help_text='Deprecated CDMV2 field.')
    class Meta:
        db_table = 'omop_observation_period'

class DrugEra(models.Model):
    drug_era_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    drug_concept = models.ForeignKey('DrugEraDrugConcept')
    drug_era_start_date = models.DateField(help_text='The start date for the drug era constructed from the individual instances of drug exposures. It is the start date of the very first chronologically recorded instance of utilization of a drug.')
    drug_era_end_date = models.DateField(help_text='The end date for the drug era constructed from the individual instance of drug exposures. It is the end date of the final continuously recorded instance of utilization of a drug.')
    drug_type_concept_id = models.IntegerField()
    drug_exposure_count = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True, help_text='The number of individual drug exposure occurrences used to construct the drug era.')
    class Meta:
        db_table = 'omop_drug_era'

class ConditionEra(models.Model):
    condition_era_id = models.IntegerField(primary_key=True)
    person = models.ForeignKey('Person')
    condition_concept = models.ForeignKey('ConditionEraConditionConcept')
    condition_era_start_date = models.DateField(help_text='The start date for the condition era constructed from the individual instances of condition occurrences. It is the start date of the very first chronologically recorded instance of the condition.')
    condition_era_end_date = models.DateField(help_text='The end date for the condition era constructed from the individual instances of condition occurrences. It is the end date of the final continuously recorded instance of the condition.')
    condition_type_concept_id = models.IntegerField()
    condition_occurrence_count = models.DecimalField(null=True, max_digits=4, decimal_places=0, blank=True, help_text='The number of individual condition occurrences used to construct the condition era.')
    confidence = models.NullBooleanField(null=True, blank=True, help_text='Deprecated CDMV2 field.')
    class Meta:
        db_table = 'omop_condition_era'

class PersonGenderConcept(models.Model):
    concept_id = models.IntegerField(primary_key=True)
    concept_name = models.CharField(max_length=256, help_text='An unambiguous, meaningful and descriptive name for the concept.')
    concept_level = models.IntegerField(help_text='The level of hierarchy associated with the concept. Different concept levels are assigned to concepts to depict their seniority in a clearly defined hierarchy, such as drugs, conditions, etc. A concept level of 0 is assigned to concepts that are not part of a standard vocabulary, but are part of the vocabulary for reference purposes (e.g. drug form).')
    concept_class = models.CharField(max_length=60, help_text='The category or class of the concept along both the hierarchical tree as well as different domains within a vocabulary. Examples are \'Clinical Drug\', \'Ingredient\', \'Clinical Finding\' etc.')
    vocabulary_id = models.IntegerField()
    concept_code = models.CharField(max_length=40, help_text='The concept code represents the identifier of the concept in the source data it originates from, such as SNOMED-CT concept IDs, RxNorm RXCUIs etc. Note that concept codes are not unique across vocabularies.')
    valid_start_date = models.DateField(help_text='The date when the was first recorded.')
    valid_end_date = models.DateField(help_text='The date when the concept became invalid because it was deleted or superseded (updated) by a new concept. The default value is 31-Dec-2099.')
    invalid_reason = models.CharField(max_length=1, blank=True, help_text='Concepts that are replaced with a new concept are designated \'Updated\' (U) and concepts that are removed without replacement are \'Deprecated\' (D).')
    class Meta:
        managed = False
        db_table = 'omop_person_gender_concept'

class PersonRaceConcept(models.Model):
    concept_id = models.IntegerField(primary_key=True)
    concept_name = models.CharField(max_length=256, help_text='An unambiguous, meaningful and descriptive name for the concept.')
    concept_level = models.IntegerField(help_text='The level of hierarchy associated with the concept. Different concept levels are assigned to concepts to depict their seniority in a clearly defined hierarchy, such as drugs, conditions, etc. A concept level of 0 is assigned to concepts that are not part of a standard vocabulary, but are part of the vocabulary for reference purposes (e.g. drug form).')
    concept_class = models.CharField(max_length=60, help_text='The category or class of the concept along both the hierarchical tree as well as different domains within a vocabulary. Examples are \'Clinical Drug\', \'Ingredient\', \'Clinical Finding\' etc.')
    vocabulary_id = models.IntegerField()
    concept_code = models.CharField(max_length=40, help_text='The concept code represents the identifier of the concept in the source data it originates from, such as SNOMED-CT concept IDs, RxNorm RXCUIs etc. Note that concept codes are not unique across vocabularies.')
    valid_start_date = models.DateField(help_text='The date when the was first recorded.')
    valid_end_date = models.DateField(help_text='The date when the concept became invalid because it was deleted or superseded (updated) by a new concept. The default value is 31-Dec-2099.')
    invalid_reason = models.CharField(max_length=1, blank=True, help_text='Concepts that are replaced with a new concept are designated \'Updated\' (U) and concepts that are removed without replacement are \'Deprecated\' (D).')
    class Meta:
        managed = False
        db_table = 'omop_person_race_concept'

class PersonEthnicityConcept(models.Model):
    concept_id = models.IntegerField(primary_key=True)
    concept_name = models.CharField(max_length=256, help_text='An unambiguous, meaningful and descriptive name for the concept.')
    concept_level = models.IntegerField(help_text='The level of hierarchy associated with the concept. Different concept levels are assigned to concepts to depict their seniority in a clearly defined hierarchy, such as drugs, conditions, etc. A concept level of 0 is assigned to concepts that are not part of a standard vocabulary, but are part of the vocabulary for reference purposes (e.g. drug form).')
    concept_class = models.CharField(max_length=60, help_text='The category or class of the concept along both the hierarchical tree as well as different domains within a vocabulary. Examples are \'Clinical Drug\', \'Ingredient\', \'Clinical Finding\' etc.')
    vocabulary_id = models.IntegerField()
    concept_code = models.CharField(max_length=40, help_text='The concept code represents the identifier of the concept in the source data it originates from, such as SNOMED-CT concept IDs, RxNorm RXCUIs etc. Note that concept codes are not unique across vocabularies.')
    valid_start_date = models.DateField(help_text='The date when the was first recorded.')
    valid_end_date = models.DateField(help_text='The date when the concept became invalid because it was deleted or superseded (updated) by a new concept. The default value is 31-Dec-2099.')
    invalid_reason = models.CharField(max_length=1, blank=True, help_text='Concepts that are replaced with a new concept are designated \'Updated\' (U) and concepts that are removed without replacement are \'Deprecated\' (D).')
    class Meta:
        managed = False
        db_table = 'omop_person_ethnicity_concept'

class PersonLocationConcept(models.Model):
    concept_id = models.IntegerField(primary_key=True)
    concept_name = models.CharField(max_length=256, help_text='An unambiguous, meaningful and descriptive name for the concept.')
    concept_level = models.IntegerField(help_text='The level of hierarchy associated with the concept. Different concept levels are assigned to concepts to depict their seniority in a clearly defined hierarchy, such as drugs, conditions, etc. A concept level of 0 is assigned to concepts that are not part of a standard vocabulary, but are part of the vocabulary for reference purposes (e.g. drug form).')
    concept_class = models.CharField(max_length=60, help_text='The category or class of the concept along both the hierarchical tree as well as different domains within a vocabulary. Examples are \'Clinical Drug\', \'Ingredient\', \'Clinical Finding\' etc.')
    vocabulary_id = models.IntegerField()
    concept_code = models.CharField(max_length=40, help_text='The concept code represents the identifier of the concept in the source data it originates from, such as SNOMED-CT concept IDs, RxNorm RXCUIs etc. Note that concept codes are not unique across vocabularies.')
    valid_start_date = models.DateField(help_text='The date when the was first recorded.')
    valid_end_date = models.DateField(help_text='The date when the concept became invalid because it was deleted or superseded (updated) by a new concept. The default value is 31-Dec-2099.')
    invalid_reason = models.CharField(max_length=1, blank=True, help_text='Concepts that are replaced with a new concept are designated \'Updated\' (U) and concepts that are removed without replacement are \'Deprecated\' (D).')
    class Meta:
        managed = False
        db_table = 'omop_person_location_concept'

class ObservationPeriodPersonStatusConcept(models.Model):
    concept_id = models.IntegerField(primary_key=True)
    concept_name = models.CharField(max_length=256, help_text='An unambiguous, meaningful and descriptive name for the concept.')
    concept_level = models.IntegerField(help_text='The level of hierarchy associated with the concept. Different concept levels are assigned to concepts to depict their seniority in a clearly defined hierarchy, such as drugs, conditions, etc. A concept level of 0 is assigned to concepts that are not part of a standard vocabulary, but are part of the vocabulary for reference purposes (e.g. drug form).')
    concept_class = models.CharField(max_length=60, help_text='The category or class of the concept along both the hierarchical tree as well as different domains within a vocabulary. Examples are \'Clinical Drug\', \'Ingredient\', \'Clinical Finding\' etc.')
    vocabulary_id = models.IntegerField()
    concept_code = models.CharField(max_length=40, help_text='The concept code represents the identifier of the concept in the source data it originates from, such as SNOMED-CT concept IDs, RxNorm RXCUIs etc. Note that concept codes are not unique across vocabularies.')
    valid_start_date = models.DateField(help_text='The date when the was first recorded.')
    valid_end_date = models.DateField(help_text='The date when the concept became invalid because it was deleted or superseded (updated) by a new concept. The default value is 31-Dec-2099.')
    invalid_reason = models.CharField(max_length=1, blank=True, help_text='Concepts that are replaced with a new concept are designated \'Updated\' (U) and concepts that are removed without replacement are \'Deprecated\' (D).')
    class Meta:
        managed = False
        db_table = 'omop_observation_period_person_status_concept'

class DrugEraDrugConcept(models.Model):
    concept_id = models.IntegerField(primary_key=True)
    concept_name = models.CharField(max_length=256, help_text='An unambiguous, meaningful and descriptive name for the concept.')
    concept_level = models.IntegerField(help_text='The level of hierarchy associated with the concept. Different concept levels are assigned to concepts to depict their seniority in a clearly defined hierarchy, such as drugs, conditions, etc. A concept level of 0 is assigned to concepts that are not part of a standard vocabulary, but are part of the vocabulary for reference purposes (e.g. drug form).')
    concept_class = models.CharField(max_length=60, help_text='The category or class of the concept along both the hierarchical tree as well as different domains within a vocabulary. Examples are \'Clinical Drug\', \'Ingredient\', \'Clinical Finding\' etc.')
    vocabulary_id = models.IntegerField()
    concept_code = models.CharField(max_length=40, help_text='The concept code represents the identifier of the concept in the source data it originates from, such as SNOMED-CT concept IDs, RxNorm RXCUIs etc. Note that concept codes are not unique across vocabularies.')
    valid_start_date = models.DateField(help_text='The date when the was first recorded.')
    valid_end_date = models.DateField(help_text='The date when the concept became invalid because it was deleted or superseded (updated) by a new concept. The default value is 31-Dec-2099.')
    invalid_reason = models.CharField(max_length=1, blank=True, help_text='Concepts that are replaced with a new concept are designated \'Updated\' (U) and concepts that are removed without replacement are \'Deprecated\' (D).')
    class Meta:
        managed = False
        db_table = 'omop_drug_era_drug_concept'

class ConditionEraConditionConcept(models.Model):
    concept_id = models.IntegerField(primary_key=True)
    concept_name = models.CharField(max_length=256, help_text='An unambiguous, meaningful and descriptive name for the concept.')
    concept_level = models.IntegerField(help_text='The level of hierarchy associated with the concept. Different concept levels are assigned to concepts to depict their seniority in a clearly defined hierarchy, such as drugs, conditions, etc. A concept level of 0 is assigned to concepts that are not part of a standard vocabulary, but are part of the vocabulary for reference purposes (e.g. drug form).')
    concept_class = models.CharField(max_length=60, help_text='The category or class of the concept along both the hierarchical tree as well as different domains within a vocabulary. Examples are \'Clinical Drug\', \'Ingredient\', \'Clinical Finding\' etc.')
    vocabulary_id = models.IntegerField()
    concept_code = models.CharField(max_length=40, help_text='The concept code represents the identifier of the concept in the source data it originates from, such as SNOMED-CT concept IDs, RxNorm RXCUIs etc. Note that concept codes are not unique across vocabularies.')
    valid_start_date = models.DateField(help_text='The date when the was first recorded.')
    valid_end_date = models.DateField(help_text='The date when the concept became invalid because it was deleted or superseded (updated) by a new concept. The default value is 31-Dec-2099.')
    invalid_reason = models.CharField(max_length=1, blank=True, help_text='Concepts that are replaced with a new concept are designated \'Updated\' (U) and concepts that are removed without replacement are \'Deprecated\' (D).')
    class Meta:
        managed = False
        db_table = 'omop_condition_era_condition_concept'

