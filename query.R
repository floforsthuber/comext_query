# Query function

query <- function(branch='main',
DATASET_NAME, QUERY_NAME, REPORTER, PARTNER, PRODUCT, FLOW, TYPE, PERIOD, FREQUENCY, INDICATORS, ROW,
OUTPUT_FORMAT, BATCH, LABELS){

# Create the folder that all the files use for their output
dir <- paste0('C:/Users/', Sys.getenv('USERNAME'), '/Desktop/', c('comext_query', paste0('comext_query/', format(Sys.Date()))))
for(i in dir){
    if(!dir.exists(i)){
        dir.create(i)
    }
}

# Callilng a development branch
url_github <- 'https://raw.githubusercontent.com/forsthuber92/comext_query'
url_github <- ifelse(branch == 'main', paste0(url_github, '/main'), paste0(url_github, '/', branch))

# Setup
source(paste0(url_github, '/Setup/Libraries.R'))

# Scripts
source(paste0(url_github, '/Scripts/input_list.R'), local = TRUE)
source(paste0(url_github, '/Scripts/write_lines.R'), local = TRUE)

}