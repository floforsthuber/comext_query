# Install regular R packages when missing
packages <- c("tidyverse", "countrycode", "stringr")

if ( length(missing_pkgs <- setdiff(packages, rownames(installed.packages()))) > 0) {
  message("Installing missing package(s): ", paste(missing_pkgs, collapse = ", "))
  install.packages(missing_pkgs)
}

for (x in packages){
  lib_errors <- tryCatch(library(x, character.only = T),
   error = function(e) { cat('In error handler\n'); print(e); e })
}