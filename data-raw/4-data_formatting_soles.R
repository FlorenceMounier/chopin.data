####################################
##      SOLES DATA FORMATTING
####################################



# Loadings ----------------------------------------------------------------

## Load packages

library(chopin.data)
library(tidyverse)
library(readxl)


## Load data G0 G1

soles_contam_G0_G1 <- read_excel("inst/extdata/CHOPIN_general_DB.xlsx",
                           sheet = "soles")
soles_contam_G0_G1$sample_type <- as.factor(soles_contam_G0_G1$sample_type)


## Load data G2 organotropism

soles_contam_G2 <- read_excel("inst/extdata/CHOPIN_general_DB.xlsx",
                                  sheet = "soles_G2_organotr")
soles_contam_G2$sample_type <- as.factor(soles_contam_G2$sample_type)
soles_contam_G2 <- soles_contam_G2 |> left_join(soles_contam_G0_G1)

## Join datasets

soles_contam <- full_join(soles_contam_G0_G1, soles_contam_G2)



# Species characteristics -------------------------------------------------

soles_contam <- soles_contam |>
  mutate(
    labels = "Solea s.",
    taxa = "Fish",
    alimentation = "Omnivore",
    mobility = "Mobile")



# Convert HBCDD concentrations from pg/gdw to ng/gdw ----------------------

soles_contam$a.HBCDD_ng_gdw = soles_contam$a.HBCDD_pg_gdw/1000
soles_contam$b.HBCDD_ng_gdw = soles_contam$b.HBCDD_pg_gdw/1000
soles_contam$g.HBCDD_ng_gdw = soles_contam$g.HBCDD_pg_gdw/1000



# Replace <LOD/LOQ values to 0 for HBCDD isomers --------------------------

soles_contam$a.HBCDD_ng_gdw_censored <- soles_contam$a.HBCDD_ng_gdw
soles_contam$a.HBCDD_ng_gdw_censored[which(soles_contam$sample_TAG=="112018-G2-10")] <- 0

soles_contam$b.HBCDD_ng_gdw_censored <- soles_contam$b.HBCDD_ng_gdw
soles_contam$b.HBCDD_ng_gdw_censored[which(is.na(soles_contam$b.HBCDD_ng_gdw) == F &
                                        soles_contam$sample_TAG != "FN G0 juin 2017 pool2" &
                                        soles_contam$sample_TAG != "FS G0 juin 2017 pool2" &
                                        soles_contam$sample_TAG != "0617 Pool CH Soles G0" &
                                        soles_contam$sample_TAG != "092018-G1-10" &
                                        soles_contam$sample_TAG != "092018-G1-12")] <- 0

soles_contam$g.HBCDD_ng_gdw_censored <- soles_contam$g.HBCDD_ng_gdw
soles_contam$g.HBCDD_ng_gdw_censored[which(is.na(soles_contam$g.HBCDD_ng_gdw) == F &
                                        soles_contam$sample_TAG != "FN G0 juin 2017 pool2" &
                                        soles_contam$sample_TAG != "0617 Pool FS Soles G0" &
                                        soles_contam$sample_TAG != "FS G0 juin 2017 pool2" &
                                        soles_contam$sample_TAG != "0617 Pool CH Soles G0" &
                                        soles_contam$sample_TAG != "1017 FS G0 pool 3" &
                                        soles_contam$sample_TAG != "092018-G1-10" &
                                        soles_contam$sample_TAG != "092018-G1-12" &
                                        soles_contam$sample_TAG != "092018-G1-17")] <- 0



# Lipid-normalized concentrations for PCBs and HBCDD isomers --------------

soles_contam <- soles_contam |>

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




# Total dry mass ----------------------------------------------------------

soles_contam <- soles_contam |>
  mutate(mass_gdw = case_when(
    is.na(mass_tissue_gww) == TRUE ~ mass_tot_gww * dry_content_percent / 100,
    is.na(mass_tissue_gww) == FALSE ~ mass_tissue_gww * dry_content_percent / 100,
    TRUE ~ NA
  ))



# Calculation of hepatosomatic and gonadosomatic indices ------------------

soles_contam <- soles_contam |>
  mutate(SI = case_when(
    is.na(mass_tissue_gww) == FALSE ~ mass_tissue_gww / mass_tot_gww * 100,
    TRUE ~ NA
  ))



# Compute contaminant mass (ng) -------------------------------------------

for(c in 1:length(PCB)){
  soles_contam[,paste(PCB[c],"_ng",sep="")] <- soles_contam[,paste(PCB[c],"_ng_gdw",sep="")]*soles_contam$mass_gdw
}
for(c in 1:length(PFAS)){
  soles_contam[,paste(PFAS[c],"_ng",sep="")] <- soles_contam[,paste(PFAS[c],"_ng_gdw",sep="")]*soles_contam$mass_gdw
}
for(c in 1:length(HBCDD)){
  soles_contam[,paste(HBCDD[c],"_ng",sep="")] <- soles_contam[,paste(HBCDD[c],"_ng_gdw",sep="")]*soles_contam$mass_gdw
}
for(c in 1:length(HBCDD)){
  soles_contam[,paste(HBCDD[c],"_ng_censored",sep="")] <- soles_contam[,paste(HBCDD[c],"_ng_gdw_censored",sep="")]*soles_contam$mass_gdw
}



# Compute dry weight sum of concentrations ( ng_gdw ) ---------------------

soles_contam$sumPCB_ng_gdw <- apply(soles_contam[,paste(PCB,"_ng_gdw",
                                                            sep="")],
                                      MARGIN = 1, FUN = sum)
soles_contam$sumHBCDD_ng_gdw <- apply(soles_contam[,paste(HBCDD,
                                                          "_ng_gdw",
                                                          sep="")],
                                      MARGIN = 1, FUN = sum)
soles_contam$sumHBCDD_ng_gdw_censored <- apply(soles_contam[,paste(HBCDD,
                                                                   "_ng_gdw_censored",
                                                                   sep="")],
                                               MARGIN = 1, FUN = sum)
soles_contam$sumPFAS_ng_gdw <- apply(soles_contam[,paste(PFAS,"_ng_gdw",
                                                             sep="")],
                                       MARGIN = 1, FUN = sum)
soles_contam$sumPFCA_ng_gdw <- apply(soles_contam[,paste(PFCAs,"_ng_gdw",
                                                             sep="")],
                                       MARGIN = 1, FUN = sum)
soles_contam$sumFOSA_ng_gdw <- apply(soles_contam[,paste(FOSAs,"_ng_gdw",
                                                             sep="")],
                                       MARGIN = 1, FUN = sum)
soles_contam$sumPFSA_ng_gdw <- apply(soles_contam[,paste(PFSAs,"_ng_gdw",
                                                             sep="")],
                                       MARGIN = 1, FUN = sum)




# Compute dry weight concentration normalized by the sum of concen --------

soles_contam[, paste(PCB, "normalised_sum_ng_gdw", sep = "_")] <- soles_contam[, paste(PCB, "_ng_gdw", sep = "")] /
  soles_contam$sumPCB_ng_gdw

soles_contam[, paste(HBCDD, "normalised_sum_ng_gdw", sep = "_")] <- soles_contam[, paste(HBCDD, "_ng_gdw",
                                                                                         sep = "")] /
  soles_contam$sumHBCDD_ng_gdw

soles_contam[, paste(HBCDD, "normalised_sum_ng_gdw_censored", sep = "_")] <- soles_contam[, paste(HBCDD, "_ng_gdw_censored",
                                                                                                  sep = "")] /
  soles_contam$sumHBCDD_ng_gdw_censored

soles_contam[, paste(PFAS, "normalised_sum_ng_gdw", sep = "_")] <- soles_contam[, paste(PFAS, "_ng_gdw", sep = "")] /
  soles_contam$sumPFAS_ng_gdw



# Save complete dataset ---------------------------------------------------

write_csv(x = soles_contam, file = "inst/soles_contam.csv")



# Output data -------------------------------------------------------------

usethis::use_data(soles_contam,
                  overwrite = TRUE)
