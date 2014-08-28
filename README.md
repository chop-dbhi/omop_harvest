# OMOP + Harvest

# This application is temporarily broken for external deployment

In order to more quickly implement the project as part of CHOP's PEDSnet framework, external deployment is currenty broken. Once the omop_harvest application is separated from the pedsnet implementation of the app, as per [this issue](https://github.com/cbmi/omop_harvest/issues/61), the option for external deployment will come back on line. Please contact us at cbmisupport@email.chop.edu if you have urgent need to use the application and we will give you a more specific timeline.

### Explore the OMOP data model using Harvest

#### Query and explore your dataset by clicking the "Explore OMOP Harvest" link below

#### [Explore OMOP Harvest][1] | [Register][2]

Registration is required prior to use of the site.

## About OMOP and OSIM2:

The [Observational Medical Outcomes Partnership][3] (OMOP) has created a [Common Data Model][4] (CDM) to standardize the format and content of observational data, with the goal of enabling the application of standardized tools and methods to it. The database underlying this web application implements the fourth version of the OMOP CDM.

OMOP has also created the [Observational Medical Dataset Simulator Generation 2][5] (OSIM2) and released some datasets for general use. Scripts are included in the etl folder for using data from the OSIM2\_10M\_MSLR\_MEDDRA\_11 dataset with this Harvest app.

## About Harvest:

[Harvest][6] is a toolkit for building web applications that facilitates integrating, discovering, and reporting on data. It is developed and maintained by the [Center for Biomedical Informatics][7] (CBMi). It is nationally funded, designed for biomedical data _first_, open source and available on [GitHub][8], and it comes with an HTML5 web client.

For best performance, please use [Chrome][9], [Firefox][10] or [Safari][11].

## Install locally:

You can install this project on your local server, using any dataset in OMOP CDMV4 format or produced by OSIM2. These instructions are intended for use with a PostgreSQL database.

### 1. Make a python virtualenv for the project (optional but highly recommended)

    virtualenv omop_harvest_env

### 2. Clone the project repository

    cd omop_harvest_env
    git clone https://github.com/cbmi/omop_harvest.git

### 3. Install project requirements

    source bin/activate
    cd omop_harvest
    pip install -U -r requirements.txt

### 4. Load data into your database

- Using an OMOP released OSIM2 dataset (please review `etl/KNOWN_ISSUES.md` before filing issues related to this process)

    - Download and Extract Data
    
        - Download the Vocabulary data files from [http://omop.org/Vocabularies][12] (look for them in the right hand column)
        - Download the OSIM2 data using SFTP following the instructions at [http://omop.org/OSIM2][13] (OSIM2\_10M\_MSLR\_MEDDRA\_11 is known to work, but the others should as well)
        - Place both downloads in the `etl` folder and expand the vocabulary package there and the OSIM2 data package into `etl/OSIM2_10M_MSLR_MEDDRA_11/`
        - If you don't want the entire 10M patient OSIM2 dataset, we have created a one-fifth size subset of that data that can be provided by request
    
    - Pre-process the Data
    
        - Run the `etl/remove_pipes_and_double_quotes.sh` and `etl/remove_CDMV2_fields.sh` scripts. They should just work if you put all the downloaded data in the right place. It will take a while.
    
    - Create the Database Tables
    
        - Start a psql session and source both the `etl/OMOP_CDM_V4.0.DDL` and `etl/OMOP_Vocabulary_V4.DDL` files (use the `\i` psql command)
    
    - Load the Data
    
        - Make sure your psql session is running in the etl folder (the `\! pwd` and `\cd` commands will help), and then source both the `etl/OSIM2_data_load.psql` (or `etl/OSIM2_fth_load.psql` if you have the fifth-size dataset) and `etl/VocabV4_data_load.psql` files using the `\ir` command to take advantage of the relative path names in the scripts. This will take a _long time_.
    
- Using your own dataset

    - If your dataset _is not_ yet in a database, use some version of the preprocessing, table creation, data loading, and relationship creation scripts found in the `etl` folder. They will likely have to be modified depending on the format of your data and the target database. You might also look to the [dcc-loader project](https://github.com/PEDSnet/dcc-loader) for inspiration.

    - If your dataset _is_ in a database, then you may have to modify it to work with the Django ORM. For example, each table must have a single integer primary key field. Something like this might work:

            ALTER TABLE foo ADD COLUMN id SERIAL; 
            UPDATE foo SET id = DEFAULT;
            ALTER TABLE foo ADD PRIMARY KEY (id);

### 5. Configure local settings and connect Harvest to your database

    cp omop_harvest/local_settings.py.sample omop_harvest/local_settings.py

Edit the `omop_harvest/local_settings.py` file, specifically:
- Insert a unique secret key (can be generated at [http://www.miniwebtool.com/django-secret-key-generator/][14])
- Set up your database (documented at [https://docs.djangoproject.com/en/1.5/ref/settings/#databases][15])

### 6. Check concept table normalization SQL code

Especially if you are using your own data or any database other than PostgreSQL, check the SQL found on `lines #16-22 and #30-36` of `omop_harvest/migrations/0002_views.py` for compatibility.
This code creates tables, each of which represents Vocabulary concepts that apply to a particular field in the data model. This further normalization of the data model is necessary in order for Harvest to make these concepts available as expected. 
Make sure the SQL is compatible with your database and the tables which are referenced actually exist.

### 7. Run South migrations

    # Syncdb essential, non-South migration using apps
    python bin/manage.py syncdb
    # Fake the initial project model migration, as we already created the tables
    python bin/manage.py migrate --fake omop_harvest 0001
    # Migrate all apps forward; this will run the SQL code reviewed in the last step, so it may take a while
    python bin/manage.py syncdb --migrate 

### 8. Check the Django models

Again, if you are using your own data or a non-PGSQL database, it is especially important that you check the Django models defined in `omop_harvest/models.py`. 
Specifically, check to be sure the `db_table` setting references a real table for each model and that each field references a real column on that table. Notice, however, that `ForeignKey` fields will be named with the `_id` at the end of the column name truncated. 
The models with `managed = False` should reference the tables created in step 4 above.

### 9. Configure your server settings

We run our apps using an nginx server that passes requests to uWSGI processes managed by supervisord and include server settings to that effect in the `server` directory. You should do whatever is most comfortable for you. 
If you don't want to bother with a production-type server environment right now, just do `python bin/manage.py runserver 5678` and then open your browser and navigate to `http://localhost:5678`.

[1]:    http://resrhtiuws06.research.chop.edu/omop/query/ "Query OMOP Harvest"
[2]:    http://resrhtiuws06.research.chop.edu/omop/register/ "Register for OMOP Harvest access"
[3]:    http://omop.org "OMOP"
[4]:    http://omop.org/CDM "OMOP CDM"
[5]:    http://omop.org/OSIM2 "OMOP OSIM2"
[6]:    http://harvest.research.chop.edu "Harvest Site"
[7]:    http://cbmi.research.chop.edu "CBMi Home"
[8]:    https://github.com/cbmi/harvest/ "Harvest GitHub"
[9]:    http://www.google.com/chrome "Chrome Browser"
[10]:   http://www.mozilla.org "Firefox Browser"
[11]:   http://www.apple.com/safari/ "Safari Browser"
[12]:   http://omop.org/Vocabularies "OMOP Vocabularies"
[13]:   http://omop.org/OSIM2 "OMOP OSIM2"
[14]:   http://www.miniwebtool.com/django-secret-key-generator/ "Secret Key Generator"
[15]:   https://docs.djangoproject.com/en/1.5/ref/settings/#databases "Django Database Settings"
