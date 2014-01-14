### 1. Download and Extract Data

- Download the Vocabulary data files from http://omop.org/Vocabularies (look for them in the right hand column)
- Download the OSIM2 data using SFTP following the instructions at http://omop.org/OSIM2 (`OSIM2_10M_MSLR_MEDDRA_11` is known to work, but the others should as well)
- Place both downloads in this etl folder and expand them both here (the OSIM2 tarball does not include a root directory, please make one named exactly as the tarball and put all the expanded data in there)

### 2. Pre-process the Data

- Run the `remove_pipes_and_double_quotes.sh` script in this folder. It should just work if you put all the downloaded data in the right place. It will take a while.

### 3. Create the Database Tables

- Start a psql session and source both the `CDMV4_OSIM2_tables_postgres.ddl` and `VocabV4_tables_postgres.ddl` files (you can use the `\i` or `\ir` psql commands)

### 4. Load the Data into the Database

- Make sure your psql session is running in this etl folder (the `\! pwd` and `\cd` commands will help), and then source both the `OSIM2_data_load.psql` and `VocabV4_data_load.psql` files using the `\ir` command to take advantage of the relative path names in the scripts. This will take a _long time_.

### 5. Create Database Relationships

- Source both the `CDMV4_OSIM2_relations_postgres.ddl` and `VocabV4_relations_postgres.ddl` (relative pathnames are not used). This will take less time than the last step, but still a _lot_ of time.

#### 6. Enjoy your OSIM2 Data in OMOP CDMV4 format in PostgreSQL!!!
