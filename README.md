# Comext Text Query

**Project owner(s):** Florian Forsthuber (*flo.forsthuber@kuleuven.be*)

**Project outline:** *small R based program to facilitate text queries for [Comext](http://epp.eurostat.ec.europa.eu/newxtweb/) (EU international trade data)*

**Project status:** *early development (operational for the following datasets: DS-045409, DS-058342, DS-018995, DS-059071, i.e. HS2-6, CN8 and SITC)*

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
    REPORTER = c('AT', 'EU27_2020'),            # Eurostat country codes (strings)
    PARTNER = c('BE', 'EU27_2020_EXTRA'),       # Eurostat country codes (strings)
    PRODUCT = c('01', '02'),                    # products codes (strings or integers)
    FLOW = c(1, 2),                             # flow codes [imports = 1, exports = 2] (strings or integers)
    TYPE = 'CN',                                # type of dataset ['HS', 'CN' or 'SITC'] (string)
    PERIOD = c(2020, 2021),                     # start and end year (integers!) 
    FREQUENCY = c('A'),                         # frequency of observation [annually = A, monthly = M, both = B] (string)
    INDICATORS = c('VALUE_IN_EUROS', 'QUANTITY_IN_100KG'), # Eurostat indicator variables (strings)
    ROW = 'REPORTER',                           # dimension displayed on rows ['REPORTER' or 'PARTNER'] (string)
    OUTPUT_FORMAT = 'CSV',                      # query output format [CSV, DMP, DSPL, EXCEL, HTML, PDF, TCSV...] (strings)
    BATCH = 'ON',                               # activate/deactivate batch mode [ON/OFF] (string)
    LABELS = 'B'                                # labels of variables [code = C, name = L, both = B] (string)
)
```
The indicator **(string)** simply means that the function argument needs to be specified with (single or double) quotation marks, in contrast to **(integers)** which need to be inserted without quotation marks.

Running the correctly specified *query function* will create a ".properties" file (can be opened with any text editor) in a folder named after today's date within the overall folder "comext_query" on your desktop, i.e. `C:/Users/YOUR_USERNAME/Desktop/comext_query`.

Simply open the file with the Comext text query tool and the download should start. If there are misspecifications *Comext* will point them out and you can perform some manual changes within the Comext edtior.

You can see the progress of your download under "Batch jobs" and download the output under "Completed Works".

Enjoy!

## Future Work

- *add more datasets:* in particular BEC
- *make switching between datasets easier:* automatic adjustments, problem in the naming convention of Eurostat (different indicators variable names CN8 vs SITC)
- *write the same program in Julia for practice*