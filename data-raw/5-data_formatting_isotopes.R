####################################
##  CAPES ISOTOPES DATA FORMATTING
####################################



# Loadings ----------------------------------------------------------------

## Load packages

library(chopin.data)
library(tidyverse)
library(readxl)



## Load benthos data

benthos_isotopes_CAPES <- read_excel("inst/extdata/CHOPIN_general_DB.xlsx",
                            sheet = "isotopes_benth_CAPES") |>
  mutate(source = "CAPES") |>
  mutate(species = case_when(
    species %in% c("Nepthys",
                   "Nephtys_assimilis",
                   "Nephtys_caeca",
                   "Nephtys_cirrosa",
                   "Nephtys_hombergii") ~ "Nepthys_sp",
    TRUE ~ species
  )) |>
  left_join(benthos_info)

benthos_isotopes_CHOPIN <- benthos_contam |>
  filter(is.na(delta13C) == FALSE) |>
  select("season", "zone", "species",
         "labels", "taxa", "feeding_mode", "mobility",
         "sample_TAG", "lip_dw_percent", "delta13C", "delta15N") |>
  mutate(source = "CHOPIN")


## Load fish data

soles_isotopes_CAPES <- read_excel("inst/extdata/CHOPIN_general_DB.xlsx",
                                     sheet = "isotopes_fish_CAPES") |>
  mutate(source = "CAPES") |>
  left_join(soles_info)

soles_isotopes_CHOPIN <- soles_contam |>
  filter(is.na(delta13C) == FALSE) |>
  select("season", "zone", "species", "class", "length_TL_cm",
         "labels", "taxa", "feeding_mode", "mobility",
         "sample_TAG", "lip_dw_percent", "delta13C", "delta15N") |>
  mutate(source = "CHOPIN")


# Join different source project benthos datasets --------------------------

isotopes <- benthos_isotopes_CAPES |>
  full_join(benthos_isotopes_CHOPIN) |>
  full_join(soles_isotopes_CAPES) |>
  full_join(soles_isotopes_CHOPIN) |>
  mutate(species = as.factor(species))



# Save complete datasets --------------------------------------------------

write_csv(x = isotopes, file = "inst/isotopes.csv")



# Output data -------------------------------------------------------------

usethis::use_data(isotopes, overwrite = TRUE)
