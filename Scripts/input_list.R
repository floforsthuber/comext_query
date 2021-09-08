
# Input for PERIOD
years <- as.character(c(PERIOD[1]:PERIOD[2]))
if(FREQUENCY=='A'){years <- paste0(years, '52')}else{years <- years}
if(FREQUENCY=='B'){months <- as.character(c(1:12, 52))}else{months <- as.character(c(1:12))}
months <- str_pad(months, width=2, side="left", pad="0")

range <- years
if(FREQUENCY %in% c('M', 'B')){
    range <- c()
    for(i in years){
        range <- c(range, paste0(i, months))
    }
}

# Summary list with all input variables used for generating .txt file
input <- list(
    DATASET_NAME = DATASET_NAME,
    QUERY_NAME = ifelse(missing(QUERY_NAME), paste0(DATASET_NAME, '_QUERY'), QUERY_NAME),
    REPORTER = REPORTER,
    PARTNER = PARTNER,
    PRODUCT = PRODUCT,
    FLOW = FLOW,
    STAT_REGIME = ifelse(TYPE %in% c('CN', 'HS'), 'NORMAL', ''),
    PERIOD = range,
    INDICATORS = INDICATORS,
    IN_LINES = ROW,
    IN_COLUMNS = ifelse(ROW=='REPORTER', 'PARTNER', 'REPORTER'),
    OUTPUT_FORMAT = OUTPUT_FORMAT,
    BATCH = BATCH,
    BATCH_OUTPUT_FORMAT = ifelse(BATCH=='ON', OUTPUT_FORMAT, ''),
    BATCH_OUTPUT_LABELS_TYPE = LABELS
)