####################################
##      LIST OF CONTAMINANTS
####################################


# Loadings

## Load packages

library(readxl)
library(tidyverse)

## Load data

contam_info <- read_excel("inst/extdata/CHOPIN_general_DB.xlsx",
                    sheet = "INFO_contam")

# Labels in data

PCB <- wrangle_contam(grp_contam = "PCB", grp_type = "family", out_var = "chemical")
HBCDD <- wrangle_contam(grp_contam = "HBCDD", grp_type = "family", out_var = "chemical")
PFAS_ALL <- wrangle_contam(grp_contam = "PFAS", grp_type = "family", out_var = "chemical")
sub_family_ALL <- wrangle_contam(grp_contam = "PFAS", grp_type = "family", out_var = "sub_family")
PFCAs <- wrangle_contam(grp_contam = "PFCAs", grp_type = "sub_family", out_var = "chemical")
PFSAs <- wrangle_contam(grp_contam = "PFSAs", grp_type = "sub_family", out_var = "chemical")
FOSAs <- wrangle_contam(grp_contam = "FOSAs", grp_type = "sub_family", out_var = "chemical")
FOSAAs <- wrangle_contam(grp_contam = "FOSAAs", grp_type = "sub_family", out_var = "chemical")
FOSAs_ALL <- append(FOSAs, FOSAAs)
FTSAs <- wrangle_contam(grp_contam = "FTSAs", grp_type = "sub_family", out_var = "chemical")
diPAP <- wrangle_contam(grp_contam = "di.PAPs", grp_type = "sub_family", out_var = "chemical")
other_PFAS <- wrangle_contam(grp_contam = "other", grp_type = "sub_family", out_var = "chemical")


# Labels for graphics

PCB_lab <- wrangle_contam(grp_contam = "PCB", grp_type = "family", out_var = "chem_label")
HBCDD_lab <- wrangle_contam(grp_contam = "HBCDD", grp_type = "family", out_var = "chem_label")
PFAS_ALL_lab <- wrangle_contam(grp_contam = "PFAS", grp_type = "family", out_var = "chem_label")
PFCAs_lab <- wrangle_contam(grp_contam = "PFCAs", grp_type = "sub_family", out_var = "chem_label")
PFSAs_lab <- wrangle_contam(grp_contam = "PFSAs", grp_type = "sub_family", out_var = "chem_label")
FOSAs_lab <- wrangle_contam(grp_contam = "FOSAs", grp_type = "sub_family", out_var = "chem_label")
FOSAAs_lab <- wrangle_contam(grp_contam = "FOSAAs", grp_type = "sub_family", out_var = "chem_label")
FOSAs_ALL_lab <- append(FOSAs_lab, FOSAAs_lab)
FTSAs_lab <- wrangle_contam(grp_contam = "FTSAs", grp_type = "sub_family", out_var = "chem_label")
diPAP_lab <- wrangle_contam(grp_contam = "di.PAPs", grp_type = "sub_family", out_var = "chem_label")
other_PFAS_lab <- wrangle_contam(grp_contam = "other", grp_type = "sub_family", out_var = "chem_label")


# Chemical characteristics

## Number of carbon atoms within PFASs
n_carbon_ALL <- wrangle_contam(grp_contam = "PFAS", grp_type = "family", out_var = "n_carbon")

## LogKow within PCBs
log_Kow <- wrangle_contam(grp_contam = "PCB", grp_type = "family", out_var = "logKow")


#-----------------------------------------------------------
# Suppress chemicals that were not measured in biota

PFAS <- PFAS_ALL[-which(PFAS_ALL == "MeFOSA" | PFAS_ALL == "EtFOSA")]
PFAS_lab <- PFAS_ALL_lab[-which(PFAS_ALL == "MeFOSA" |
                                 PFAS_ALL == "EtFOSA")]
sub_family <- sub_family_ALL[-which(PFAS_ALL == "MeFOSA" |
                                     PFAS_ALL == "EtFOSA")]
n_carbon <- n_carbon_ALL[-which(PFAS_ALL == "MeFOSA" | PFAS_ALL == "EtFOSA")]

FOSAs <- FOSAs_ALL[-which(FOSAs_ALL == "MeFOSA" | FOSAs_ALL == "EtFOSA")]
FOSAs_lab <- FOSAs_ALL_lab[-which(FOSAs_ALL_lab == "MeFOSA" |
                                   FOSAs_ALL_lab == "EtFOSA")]


#-----------------------------------------------------------
# Output data

usethis::use_data(contam_info,
                  PCB,
                  HBCDD,
                  PFAS_ALL,
                  PFAS,
                  sub_family_ALL,
                  sub_family,
                  PFCAs,
                  PFSAs,
                  FOSAs,
                  FOSAAs,
                  FOSAs_ALL,
                  FTSAs,
                  diPAP,
                  other_PFAS,
                  overwrite = TRUE)

# usethis::use_data(PCB_lab,
#                   HBCDD_lab,
#                   PFAS_ALL_lab,
#                   PFAS_lab,
#                   PFCAs_lab,
#                   PFSAs_lab,
#                   FOSAs_lab,
#                   FOSAAs_lab,
#                   FOSAs_ALL_lab,
#                   FTSAs_lab,
#                   diPAP_lab,
#                   other_PFAS_lab,
#                   overwrite = TRUE)
