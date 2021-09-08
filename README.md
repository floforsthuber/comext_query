# Comext Text Query

Project owner(s): Florian Forsthuber (*flo.forsthuber@kuleuven.be*)

Project outline: *small R based program to facilitate text queries for [Comext](http://epp.eurostat.ec.europa.eu/newxtweb/) (EU international trade data)*

Project status: *early development*

## User Manual
**Notice to perfrom a [Comext](http://epp.eurostat.ec.europa.eu/newxtweb/) text query an account with Eurostat is required!**
 
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
    PARTNER = c('BE', 'EU27_2020'),             # Eurostat country codes (string)
    PRODUCT = c('01', '02'),                    # products codes (string or integer)
    FLOW = c(1, 2),                             # flow codes [imports = 1, exports = 2]
    TYPE = 'CN',                                # type of dataset ['HS', 'CN' or 'SITC'] (string)
    PERIOD = c(2020, 2021),                     # start and end year (integers!) 
    FREQUENCY = c('A'),                         # frequency of observation [annually = A, monthly = M, both = B] (string)
    INDICATORS = c('VALUE_1000EURO', 'QUANTITY_TON', 'SUP_QUANTITY'), # Eurostat indicator variables (string)
    ROW = 'REPORTER',                           # dimension displayed on rows ['REPORTER' or 'PARTNER'] (string)
    OUTPUT_FORMAT = 'CSV',                      # query output format [CSV, DMP, DSPL, EXCEL, HTML, PDF, TCSV...] (string)
    BATCH = 'ON',                               # activate/deactivate batch mode [ON/OFF] (string)
    LABELS = 'B'                                # labels of variables [code = C, name = L, both = B] (string)
)
```
This will create a .txt file in a folder named after today's date within the overall folder "comext_query" on your desktop.

Simply open the file with the Comext text query tool and the download should start. Enjoy!