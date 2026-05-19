setwd("c:/projects/Building Machine Learning Models/harvard-ph125-lab")
# ensure a user-writable library exists and use it to avoid admin installs
user_lib <- "C:/Users/kirut2/Documents/R/win-library/4.6"
dir.create(user_lib, recursive = TRUE, showWarnings = FALSE)
.libPaths(c(user_lib, .libPaths()))
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv", repos = "https://cran.rstudio.com/")
}
# Call renv::init() without the prompt argument for compatibility
renv::init()
renv::snapshot()
