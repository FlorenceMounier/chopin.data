####################################
##    BENTHOS DATA FORMATTING
####################################



# Loadings ----------------------------------------------------------------


## Load packages

library(chopin.data)
library(tidyverse)
library(readxl)


## Load data

benthos_contam <- read_excel("inst/extdata/CHOPIN_general_DB.xlsx",
                           sheet = "benthos")


benthos_contam$zone <- as.factor(benthos_contam$zone)
benthos_contam$species <- as.factor(benthos_contam$species)



# Replace <LOD/LOQ values to 0 for HBCDD isomers --------------------------

benthos_contam$a.HBCDD_ng_gdw_censored <- benthos_contam$a.HBCDD_ng_gdw
benthos_contam$a.HBCDD_ng_gdw_censored[which(benthos_contam$sample_TAG=="CP14"|
                                                 benthos_contam$sample_TAG=="CP06"|
                                                 benthos_contam$sample_TAG=="CP52"|
                                                 benthos_contam$sample_TAG=="CP53")] <- 0

benthos_contam$b.HBCDD_ng_gdw_censored <- benthos_contam$b.HBCDD_ng_gdw
benthos_contam$b.HBCDD_ng_gdw_censored[which(benthos_contam$sample_TAG=="CP12"|
                                                 benthos_contam$sample_TAG=="CP14"|
                                                 benthos_contam$sample_TAG=="CP06"|
                                                 benthos_contam$sample_TAG=="CP52"|
                                                 benthos_contam$sample_TAG=="CP41"|
                                                 benthos_contam$sample_TAG=="CP44"|
                                                 benthos_contam$sample_TAG=="T2 FN8 crevettes"|
                                                 benthos_contam$sample_TAG=="CP43"|
                                                 benthos_contam$sample_TAG=="CP53")] <- 0

benthos_contam$g.HBCDD_ng_gdw_censored <- benthos_contam$g.HBCDD_ng_gdw
benthos_contam$g.HBCDD_ng_gdw_censored[benthos_contam$sample_TAG=="CP14"|
                                           benthos_contam$sample_TAG=="CP06"|
                                           benthos_contam$sample_TAG=="CP52"|
                                           benthos_contam$sample_TAG=="CP41"|
                                           benthos_contam$sample_TAG=="CP44"|
                                           benthos_contam$sample_TAG=="T2 FN8 crevettes"|
                                           benthos_contam$sample_TAG=="CP53"] <- 0



# Rename season variable values (june=>Spring, october=> Autumn) ----------

benthos_contam$season <- factor(benthos_contam$season,
                                labels = c("Spring","Autumn"))



# Create taxa variable (grp) and labels and change names in dataset -------

benthos_info <- tribble(
  ~species, ~labels, ~taxa, ~alimentation, ~mobility,
  "Abra_alba", "Abra a.", "Bivalves", "Susp.Dep.sur.", "Low mobility",
  "Cerastoderma_edule", "Cerastoderma e.", "Bivalves" , "Susp.Dep.sur.", "Low mobility",
  "Limecola_balthica", "Limecola b.", "Bivalves", "Susp.Dep.sur.", "Low mobility",
  "Scrobicularia_plana", "Scrobicularia p.", "Bivalves", "Susp.Dep.sur.", "Low mobility",
  "Corophium_volutator",  "Corophium v.", "Crustaceans", "Susp.Dep.sur.", "Low mobility",
  "Lanice_conchilega", "Lanice c.", "Polychaetes", "Susp.Dep.sur.", "Sedentary",
  "Owenia_fusiformis" , "Owenia f.", "Polychaetes", "Susp.Dep.sur.", "Sedentary",
  "Corbula_gibba", "Corbula g.", "Bivalves", "Susp.", "Sedentary",
  "Donax_vittatus", "Donax v.", "Bivalves", "Susp.", "Mobile",
  "Ensis_directus", "Ensis d.", "Bivalves", "Susp.", "Mobile",
  "Spisula_subtruncata", "Spisula s.", "Bivalves", "Susp.", "Mobile",
  "Nucula_nitidosa", "Nucula n.", "Bivalves", "Dep.sur.", "Mobile",
  "Lagis_koreni", "Lagis k.", "Polychaetes", "Dep.sub.", "Sedentary",
  "Nephtys_sp", "Nephtys sp.", "Polychaetes", "Omnivore", "Errant",
  "Hediste_diversicolor", "Hediste d.", "Polychaetes", "Omnivore", "Errant",
  "Crangon_crangon", "Crangon c.", "Crustaceans", "Omnivore", "Mobile"
)

benthos_contam <- left_join(benthos_contam, benthos_info)



# Lipid-normalized concentrations for PCBs and HBCDD isomers --------------

benthos_contam <- benthos_contam |>

  chopin.data::convert_conc(
    contams = PCB,
    source_unit = "_ng_gdw",
    target_unit = "_ng_glw",
    norm_var = "lip_dw_percent",
    operation = "divide"
  ) |>

  chopin.data::convert_conc(
    contams = HBCDD,
    source_unit = "_ng_gdw_censored",
    target_unit = "_ng_glw",
    norm_var = "lip_dw_percent",
    operation = "divide"
  )



# Compute dry weight sum of concentrations ( ng_gdw ) ---------------------

benthos_contam$sumPCB_ng_gdw <- apply(benthos_contam[,paste(PCB,"_ng_gdw",
                                                            sep="")],
                                      MARGIN = 1, FUN = sum)
benthos_contam$sumPFAS_ng_gdw <- apply(benthos_contam[,paste(PFAS,"_ng_gdw",
                                                             sep="")],
                                       MARGIN = 1, FUN = sum)
benthos_contam$sumPFCA_ng_gdw <- apply(benthos_contam[,paste(PFCAs,"_ng_gdw",
                                                             sep="")],
                                       MARGIN = 1, FUN = sum)
benthos_contam$sumFOSA_ng_gdw <- apply(benthos_contam[,paste(FOSAs,"_ng_gdw",
                                                             sep="")],
                                       MARGIN = 1, FUN = sum)
benthos_contam$sumPFSA_ng_gdw <- apply(benthos_contam[,paste(PFSAs,"_ng_gdw",
                                                             sep="")],
                                       MARGIN = 1, FUN = sum)
benthos_contam$sumHBCDD_ng_gdw <- apply(benthos_contam[,paste(HBCDD,
                                                              "_ng_gdw_censored",
                                                              sep="")],
                                        MARGIN = 1, FUN = sum)



# Compute dry weight concentration normalized by the sum of concen --------

benthos_contam[, paste(PCB, "normalised_sum_ng_gdw", sep = "_")] <- benthos_contam[, paste(PCB, "_ng_gdw", sep = "")] /
  benthos_contam$sumPCB_ng_gdw

benthos_contam[, paste(PFAS, "normalised_sum_ng_gdw", sep = "_")] <- benthos_contam[, paste(PFAS, "_ng_gdw", sep = "")] /
  benthos_contam$sumPFAS_ng_gdw

benthos_contam[, paste(HBCDD, "normalised_sum_ng_gdw", sep = "_")] <- benthos_contam[, paste(HBCDD, "_ng_gdw_censored",
                                                                                            sep = "")] /
  benthos_contam$sumHBCDD_ng_gdw


# Save complete dataset ---------------------------------------------------

write_csv(x = benthos_contam, file = "inst/benthos_contam.csv")



# Output data -------------------------------------------------------------

usethis::use_data(benthos_contam,
                  overwrite = TRUE)
