####################################
##  CAPES STOMACH CONTENT DATA FORMATTING
####################################



# Loadings ----------------------------------------------------------------

## Load packages

library(chopin.data)
library(tidyverse)
library(readxl)
library(worrms)

## Load data

soles_stomach <- read_excel("inst/extdata/CHOPIN_general_DB.xlsx", sheet = "soles_stomach") |>
  filter(status == "prey", species != "Ponte_nd")



# Prepare scientific names ------------------------------------------------

prey_species <- soles_stomach |>
  distinct(species) |>
  mutate(
    name_worms = species |>
      gsub("_", " ", x = _) |>
      trimws(),
    name_worms = gsub(
      "\\s+spp?\\.?$",
      "",
      name_worms,
      ignore.case = TRUE
    )
  )


# Retrieve AphiaIDs -------------------------------------------------------

taxa_ids <- worrms::wm_name2id_(
  name = prey_species$name_worms
)



# Retrieve taxonomic classifications --------------------------------------

species_classification_list <- purrr::map(
  taxa_ids,
  \(id) {
    if (is.na(id)) return(NULL)

    worrms::wm_classification(id)
  }
)


# Convert classifications into a wide table -------------------------------

species_classif <- purrr::map2_dfr(
  species_classification_list,
  prey_species$species,
  \(tax, sp) {

    if (is.null(tax) || nrow(tax) == 0) {
      return(tibble(
        scientific_name = sp,
        rank = NA_character_,
        scientificname = NA_character_
      ))
    }

    tax |>
      as_tibble() |>
      transmute(
        scientific_name = sp,
        rank,
        scientificname
      )
  }
) |>
  filter(!is.na(rank)) |>
  distinct() |>
  pivot_wider(
    names_from = rank,
    values_from = scientificname
  ) |>
  right_join(
    prey_species |>
      transmute(scientific_name = species),
    by = "scientific_name"
  ) |>
  relocate(scientific_name)



# Output data -------------------------------------------------------------

usethis::use_data(soles_stomach, overwrite = TRUE)
usethis::use_data(species_classif, overwrite = TRUE)
