
# Set working directory to todays output folder
setwd(dir[2])

# Create text for the .txt file
query_text <- paste0(
'# Comext query generated on: ', format(Sys.time(), "%B %d, %Y at %H:%M"), '\n\n',
'# -----------------------', '\n',
'# Mandatory Parameters', '\n',
'# -----------------------', '\n\n',
'# Dataset id', '\n',
'DATASET_NAME=', input[['DATASET_NAME']], '\n',
'# Query name and description', '\n',
'QUERY_NAME=', input[['QUERY_NAME']], '\n\n',
'# Dataset Dimensions', '\n\n',
'REPORTER=', input[['REPORTER']], '\n',
'PARTNER=', input[['PARTNER']], '\n',
'PRODUCT=', input[['PRODUCT']], '\n',
'FLOW=', input[['FLOW']], '\n',
ifelse(TYPE %in% c('HS', 'CN'), paste0('STAT_REGIME=', input[['TYPE']], '\n'), ''),
'PERIOD=', input[['PERIOD']], '\n',
'INDICATORS=', input[['INDICATORS']], '\n\n',
'# The dimensions to be displayed as Lines', '\n',
'IN_LINES=', input[['IN_LINES']], '\n',
'# The dimensions to be displayed as Columns', '\n',
'IN_COLUMNS=', input[['IN_COLUMNS']], '\n\n',
'# -----------------------', '\n',
'# Optional Parameters', '\n',
'# -----------------------', '\n\n',
'# Include/Eliminate zeroes in results [ON|OFF]. Default is OFF', '\n',
'# Specify output format [BAR, COLUMN, CSV, DMP, DSPL, EXCEL, GESMES, Generate table, HTML, HTML_TOC, LINE, MAP, PC_AXIS, PDF, PIE, RTF2, SDMX, SSS, TCSV, TFIX, TSV, XTTable]', '\n',
'OUTPUT_FORMAT=', input[['OUTPUT_FORMAT']], '\n',
'# Activate/Deactivate batch mode [ON|OFF]. Default is OFF', '\n',
'BATCH=', input[['BATCH']], '\n',
'# Specify batch output format [CSV, DMP, DSPL, EXCEL, GESMES, Generate table, HTML, HTML_TOC, PC_AXIS, PDF, RTF2, SDMX, SSS, TCSV, TFIX, TSV, XTTable]', '\n',
'BATCH_OUTPUT_FORMAT=', input[['BATCH_OUTPUT_FORMAT']], '\n',
'# Batch output codes, labels or both: [L|C|B]. Default is B', '\n',
'BATCH_OUTPUT_LABELS_TYPE=', input[['BATCH_OUTPUT_LABELS_TYPE']], '\n',
'# Activate/Deactivate dataset updated notification [ON|OFF]. Default is OFF', '\n',
'NOTIFY_ON_UPDATE=OFF', '\n'
)

# Creates file "comext-query_DATE_TIME.txt" in todays folder
writeLines(query_text, con=paste0('comext-query_', format(Sys.time(), "%Y-%m-%d_%H-%M"), '.txt'))