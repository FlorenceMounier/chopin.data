####################################
##  CHOPIN SOLES BIOMARKERS
####################################


# Loadings ----------------------------------------------------------------

## Load packages

library(chopin.data)
library(tidyverse)
library(readxl)

## Load data

soles_biomarkers  <- read_excel("inst/extdata/CHOPIN_general_DB.xlsx", sheet = "soles_biomarkers")



# Output data -------------------------------------------------------------

usethis::use_data(
  soles_biomarkers,
  overwrite = TRUE
)
