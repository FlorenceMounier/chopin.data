
# 0-color_palettes.R ------------------------------------------------------

#' Color palette for PFAS in sediments
#'
#' Character vector containing the colors used to represent
#' the different PFAS compounds in figures related to sediments.
#'
#' @format A character vector.
#'
#' @examples
#' PALETTE_PFAS_sed
"PALETTE_PFAS_sed"

#' Color palette for PFAS in benthic macro-invertebrates
#'
#' Character vector containing the colors used to represent
#' the different PFAS compounds in figures related to benthos.
#'
#' @format A character vector.
#'
#' @examples
#' PALETTE_PFAS_benthos
"PALETTE_PFAS_benthos"

#' Color palette for PFAS in benthic macro-invertebrates
#'
#' Character vector containing the colors used to represent
#' the different PFAS compounds in figures related to benthos.
#'
#' @format A character vector.
#'
#' @examples
#' PALETTE_PFAS_benthos
"PALETTE_PFAS_benthos"

#' Color palette for PFAS in juvenile soles
#'
#' Character vector containing the colors used to represent
#' the different PFAS compounds in figures related to soles.
#'
#' @format A character vector.
#'
#' @examples
#' PALETTE_PFAS_soles
"PALETTE_PFAS_soles"

# 1-data_formatting_contaminants.R ----------------------------------------

#' Contaminant characteristics and analytical limits
#'
#' A reference table describing the contaminants analysed in the CHOPIN project.
#' The dataset contains chemical identifiers, contaminant families and
#' sub-families, selected physicochemical properties, carbon-chain length,
#' and analytical detection and quantification limits for sediment and biota
#' samples.
#'
#' @format A tibble with 53 rows and 11 variables:
#' \describe{
#'   \item{chemical}{
#'     Character. Internal chemical identifier used in datasets and analysis
#'     scripts.
#'   }
#'   \item{chem_label}{
#'     Character. Display label used for figures and tables.
#'   }
#'   \item{family}{
#'     Character. Main contaminant family: \code{"PFAS"}, \code{"PCB"}, or
#'     \code{"HBCDD"}.
#'   }
#'   \item{sub_family}{
#'     Character. Chemical sub-family, mainly defined for PFAS compounds
#'     (e.g. \code{"PFCAs"}, \code{"PFSAs"}, \code{"FOSAs"},
#'     \code{"FOSAAs"}, \code{"FTSAs"}, \code{"di.PAPs"}).
#'     Missing for PCB and HBCDD compounds.
#'   }
#'   \item{sub_family_name}{
#'     Character. Full name of the chemical sub-family. Mainly available
#'     for PFAS compounds.
#'   }
#'   \item{logKow}{
#'     Numeric. Octanol-water partition coefficient expressed as
#'     \eqn{\log_{10}(K_{ow})}. Available for PCB congeners in the current
#'     dataset.
#'   }
#'   \item{n_carbon}{
#'     Numeric. Number of carbon atoms in the perfluorinated carbon chain.
#'     Available for selected PFAS compounds.
#'   }
#'   \item{linearity_domain_sediment}{
#'     Character. Analytical calibration linearity range used for sediment
#'     samples. Available for PCB congeners.
#'   }
#'   \item{LOD_sediment}{
#'     Numeric. Limit of detection for sediment samples.
#'   }
#'   \item{LOQ_sediment}{
#'     Numeric. Limit of quantification for sediment samples.
#'   }
#'   \item{LOQ_biote}{
#'     Numeric. Limit of quantification for biota samples.
#'   }
#' }
#'
#' @details
#' Missing values indicate that the corresponding information was not
#' available, not applicable to the contaminant family, or not included
#' in the analytical dataset.
#'
#' @source
#' CHOPIN project analytical dataset.
#'
#' @keywords datasets
#'
#' @name contam_info
NULL

#' PCB compounds analysed in all samples
#'
#' Character vector containing the internal identifiers of the
#' polychlorinated biphenyl (PCB) congeners analysed in all samples.
#'
#' The values are extracted from \code{contam_info$chemical}.
#'
#' @format A character vector.
#' @seealso \code{\link{contam_info}}
#' @keywords datasets
#' @name PCB
NULL

#' HBCDD compounds analysed in all samples
#'
#' Character vector containing the internal identifiers of the
#' hexabromocyclododecane (HBCDD) isomers analysed in all samples.
#'
#' The values are extracted from \code{contam_info$chemical}.
#'
#' @format A character vector.
#' @seealso \code{\link{contam_info}}
#' @keywords datasets
#' @name HBCDD
NULL

#' All PFAS compounds analysed in the CHOPIN project
#'
#' Character vector containing the internal identifiers of all
#' per- and polyfluoroalkyl substances (PFAS) analysed in the CHOPIN project
#' across sediment and biota samples.
#'
#' The \code{_ALL} suffix indicates that the vector includes the complete set
#' of compounds analysed across both matrices. This set therefore overlaps
#' substantially with \code{PFAS}, which contains the compounds analysed in
#' biota samples.
#'
#' @format A character vector.
#' @seealso \code{\link{PFAS}},
#'   \code{\link{contam_info}}
#' @keywords datasets
#' @name PFAS_ALL
NULL

#' PFAS compounds analysed in all samples
#'
#' Character vector containing the internal identifiers of the
#' per- and polyfluoroalkyl substances (PFAS) analysed in all samples.
#'
#' This vector is a matrix-specific subset of the compounds represented in
#' \code{PFAS_ALL}.
#'
#' @format A character vector.
#' @seealso \code{\link{PFAS_ALL}},
#'   \code{\link{contam_info}}
#' @keywords datasets
#' @name PFAS
NULL


#' PFAS subfamilies represented across all analysed compounds
#'
#' Character vector containing the PFAS subfamily assignments for all PFAS
#' analysed in the CHOPIN project across sediment and biota samples.
#'
#' The \code{_ALL} suffix indicates that the vector covers the complete set
#' of compounds analysed across both matrices.
#'
#' @format A character vector.
#' @seealso \code{\link{sub_family}}, \code{\link{contam_info}}
#' @keywords datasets
#' @name sub_family_ALL
NULL


#' PFAS subfamilies represented in biota samples
#'
#' Character vector containing the PFAS subfamily assignments for compounds
#' analysed in biota samples.
#'
#' @format A character vector.
#' @seealso \code{\link{sub_family_ALL}}, \code{\link{contam_info}}
#' @keywords datasets
#' @name sub_family
NULL


#' Perfluoroalkyl carboxylic acids analysed in all samples
#'
#' Character vector containing the internal identifiers of
#' perfluoroalkyl carboxylic acids (PFCAs) analysed in all samples.
#'
#' @format A character vector.
#' @seealso \code{\link{PFAS}}, \code{\link{contam_info}}
#' @keywords datasets
#' @name PFCAs
NULL


#' Perfluoroalkyl sulfonates analysed in all samples
#'
#' Character vector containing the internal identifiers of
#' perfluoroalkyl sulfonates (PFSAs) analysed in all samples.
#'
#' @format A character vector.
#' @seealso \code{\link{PFAS}}, \code{\link{contam_info}}
#' @keywords datasets
#' @name PFSAs
NULL


#' Perfluorooctanesulfonamides analysed in all samples
#'
#' Character vector containing the internal identifiers of
#' perfluorooctanesulfonamides (FOSAs) analysed in all samples.
#'
#' @format A character vector.
#' @seealso \code{\link{FOSAs_ALL}}, \code{\link{PFAS}},
#'   \code{\link{contam_info}}
#' @keywords datasets
#' @name FOSAs
NULL


#' Perfluorooctanesulfonamidoacetic acids analysed in all samples
#'
#' Character vector containing the internal identifiers of
#' perfluorooctanesulfonamidoacetic acids (FOSAAs) analysed in all samples.
#'
#' @format A character vector.
#' @seealso \code{\link{PFAS}}, \code{\link{contam_info}}
#' @keywords datasets
#' @name FOSAAs
NULL


#' All perfluorooctanesulfonamides analysed in the CHOPIN project
#'
#' Character vector containing the internal identifiers of all
#' perfluorooctanesulfonamides (FOSAs) analysed across sediment and biota
#' samples in the CHOPIN project.
#'
#' The \code{_ALL} suffix indicates that the vector contains the complete set
#' analysed across both matrices.
#'
#' @format A character vector.
#' @seealso \code{\link{FOSAs}},
#'   \code{\link{contam_info}}
#' @keywords datasets
#' @name FOSAs_ALL
NULL


#' Fluorotelomer sulfonates analysed in biota
#'
#' Character vector containing the internal identifiers of
#' fluorotelomer sulfonates (FTSAs) analysed in biota samples.
#'
#' @format A character vector.
#' @seealso \code{\link{PFAS}}, \code{\link{contam_info}}
#' @keywords datasets
#' @name FTSAs
NULL


#' Di-substituted polyfluorinated phosphate esters analysed in all samples
#'
#' Character vector containing the internal identifiers of
#' di-substituted polyfluorinated phosphate esters (diPAPs) analysed in
#' all samples.
#'
#' @format A character vector.
#' @seealso \code{\link{PFAS}}, \code{\link{contam_info}}
#' @keywords datasets
#' @name diPAP
NULL


#' Other PFAS compounds analysed in all samples
#'
#' Character vector containing the internal identifiers of PFAS compounds
#' classified outside the main PFAS subfamilies and analysed in all samples.
#'
#' @format A character vector.
#' @seealso \code{\link{PFAS}}, \code{\link{contam_info}}
#' @keywords datasets
#' @name other_PFAS
NULL



# 2-data_formatting_sediment ----------------------------------------------

#' Sediment characteristics and contaminant concentrations
#'
#' Sediment samples collected during the CHOPIN project, including sampling
#' information, sediment physicochemical characteristics, grain-size
#' distribution, and concentrations of PCBs, PFASs, and HBCDD isomers.
#'
#' Contaminant concentrations are provided both on a dry-weight basis and
#' normalized to sediment organic carbon content. The dataset also contains
#' summed concentrations by contaminant family and the relative contribution
#' of individual compounds to their corresponding family sum.
#'
#' @format A tibble with 24 rows and 247 variables. Each row represents one
#' sediment sample. Variables include:
#' \describe{
#'
#'   \item{year}{
#'     Numeric. Sampling year.
#'   }
#'
#'   \item{season}{
#'     Factor. Sampling season, with levels \code{"Spring"} and
#'     \code{"Autumn"}.
#'   }
#'
#'   \item{zone}{
#'     Character. Sampling area within the Seine estuary:
#'     \code{"Embouchure"}, \code{"Fosse Nord"}, or \code{"Fosse Sud"}.
#'   }
#'
#'   \item{type}{
#'     Character. Sample type. All observations in this dataset correspond
#'     to \code{"sediment"} samples.
#'   }
#'
#'   \item{site}{
#'     Character. Sampling-site identifier.
#'   }
#'
#'   \item{sample_TAG}{
#'     Character. Unique sample identifier used in the CHOPIN project.
#'   }
#'
#'   \item{lat}{
#'     Character. Latitude of the sampling location, recorded in degrees
#'     and decimal minutes.
#'   }
#'
#'   \item{lon}{
#'     Character. Longitude of the sampling location, recorded in degrees
#'     and decimal minutes.
#'   }
#'
#'   \item{date}{
#'     POSIXct. Sampling date in UTC.
#'   }
#'
#'   \item{hour}{
#'     Character. Sampling-time information as recorded in the original
#'     dataset.
#'   }
#'
#'   \item{Corg_percent}{
#'     Numeric. Organic carbon content of the sediment, expressed as a
#'     percentage of sediment dry weight.
#'   }
#'
#'   \item{N_percent}{
#'     Numeric. Nitrogen content of the sediment, expressed as a percentage
#'     of sediment dry weight.
#'   }
#'
#'   \item{Corg_ng_g}{
#'     Numeric. Organic carbon content expressed on a sediment-mass basis.
#'     See Details regarding the unit encoded in the variable name.
#'   }
#'
#'   \item{Norg_mg_g}{
#'     Numeric. Organic nitrogen content, expressed in mg per g of sediment.
#'   }
#'
#'   \item{Corg_mol}{
#'     Numeric. Organic carbon content expressed on a molar basis.
#'   }
#'
#'   \item{Norg_mol}{
#'     Numeric. Organic nitrogen content expressed on a molar basis.
#'   }
#'
#'   \item{C_over_N_mol}{
#'     Numeric. Molar carbon-to-nitrogen ratio of sediment organic matter.
#'   }
#'
#'   \item{0-63}{
#'     Numeric. Percentage of sediment particles in the 0--63 micrometre
#'     grain-size fraction.
#'   }
#'
#'   \item{63_125}{
#'     Numeric. Percentage of sediment particles in the 63--125 micrometre
#'     grain-size fraction.
#'   }
#'
#'   \item{125_250}{
#'     Numeric. Percentage of sediment particles in the 125--250 micrometre
#'     grain-size fraction.
#'   }
#'
#'   \item{250_500}{
#'     Numeric. Percentage of sediment particles in the 250--500 micrometre
#'     grain-size fraction.
#'   }
#'
#'   \item{500_750}{
#'     Numeric. Percentage of sediment particles in the 500--750 micrometre
#'     grain-size fraction.
#'   }
#'
#'   \item{750_1000}{
#'     Numeric. Percentage of sediment particles in the 750--1000 micrometre
#'     grain-size fraction.
#'   }
#'
#'   \item{1000_2000}{
#'     Numeric. Percentage of sediment particles in the 1000--2000 micrometre
#'     grain-size fraction.
#'   }
#'
#'   \item{loss_of_ignition_percent}{
#'     Numeric. Sediment loss on ignition, expressed as a percentage.
#'   }
#'
#'   \item{Ctot_mg_g}{
#'     Numeric. Total carbon concentration, expressed in mg per g of
#'     sediment.
#'   }
#'
#'   \item{Cmineral_mg_g}{
#'     Numeric. Mineral carbon concentration, expressed in mg per g of
#'     sediment.
#'   }
#'
#'   \item{porosity_percent}{
#'     Numeric. Sediment porosity, expressed as a percentage.
#'   }
#'
#'   \item{water_percent}{
#'     Numeric. Sediment water content, expressed as a percentage.
#'   }
#'
#'   \item{<chemical>_ng_gdw}{
#'     Numeric. Concentration of an individual PCB congener, PFAS compound,
#'     or HBCDD isomer, expressed in ng per g sediment dry weight
#'     (ng g^-1 dw). Chemical identifiers correspond to those defined in
#'     \code{contam_info}.
#'   }
#'
#'   \item{<chemical>_ng_gCorg}{
#'     Numeric. Concentration of an individual PCB congener, PFAS compound,
#'     or HBCDD isomer normalized to sediment organic carbon content,
#'     expressed in ng per g organic carbon.
#'   }
#'
#'   \item{sum_PCB_ng_gdw, sum_PFAS_ng_gdw, sum_HBCDD_ng_gdw}{
#'     Numeric. Sum of the concentrations of the compounds included in each
#'     contaminant family, expressed in ng per g sediment dry weight.
#'   }
#'
#'   \item{sum_PCB_ng_gCorg, sum_PFAS_ng_gCorg, sum_HBCDD_ng_gCorg}{
#'     Numeric. Sum of the concentrations of the compounds included in each
#'     contaminant family after normalization to sediment organic carbon,
#'     expressed in ng per g organic carbon.
#'   }
#'
#'   \item{<chemical>_normalised_sum_ng_gdw}{
#'     Numeric. Relative contribution of an individual compound to the summed
#'     concentration of its contaminant family, calculated from dry-weight
#'     concentrations. Values are proportions and are therefore
#'     dimensionless despite the historical variable suffix.
#'   }
#'
#'   \item{<chemical>_normalised_sum_ng_gCorg}{
#'     Numeric. Relative contribution of an individual compound to the summed
#'     concentration of its contaminant family after organic-carbon
#'     normalization. Values are proportions and are therefore dimensionless
#'     despite the historical variable suffix.
#'   }
#' }
#'
#' @details
#' Individual contaminant variables include PCB congeners, PFAS compounds,
#' and the alpha-, beta-, and gamma-HBCDD isomers. Chemical identifiers and
#' their associated families and display labels are provided in
#' \code{\link{contam_info}}.
#'
#' Concentrations ending in \code{_ng_gdw} are expressed relative to sediment
#' dry weight, whereas variables ending in \code{_ng_gCorg} are normalized
#' to sediment organic carbon.
#'
#' Variables containing \code{normalised_sum} represent the relative
#' contribution of each individual compound to the total concentration of
#' its contaminant family rather than contaminant concentrations themselves.
#'
#' Zero values in contaminant variables are retained as provided in the
#' analytical dataset and should not automatically be interpreted as true
#' absence without considering the analytical detection and quantification
#' limits provided in \code{\link{contam_info}}.
#'
#' @source
#' CHOPIN project sediment sampling and analytical dataset.
#'
#' @seealso
#' \code{\link{contam_info}}
#'
#' @keywords datasets
#'
#' @name sed_contam
NULL



# 3-data_formatting_benthos -----------------------------------------------

#' Contaminant concentrations in benthic macrofauna
#'
#' Benthic macrofauna samples collected during the CHOPIN project in the
#' Seine estuary. The dataset contains sampling information, taxonomic and
#' trophic traits, lipid and dry-mass contents, stable isotope measurements,
#' and concentrations of PCBs, PFASs, and HBCDD isomers.
#'
#' Contaminant concentrations are provided on a dry-weight basis. PCB and
#' HBCDD concentrations are also provided after lipid normalization.
#' Additional variables contain summed concentrations by contaminant family
#' and the relative contribution of individual compounds to these sums.
#'
#' @format A tibble with 50 rows and 148 variables. Each row represents one
#' benthic sample or pooled benthic sample. Variables include:
#' \describe{
#'
#'   \item{year}{
#'     Numeric. Sampling year.
#'   }
#'
#'   \item{season}{
#'     Factor. Sampling season, with levels \code{"Spring"} and
#'     \code{"Autumn"}.
#'   }
#'
#'   \item{date}{
#'     Character. Sampling date as recorded in the original dataset.
#'     Values originate from spreadsheet date codes.
#'   }
#'
#'   \item{zone}{
#'     Factor. Sampling area within the Seine estuary, with levels
#'     \code{"Chenal"}, \code{"Embouchure"}, \code{"Fosse Nord"}, and
#'     \code{"Fosse Sud"}.
#'   }
#'
#'   \item{site}{
#'     Character. Sampling-site identifier. Some samples combine material
#'     collected from several sites.
#'   }
#'
#'   \item{species}{
#'     Character. Taxonomic name of the benthic species, using underscores
#'     between genus and species names.
#'   }
#'
#'   \item{comment}{
#'     Character. Additional information recorded for the sample, including
#'     information on specimen size or the material included in the sample.
#'   }
#'
#'   \item{sample_TAG}{
#'     Character. Sample identifier used in the CHOPIN project.
#'   }
#'
#'   \item{mass_dry_percent}{
#'     Numeric. Dry mass expressed as a percentage of wet mass.
#'   }
#'
#'   \item{lip_dw_percent}{
#'     Numeric. Lipid content expressed as a percentage of dry weight.
#'   }
#'
#'   \item{delta13C}{
#'     Numeric. Carbon stable isotope composition, expressed as
#'     delta 13C/12C ‰ values.
#'   }
#'
#'   \item{delta15N}{
#'     Numeric. Nitrogen stable isotope composition, expressed as
#'     delta 15N/14N ‰ values.
#'   }
#'
#'   \item{<chemical>_ng_gdw}{
#'     Numeric. Concentration of an individual PCB congener, PFAS compound,
#'     or HBCDD isomer, expressed in ng per g dry weight
#'     (ng g^-1 dw).
#'   }
#'
#'   \item{a.HBCDD_ng_gdw_censored, b.HBCDD_ng_gdw_censored,
#'   g.HBCDD_ng_gdw_censored}{
#'     Numeric. HBCDD concentrations prepared for analyses involving censored
#'     observations. Values below the analytical quantification threshold are
#'     encoded according to the censoring procedure used in the analysis (0
#'     replacement.
#'   }
#'
#'   \item{labels}{
#'     Character. Abbreviated species labels used in figures and tables.
#'   }
#'
#'   \item{taxa}{
#'     Character. Broad taxonomic group of each benthic organism:
#'     \code{"Bivalves"}, \code{"Polychaetes"}, or \code{"Crustaceans"}.
#'   }
#'
#'   \item{alim}{
#'     Character. Feeding mode of the benthic organism. Codes include
#'     \code{"Susp."} for suspension feeder, \code{"Dep.sur."} for surface
#'     deposit feeder, \code{"Dep.sub."} for subsurface deposit feeder,
#'     \code{"Susp.Dep.sur."} for suspension and surface deposit feeder,
#'     and \code{"Omnivore"} for omnivore.
#'   }
#'
#'   \item{<chemical>_ng_glw}{
#'     Numeric. Lipid-normalized concentration of an individual PCB congener
#'     or HBCDD isomer, expressed in ng per g lipid weight
#'     (ng g^-1 lw).
#'   }
#'
#'   \item{sumPCB_ng_gdw}{
#'     Numeric. Sum of PCB congener concentrations, expressed in
#'     ng per g dry weight.
#'   }
#'
#'   \item{sumPFAS_ng_gdw}{
#'     Numeric. Sum of PFAS concentrations, expressed in ng per g dry weight.
#'   }
#'
#'   \item{sumPFCA_ng_gdw}{
#'     Numeric. Sum of perfluoroalkyl carboxylic acid (PFCA) concentrations,
#'     expressed in ng per g dry weight.
#'   }
#'
#'   \item{sumFOSA_ng_gdw}{
#'     Numeric. Sum of FOSA-related compound concentrations, expressed in
#'     ng per g dry weight.
#'   }
#'
#'   \item{sumPFSA_ng_gdw}{
#'     Numeric. Sum of perfluoroalkyl sulfonate (PFSA) concentrations,
#'     expressed in ng per g dry weight.
#'   }
#'
#'   \item{sumHBCDD_ng_gdw}{
#'     Numeric. Sum of alpha-, beta-, and gamma-HBCDD concentrations,
#'     expressed in ng per g dry weight.
#'   }
#'
#'   \item{<chemical>_normalised_sum_ng_gdw}{
#'     Numeric. Relative contribution of an individual compound to the
#'     corresponding contaminant-family sum, calculated from dry-weight
#'     concentrations. Values are proportions and therefore dimensionless
#'     despite the historical variable suffix.
#'   }
#' }
#'
#' @details
#' The dataset includes bivalves, polychaetes, and crustaceans sampled in
#' several areas of the Seine estuary during spring and autumn 2017.
#'
#' Individual contaminant identifiers follow the nomenclature provided in
#' \code{\link{contam_info}}. Variables ending in \code{_ng_gdw} contain
#' concentrations expressed relative to organism dry weight, whereas variables
#' ending in \code{_ng_glw} contain concentrations normalized to lipid weight.
#'
#' Lipid-normalized variables are available for PCB congeners and HBCDD
#' isomers. PFAS concentrations are retained on a dry-weight basis.
#'
#' Variables containing \code{normalised_sum} describe the contribution of
#' each individual compound to the total concentration of its chemical family
#' and should not be interpreted as contaminant concentrations.
#'
#' Zero values in contaminant variables are retained as provided in the
#' analytical dataset and should not automatically be interpreted as true
#' absence without considering analytical detection and quantification limits
#' provided in \code{\link{contam_info}}.
#'
#' @source
#' CHOPIN project benthic macrofauna sampling and contaminant analytical
#' dataset.
#'
#' @seealso
#' \code{\link{contam_info}}
#'
#' @keywords datasets
#'
#' @name benthos_contam
NULL


# BUILD DOCUMENTATION -----------------------------------------------------

# devtools::document()
