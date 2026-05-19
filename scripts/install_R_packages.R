# Install essential R packages and snapshot with renv
packages <- c(
  "tidyverse",
  "ggplot2",
  "dplyr",
  "tidyr",
  "readr",
  "caret",
  "data.table",
  "janitor",
  "lubridate",
  "stringr",
  "plotly",
  "rmarkdown",
  "knitr",
  "quarto"
)

if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")
renv::restore(prompt = FALSE)
install.packages(setdiff(packages, installed.packages()[,"Package"]))
renv::snapshot(prompt = FALSE)
