CREATE TABLE OMOP_CONCEPT (
  CONCEPT_ID		INTEGER		PRIMARY KEY,
  CONCEPT_NAME		VARCHAR(256)	NOT NULL,
  CONCEPT_LEVEL		INTEGER		NOT NULL,
  CONCEPT_CLASS		VARCHAR(60)	NOT NULL,
  VOCABULARY_ID		INTEGER		NOT NULL,
  CONCEPT_CODE		VARCHAR(40)	NOT NULL,
  VALID_START_DATE	DATE		NOT NULL,
  VALID_END_DATE	DATE		NOT NULL,
  INVALID_REASON	CHAR(1)		NULL)
;

COMMENT ON TABLE OMOP_CONCEPT IS 'A list of all valid terminology concepts across domains and their attributes. Concepts are derived from existing standards.'
;
COMMENT ON COLUMN OMOP_CONCEPT.CONCEPT_ID IS 'A system-generated identifier to uniquely identify each concept across all concept types.'
;
COMMENT ON COLUMN OMOP_CONCEPT.CONCEPT_NAME IS 'An unambiguous, meaningful and descriptive name for the concept.'
;
COMMENT ON COLUMN OMOP_CONCEPT.CONCEPT_LEVEL IS 'The level of hierarchy associated with the concept. Different concept levels are assigned to concepts to depict their seniority in a clearly defined hierarchy, such as drugs, conditions, etc. A concept level of 0 is assigned to concepts that are not part of a standard vocabulary, but are part of the vocabulary for reference purposes (e.g. drug form).'
;
COMMENT ON COLUMN OMOP_CONCEPT.CONCEPT_CLASS IS 'The category or class of the concept along both the hierarchical tree as well as different domains within a vocabulary. Examples are ''Clinical Drug'', ''Ingredient'', ''Clinical Finding'' etc.'
;
COMMENT ON COLUMN OMOP_CONCEPT.VOCABULARY_ID IS 'A foreign key to the vocabulary table indicating from which source the concept has been adapted.'
;
COMMENT ON COLUMN OMOP_CONCEPT.CONCEPT_CODE IS 'The concept code represents the identifier of the concept in the source data it originates from, such as SNOMED-CT concept IDs, RxNorm RXCUIs etc. Note that concept codes are not unique across vocabularies.'
;
COMMENT ON COLUMN OMOP_CONCEPT.VALID_START_DATE IS 'The date when the was first recorded.'
;
ALTER TABLE OMOP_CONCEPT ALTER COLUMN VALID_END_DATE SET DEFAULT '31-Dec-2099'
;
COMMENT ON COLUMN OMOP_CONCEPT.VALID_END_DATE IS 'The date when the concept became invalid because it was deleted or superseded (updated) by a new concept. The default value is 31-Dec-2099.'
;
COMMENT ON COLUMN OMOP_CONCEPT.INVALID_REASON IS 'Concepts that are replaced with a new concept are designated "Updated" (U) and concepts that are removed without replacement are "Deprecated" (D).'
;
ALTER TABLE OMOP_CONCEPT ADD CHECK ( invalid_reason IN ('D', 'U'))
;

CREATE TABLE OMOP_CONCEPT_ANCESTOR (
  ANCESTRY_ID               SERIAL PRIMARY KEY,
  ANCESTOR_CONCEPT_ID		INTEGER	NOT NULL,
  DESCENDANT_CONCEPT_ID		INTEGER	NOT NULL,
  MAX_LEVELS_OF_SEPARATION	INTEGER NULL,
  MIN_LEVELS_OF_SEPARATION	INTEGER	NULL)
;

COMMENT ON TABLE OMOP_CONCEPT_ANCESTOR IS 'A specialized table containing only hierarchical relationship between concepts that may span several generations.'
;
COMMENT ON COLUMN OMOP_CONCEPT_ANCESTOR.ANCESTRY_ID IS 'CBMi added single serial unique identifer for records in the omop_concept_ancestor table.'
;
COMMENT ON COLUMN OMOP_CONCEPT_ANCESTOR.ANCESTOR_CONCEPT_ID IS 'A foreign key to the concept code in the concept table for the higher-level concept that forms the ancestor in the relationship.'
;
COMMENT ON COLUMN OMOP_CONCEPT_ANCESTOR.DESCENDANT_CONCEPT_ID IS 'A foreign key to the concept code in the concept table for the lower-level concept that forms the descendant in the relationship.'
;
COMMENT ON COLUMN OMOP_CONCEPT_ANCESTOR.MAX_LEVELS_OF_SEPARATION IS 'The maximum separation in number of levels of hierarchy between ancestor and descendant concepts. This is an optional attribute that is used to simplify hierarchic analysis. '
;
COMMENT ON COLUMN OMOP_CONCEPT_ANCESTOR.MIN_LEVELS_OF_SEPARATION IS 'The minimum separation in number of levels of hierarchy between ancestor and descendant concepts. This is an optional attribute that is used to simplify hierarchic analysis.'
;
CREATE UNIQUE INDEX OMOP_CONCEPT_ANCESTOR_IDX ON OMOP_CONCEPT_ANCESTOR
    (
     ANCESTOR_CONCEPT_ID ASC ,
     DESCENDANT_CONCEPT_ID ASC
    )
;

CREATE TABLE OMOP_CONCEPT_RELATIONSHIP (
  CONCEPT_RELATIONSHIP_ID   SERIAL  PRIMARY KEY,
  CONCEPT_ID_1		INTEGER	NOT NULL,
  CONCEPT_ID_2		INTEGER	NOT NULL,
  RELATIONSHIP_ID	INTEGER	NOT NULL,
  VALID_START_DATE	DATE	NOT NULL,
  VALID_END_DATE	DATE	NOT NULL,
  INVALID_REASON	CHAR(1)	NULL)
;

COMMENT ON TABLE OMOP_CONCEPT_RELATIONSHIP IS 'A list of relationship between concepts. Some of these relationships are generic (e.g. ''Subsumes'' relationship), others are domain-specific.'
;
COMMENT ON COLUMN OMOP_CONCEPT_RELATIONSHIP.CONCEPT_RELATIONSHIP_ID IS 'CBMi added single serial unique identifer for records in the omop_concept_relationship table.'
;
COMMENT ON COLUMN OMOP_CONCEPT_RELATIONSHIP.CONCEPT_ID_1 IS 'A foreign key to the concept in the concept table associated with the relationship. Relationships are directional, and this field represents the source concept designation.'
;
COMMENT ON COLUMN OMOP_CONCEPT_RELATIONSHIP.CONCEPT_ID_2 IS 'A foreign key to the concept in the concept table associated with the relationship. Relationships are directional, and this field represents the destination concept designation.'
;
COMMENT ON COLUMN OMOP_CONCEPT_RELATIONSHIP.RELATIONSHIP_ID IS 'The type of relationship as defined in the relationship table.'
;
COMMENT ON COLUMN OMOP_CONCEPT_RELATIONSHIP.VALID_START_DATE IS 'The date when the the relationship was first recorded.'
;
ALTER TABLE OMOP_CONCEPT_RELATIONSHIP ALTER COLUMN VALID_END_DATE SET DEFAULT '31-Dec-2099'
;
COMMENT ON COLUMN OMOP_CONCEPT_RELATIONSHIP.VALID_END_DATE IS 'The date when the relationship became invalid because it was deleted or superseded (updated) by a new relationship. Default value is 31-Dec-2099.'
;
COMMENT ON COLUMN OMOP_CONCEPT_RELATIONSHIP.INVALID_REASON IS 'Reason the relationship was invalidated. Possible values are D (deleted), U (replaced with an update) or NULL when valid_end_date has the default  value.'
;
CREATE UNIQUE INDEX OMOP_CONCEPT_RELATIONSHIP_IDX ON OMOP_CONCEPT_RELATIONSHIP
    (
     CONCEPT_ID_1 ASC ,
     CONCEPT_ID_2 ASC ,
     RELATIONSHIP_ID ASC
    )
;
ALTER TABLE OMOP_CONCEPT_RELATIONSHIP ADD CHECK ( invalid_reason IN ('D', 'U'))
;

CREATE TABLE OMOP_CONCEPT_SYNONYM (
  CONCEPT_SYNONYM_ID	INTEGER		PRIMARY KEY,
  CONCEPT_ID		INTEGER		NOT NULL,
  CONCEPT_SYNONYM_NAME	VARCHAR(1000)	NOT NULL)
;

COMMENT ON TABLE OMOP_CONCEPT_SYNONYM IS 'A table with synonyms for concepts that have more than one valid name or description.'
;
COMMENT ON COLUMN OMOP_CONCEPT_SYNONYM.CONCEPT_SYNONYM_ID IS 'A system-generated unique identifier for each concept synonym.'
;
COMMENT ON COLUMN OMOP_CONCEPT_SYNONYM.CONCEPT_ID IS 'A foreign key to the concept in the concept table. '
;
COMMENT ON COLUMN OMOP_CONCEPT_SYNONYM.CONCEPT_SYNONYM_NAME IS 'The alternative name for the concept.'
;

CREATE TABLE OMOP_DRUG_APPROVAL (
  INGREDIENT_CONCEPT_ID	INTEGER		PRIMARY KEY,
  APPROVAL_DATE		DATE		NOT NULL,
  APPROVED_BY		VARCHAR(20)	NOT NULL)
;
ALTER TABLE OMOP_DRUG_APPROVAL ALTER COLUMN APPROVED_BY SET DEFAULT 'FDA'
;

CREATE TABLE OMOP_DRUG_STRENGTH (
  DRUG_CONCEPT_ID		INTEGER		PRIMARY KEY,
  INGREDIENT_CONCEPT_ID		INTEGER		NOT NULL,
  AMOUNT_VALUE			NUMERIC(50)		NULL,
  AMOUNT_UNIT			VARCHAR(60)	NULL,
  CONCENTRATION_VALUE		NUMERIC(50)		NULL,
  CONCENTRATION_ENUM_UNIT	VARCHAR(60)	NULL,
  CONCENTRATION_DENOM_UNIT	VARCHAR(60)	NULL,
  VALID_START_DATE		DATE		NOT NULL,
  VALID_END_DATE		DATE		NOT NULL,
  INVALID_REASON		VARCHAR(1)	NULL)
;

CREATE TABLE OMOP_RELATIONSHIP (
  RELATIONSHIP_ID	INTEGER		PRIMARY KEY,
  RELATIONSHIP_NAME	VARCHAR(256)	NOT NULL,
  IS_HIERARCHICAL	INTEGER		NOT NULL,
  DEFINES_ANCESTRY	INTEGER		NOT NULL,
  REVERSE_RELATIONSHIP	INTEGER		NULL)
;

COMMENT ON TABLE OMOP_RELATIONSHIP IS 'A list of relationship between concepts. Some of these relationships are generic (e.g. "Subsumes" relationship), others are domain-specific.'
;
COMMENT ON COLUMN OMOP_RELATIONSHIP.RELATIONSHIP_ID IS 'The type of relationship captured by the relationship record.'
;
COMMENT ON COLUMN OMOP_RELATIONSHIP.RELATIONSHIP_NAME IS 'The text that describes the relationship type.'
;
COMMENT ON COLUMN OMOP_RELATIONSHIP.IS_HIERARCHICAL IS 'Defines whether a relationship defines concepts into classes or hierarchies. Values are Y for hierarchical relationship or NULL if not'
;
ALTER TABLE OMOP_RELATIONSHIP ALTER COLUMN DEFINES_ANCESTRY SET DEFAULT 1
;
COMMENT ON COLUMN OMOP_RELATIONSHIP.DEFINES_ANCESTRY IS 'Defines whether a hierarchical relationship contributes to the concept_ancestor table. These are subsets of the hierarchical relationships. Valid values are Y or NULL.'
;
COMMENT ON COLUMN OMOP_RELATIONSHIP.REVERSE_RELATIONSHIP IS 'Relationship ID of the reverse relationship to this one. Corresponding records of reverse relationships have their concept_id_1 and concept_id_2 swapped.'
;

CREATE TABLE OMOP_SOURCE_TO_CONCEPT_MAP (
  SOURCE_TO_CONCEPT_MAP_ID  SERIAL  PRIMARY KEY,
  SOURCE_CODE			VARCHAR(40)	NOT NULL,
  SOURCE_VOCABULARY_ID		INTEGER		NOT NULL,
  SOURCE_CODE_DESCRIPTION	VARCHAR(256)	NULL,
  TARGET_CONCEPT_ID		INTEGER		NOT NULL,
  TARGET_VOCABULARY_ID		INTEGER		NOT NULL,
  MAPPING_TYPE			VARCHAR(20)	NULL,
  PRIMARY_MAP			CHAR(1)		NULL,
  VALID_START_DATE		DATE		NOT NULL,
  VALID_END_DATE		DATE		NOT NULL,
  INVALID_REASON		CHAR(1)		NULL)
;

COMMENT ON TABLE OMOP_SOURCE_TO_CONCEPT_MAP IS 'A map between commonly used terminologies and the CDM Standard Vocabulary. For example, drugs are often recorded as NDC, while the Standard Vocabulary for drugs is RxNorm.'
;
COMMENT ON COLUMN OMOP_SOURCE_TO_CONCEPT_MAP.SOURCE_TO_CONCEPT_MAP_ID IS 'CBMi added single serial unique identifer for records in the omop_soruce_to_concept_map table.'
;
COMMENT ON COLUMN OMOP_SOURCE_TO_CONCEPT_MAP.SOURCE_CODE IS 'The source code being translated into a standard concept.'
;
COMMENT ON COLUMN OMOP_SOURCE_TO_CONCEPT_MAP.SOURCE_VOCABULARY_ID IS 'A foreign key to the vocabulary table defining the vocabulary of the source code that is being mapped to the standard vocabulary.'
;
COMMENT ON COLUMN OMOP_SOURCE_TO_CONCEPT_MAP.SOURCE_CODE_DESCRIPTION IS 'An optional description for the source code. This is included as a convenience to compare the description of the source code to the name of the concept.'
;
COMMENT ON COLUMN OMOP_SOURCE_TO_CONCEPT_MAP.TARGET_CONCEPT_ID IS 'A foreign key to the concept to which the source code is being mapped.'
;
COMMENT ON COLUMN OMOP_SOURCE_TO_CONCEPT_MAP.TARGET_VOCABULARY_ID IS 'A foreign key to the vocabulary table defining the vocabulary of the target concept.'
;
COMMENT ON COLUMN OMOP_SOURCE_TO_CONCEPT_MAP.MAPPING_TYPE IS 'A string identifying the observational data element being translated. Examples include ''DRUG'', ''CONDITION'', ''PROCEDURE'', ''PROCEDURE DRUG'' etc. It is important to pick the appropriate mapping record when the same source code is being mapped to different concepts in different contexts. As an example a procedure code for drug administration can be mapped to a procedure concept or a drug concept.'
;
COMMENT ON COLUMN OMOP_SOURCE_TO_CONCEPT_MAP.PRIMARY_MAP IS 'A boolean value identifying the primary mapping relationship for those sets where the source_code, the source_concept_type_id and the mapping type is identical (one-to-many mappings). The ETL will only consider the primary map. Permitted values are Y and null.'
;
COMMENT ON COLUMN OMOP_SOURCE_TO_CONCEPT_MAP.VALID_START_DATE IS 'The date when the mapping instance was first recorded.'
;
ALTER TABLE OMOP_SOURCE_TO_CONCEPT_MAP ALTER COLUMN VALID_END_DATE SET DEFAULT '31-Dec-2099'
;
COMMENT ON COLUMN OMOP_SOURCE_TO_CONCEPT_MAP.VALID_END_DATE IS 'The date when the mapping instance became invalid because it was deleted or superseded (updated) by a new relationship. Default value is 31-Dec-2099.'
;
COMMENT ON COLUMN OMOP_SOURCE_TO_CONCEPT_MAP.INVALID_REASON IS 'Reason the mapping instance was invalidated. Possible values are D (deleted), U (replaced with an update) or NULL when valid_end_date has the default  value.'
;
CREATE INDEX OMOP_SOURCE_TO_CONCEPT_SOURCE_IDX ON OMOP_SOURCE_TO_CONCEPT_MAP (SOURCE_CODE ASC)
;
CREATE UNIQUE INDEX OMOP_SOURCE_TO_CONCEPT_MAP_IDX ON OMOP_SOURCE_TO_CONCEPT_MAP
    (
     SOURCE_VOCABULARY_ID ASC ,
     TARGET_CONCEPT_ID ASC ,
     SOURCE_CODE ASC ,
     VALID_END_DATE ASC
    )
;
ALTER TABLE OMOP_SOURCE_TO_CONCEPT_MAP ADD CHECK ( primary_map IN ('Y'))
;
ALTER TABLE OMOP_SOURCE_TO_CONCEPT_MAP ADD CHECK ( invalid_reason IN ('D', 'U'))
;

CREATE TABLE OMOP_VOCABULARY (
  VOCABULARY_ID		INTEGER		PRIMARY KEY,
  VOCABULARY_NAME	VARCHAR(256)	NOT NULL)
;

COMMENT ON TABLE OMOP_VOCABULARY IS 'A combination of terminologies and classifications that belong to a Vocabulary Domain.'
;
COMMENT ON COLUMN OMOP_VOCABULARY.VOCABULARY_ID IS 'Unique identifier for each of the vocabulary sources used in the observational analysis.'
;
COMMENT ON COLUMN OMOP_VOCABULARY.VOCABULARY_NAME IS 'Elaborative name for each of the vocabulary sources'
;
ALTER TABLE OMOP_VOCABULARY ADD CONSTRAINT OMOP_UNIQUE_VOCABULARY_NAME UNIQUE (VOCABULARY_NAME)
;

