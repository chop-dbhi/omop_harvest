### Data Loading

> omop_harvest=> \copy omop_drug_strength FROM './vocabulary_4_unrestricted_csv/drug_strength.csv' WITH DELIMITER ',' CSV HEADER
> ERROR:  duplicate key value violates unique constraint "omop_drug_strength_pkey"
> DETAIL:  Key (drug_concept_id)=(19113355) already exists.
> CONTEXT:  COPY omop_drug_strength, line 243

drug_strength.csv lines 1, 242-243:
> "DRUG_CONCEPT_ID","INGREDIENT_CONCEPT_ID","AMOUNT_VALUE","AMOUNT_UNIT","CONCENTRATION_VALUE","CONCENTRATION_ENUM_UNIT","CONCENTRATION_DENOM_UNIT","VALID_START_DATE","VALID_END_DATE","INVALID_REASON"
> 19113355,1125315,300,"mg",,,,1970-01-01,2099-12-31,
> 19113355,1201620,30,"mg",,,,1970-01-01,2099-12-31,

### Adding Foreign Keys

> omop_harvest=> ALTER TABLE OMOP_SOURCE_TO_CONCEPT_MAP ADD CONSTRAINT OMOP_SOURCE_TO_CONCEPT_CONCEPT FOREIGN KEY (TARGET_CONCEPT_ID) REFERENCES OMOP_CONCEPT (CONCEPT_ID);
> ERROR:  insert or update on table "omop_source_to_concept_map" violates foreign key constraint "omop_source_to_concept_concept"
> DETAIL:  Key (target_concept_id)=(43084597) is not present in table "omop_concept".

> omop_harvest=> select * from omop_source_to_concept_map where (target_concept_id)=(43084597);
>  source_to_concept_map_id | source_code | source_vocabulary_id |          source_code_description          | target_concept_id | target_vocabulary_id |  mapping_type  | primary_map | valid_start_date | valid_end_date | invalid_reason
> --------------------------+-------------+----------------------+-------------------------------------------+-------------------+----------------------+----------------+-------------+------------------+----------------+----------------
>                   1015010 | 7G2AC00     |                   17 | Insertion of gonadorelin analogue implant |          43084597 |                    8 | PROCEDURE DRUG | Y           | 1970-01-01       | 2099-12-31     |
> (1 row)

### Vocabulary Use

> omop_harvest=> SELECT count(*) FROM omop_condition_era JOIN omop_concept ON omop_condition_era.condition_type_concept_id = omop_concept.concept_id;
>  count 
> -------
>      0
> (1 row)

omop_condition_era is loaded from OSIM2 which uses CDMV2, so OSIM2 column condition_occurrence_type was imported to CDMV4 column condition_type_concept_id following this line in the docs:
> condition_era; condition_type_concept_id; Changed name from condition_occurrence_type. Reference values are now stored as concepts in the concept table.

> omop_harvest=> SELECT count(*) FROM omop_drug_era JOIN omop_concept ON omop_drug_era.drug_type_concept_id = omop_concept.concept_id;
>  count
> -------
>      0
> (1 row)

omop_drug_era is loaded from OSIM2 which uses CDMV2, so OSIM2 column drug_exposure_type was imported to CDMV4 column drug_type_concept_id following this line in the docs:
> drug_era; drug_type_concept_id; Changed name from drug_exposure_type. Reference values are now stored as concepts in the concept table.

