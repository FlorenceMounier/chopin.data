####################################
##     SEDIMENT DATA FORMATTING
####################################



# Loadings ----------------------------------------------------------------


## Load packages

library(chopin.data)
library(tidyverse)
library(readxl)

## Load data

sed_contam <- read_excel("inst/extdata/CHOPIN_general_DB.xlsx",
                       sheet = "sediment")



# PFASs selection for sediment analysis -----------------------------------

PFAS <- PFAS_ALL
PFAS_lab <- PFAS_ALL_lab
sub_family <- sub_family_ALL
FOSAs <- FOSAs_ALL
FOSAs_lab <- FOSAs_ALL_lab



# Rename factor values of the variable "season" ---------------------------

sed_contam <- sed_contam  |>
  mutate(season = as_factor(season)) |>
  mutate(season = fct_collapse(season,
                               "Spring" = c("june"),
                               "Autumn" = c("october")))



# Compute concentrations in ng.gCorg-1 ------------------------------------

sed_contam <- sed_contam |>
  convert_conc(
    contams = c(PCB, PFAS, HBCDD),
    source_unit = "_ng_gdw",
    target_unit = "_ng_gCorg",
    norm_var = "Corg_percent",
    operation = "divide"
  )



# Compute the sum of the concentrations per family ------------------------

#  * in ng_gCorg-1

sed_contam <- sum_by_family(contams = PCB, family = "PCB", data = sed_contam, unit = "ng_gCorg")
sed_contam <- sum_by_family(contams = PFAS, family = "PFAS", data = sed_contam, unit = "ng_gCorg")
sed_contam <- sum_by_family(contams = HBCDD, family = "HBCDD", data = sed_contam, unit = "ng_gCorg")


#  * in ng_gdw

sed_contam <- sum_by_family(contams = PCB, family = "PCB", data = sed_contam, unit = "ng_gdw")
sed_contam <- sum_by_family(contams = PFAS, family = "PFAS", data = sed_contam, unit = "ng_gdw")
sed_contam <- sum_by_family(contams = HBCDD, family = "HBCDD", data = sed_contam, unit = "ng_gdw")



# Compute normalised concentrations by the sum by family ( ng_gdw ) -------

# * in ng_gCorg

sed_contam <- normalised_conc(contams = PCB, family = "PCB", data = sed_contam, unit = "ng_gCorg")
sed_contam <- normalised_conc(contams = PFAS, family = "PFAS", data = sed_contam, unit = "ng_gCorg")
sed_contam <- normalised_conc(contams = HBCDD, family = "HBCDD", data = sed_contam, unit = "ng_gCorg")

# * in ng_gdw

sed_contam <- normalised_conc(contams = PCB, family = "PCB", data = sed_contam, unit = "ng_gdw")
sed_contam <- normalised_conc(contams = PFAS, family = "PFAS", data = sed_contam, unit = "ng_gdw")
sed_contam <- normalised_conc(contams = HBCDD, family = "HBCDD", data = sed_contam, unit = "ng_gdw")



# External data -----------------------------------------------------------

write_csv(x = sed_contam, file = "inst/sed_contam.csv")



# Output data -------------------------------------------------------------

usethis::use_data(sed_contam, overwrite = TRUE)
