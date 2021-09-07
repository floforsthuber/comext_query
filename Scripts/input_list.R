
# Input for PERIOD
years <- as.character(c(2005:2020))
years <- ifelse(FREQUENCY=='A', paste0(years, '52', years)
months <- as.character(ifelse(FREQUENCY=='B', c(1:12, 52), c(1:12))
months <- str_pad(months, width=2, side="left", pad="0")

range <- c()
if(FREQUENCY %in% c('M', 'B')){
   for(i in years){
    range <- c(range, paste0(i, months))
} else {
    range <- years
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
    STAT_REGIME = ifelse(TYPE %in% c('HS', 'CN'), 'NORMAL', '')
    PERIOD = range,
    INDICATORS = INDICATORS,
    IN_LINES = ROW,
    IN_COLUMNS = ifelse(ROW=="REPORTER", "PARTNER", "REPORTER"),
    OUTPUT_FORMAT = OUTPUT_FORMAT,
    BATCH = BATCH,
    BATCH_OUTPUT_FORMAT = ifelse(BATCH=='ON', OUTPUT_FORMAT, ''),
    BATCH_OUTPUT_LABELS_TYPE = LABELS
)