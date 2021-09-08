# Comext Text Query

Project owner(s): Florian Forsthuber (*flo.forsthuber@kuleuven.be*)

Project outline: *small R based program to facilitate text queries for [Comext](http://epp.eurostat.ec.europa.eu/newxtweb/) (EU international trade data)*

Project status: *early development (operational for the following datasets: DS-045409, DS-058342, DS-018995, DS-059071, i.e. HS2-6, CN8 and SITC)*

**To perform a [Comext](http://epp.eurostat.ec.europa.eu/newxtweb/) text query you require an account with Eurostat!**

## User Manual

Source the main function from GitHub into your R environment
```
source('https://raw.githubusercontent.com/forsthuber92/comext_query/main/query.R')
```
and correctly specify the input arguments (*see example below*).
```
query(
    DATASET_NAME = 'DS-045409',                 # the unique identification code for the dataset you would like to query (string)
    QUERY_NAME = 'CN8_2020_QUERY',              # if not specified it uses the DATASET_NAME (string)
    REPORTER = c('AT', 'EU27_2020'),            # Eurostat country codes (string)
    PARTNER = c('BE', 'EU27_2020_EXTRA'),       # Eurostat country codes (string)
    PRODUCT = c('01', '02'),                    # products codes (string or integer)
    FLOW = c(1, 2),                             # flow codes [imports = 1, exports = 2]
    TYPE = 'CN',                                # type of dataset ['HS', 'CN' or 'SITC'] (string)
    PERIOD = c(2020, 2021),                     # start and end year (integers!) 
    FREQUENCY = c('A'),                         # frequency of observation [annually = A, monthly = M, both = B] (string)
    INDICATORS = c('VALUE_IN_EUROS', 'QUANTITY_IN_100KG'), # Eurostat indicator variables (string)
    ROW = 'REPORTER',                           # dimension displayed on rows ['REPORTER' or 'PARTNER'] (string)
    OUTPUT_FORMAT = 'CSV',                      # query output format [CSV, DMP, DSPL, EXCEL, HTML, PDF, TCSV...] (string)
    BATCH = 'ON',                               # activate/deactivate batch mode [ON/OFF] (string)
    LABELS = 'B'                                # labels of variables [code = C, name = L, both = B] (string)
)
```
This will create a ".properties" file (open with text editor) in a folder named after today's date within the overall folder "comext_query" on your desktop.

Simply open the file with the Comext text query tool and the download should start.

You can see the progress of your download under "Batch jobs" and download the output under "Completed Works".

Enjoy!

## Work to be done

- *add more datasets:* in particular BEC
- *make switching between datasets easier:* automatic adjustments, problem in the naming convention of Eurostat (different indicators variable names CN8 vs SITC)
- *write in Julia for practice*