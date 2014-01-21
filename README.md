# OMOP CDMV4 Harvest with OSIM2 Data

A starting place for CBMi's participation in PCORI as a data hub.

### Quick Start

- Follow the instructions in etl/README.md to load data into your PostgreSQL database.
- Run `python bin/manage.py migrate omop_harvest 0001 --fake` to bring South up to speed on the DDL and ETL you just did.
- Next steps