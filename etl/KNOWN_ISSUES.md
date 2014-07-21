### Vocabulary Foreign Keys

> omop_harvest=> ALTER TABLE source_to_concept_map ADD CONSTRAINT source_to_concept_concept FOREIGN KEY (target_concept_id) REFERENCES concept (concept_id);
> ERROR:  insert or update on table "source_to_concept_map" violates foreign key constraint "source_to_concept_concept"
> DETAIL:  Key (target_concept_id)=(43084597) is not present in table "concept".

> omop_harvest=> select * from source_to_concept_map where (target_concept_id)=(43084597);
>  source_to_concept_map_id | source_code | source_vocabulary_id |          source_code_description          | target_concept_id | target_vocabulary_id |  mapping_type  | primary_map | valid_start_date | valid_end_date | invalid_reason
> --------------------------+-------------+----------------------+-------------------------------------------+-------------------+----------------------+----------------+-------------+------------------+----------------+----------------
>                   1015010 | 7G2AC00     |                   17 | Insertion of gonadorelin analogue implant |          43084597 |                    8 | PROCEDURE DRUG | Y           | 1970-01-01       | 2099-12-31     |
> (1 row)

In this implementation, the relevant record was deleted from the source_to_concept_map table.

### Vocabulary Use with OSIM2

> omop_harvest=> SELECT count(*) FROM condition_era JOIN concept ON condition_era.condition_type_concept_id = concept.concept_id;
>  count 
> -------
>      0
> (1 row)

condition_era is loaded from OSIM2 which uses CDMV2, so OSIM2 column condition_occurrence_type was imported to CDMV4 column condition_type_concept_id following this line in the docs:
> condition_era; condition_type_concept_id; Changed name from condition_occurrence_type. Reference values are now stored as concepts in the concept table.
Apparently, however, the OSIM2 data does not match Vocabulary V4 concepts.

> omop_harvest=> SELECT count(*) FROM drug_era JOIN concept ON drug_era.drug_type_concept_id = concept.concept_id;
>  count
> -------
>      0
> (1 row)

drug_era is loaded from OSIM2 which uses CDMV2, so OSIM2 column drug_exposure_type was imported to CDMV4 column drug_type_concept_id following this line in the docs:
> drug_era; drug_type_concept_id; Changed name from drug_exposure_type. Reference values are now stored as concepts in the concept table.
Apparently, however, the OSIM2 data does not match Vocabulary V4 concepts.
