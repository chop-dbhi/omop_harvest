CREATE OR REPLACE VIEW omop_person_gender_concept AS SELECT * FROM omop_concept WHERE EXISTS (SELECT NULL FROM omop_person WHERE omop_person.gender_concept_id = omop_concept.concept_id);

CREATE OR REPLACE VIEW omop_person_race_concept AS SELECT * FROM omop_concept WHERE EXISTS (SELECT NULL FROM omop_person WHERE omop_person.race_concept_id = omop_concept.concept_id);

CREATE OR REPLACE VIEW omop_person_ethnicity_concept AS SELECT * FROM omop_concept WHERE EXISTS (SELECT NULL FROM omop_person WHERE omop_person.ethnicity_concept_id = omop_concept.concept_id);

CREATE OR REPLACE VIEW omop_person_location_concept AS SELECT * FROM omop_concept WHERE EXISTS (SELECT NULL FROM omop_person WHERE omop_person.location_concept_id = omop_concept.concept_id);

CREATE OR REPLACE VIEW omop_observation_period_person_status_concept AS SELECT * FROM omop_concept WHERE EXISTS (SELECT NULL FROM omop_observation_period WHERE omop_observation_period.person_status_concept_id = omop_concept.concept_id);

CREATE OR REPLACE VIEW omop_drug_era_drug_concept AS SELECT * FROM omop_concept WHERE EXISTS (SELECT NULL FROM omop_drug_era WHERE omop_drug_era.drug_concept_id = omop_concept.concept_id);

CREATE OR REPLACE VIEW omop_condition_era_condition_concept AS SELECT * FROM omop_concept WHERE EXISTS (SELECT NULL FROM omop_condition_era WHERE omop_condition_era.condition_concept_id = omop_concept.concept_id);

