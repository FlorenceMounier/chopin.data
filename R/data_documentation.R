
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
#'     Factor. Sampling season, with levels \code{"spring"} and
#'     \code{"autumn"}.
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


#' Biological traits of benthic taxa
#'
#' Reference table describing the benthic taxa analysed in the CHOPIN
#' project and their main biological and functional traits.
#'
#' The dataset provides taxonomic labels, broad taxonomic groups, feeding
#' modes, and mobility categories for the benthic species used in the
#' contamination analyses.
#'
#' @format A tibble with 16 rows and 5 variables:
#' \describe{
#'
#'   \item{species}{
#'     Character. Taxonomic identifier used in the CHOPIN datasets and
#'     analysis scripts. Genus and species names are separated by an
#'     underscore.
#'   }
#'
#'   \item{labels}{
#'     Character. Abbreviated taxonomic label used for figures and tables.
#'   }
#'
#'   \item{taxa}{
#'     Character. Broad taxonomic group of the organism, with values
#'     \code{"Bivalves"}, \code{"Polychaetes"}, and \code{"Crustaceans"}.
#'   }
#'
#'   \item{feeding_mode}{
#'     Character. Feeding-mode category of the benthic organism.
#'     Categories are:
#'     \code{"Susp."} for suspension feeder,
#'     \code{"Dep.sur."} for surface deposit feeder,
#'     \code{"Dep.sub."} for subsurface deposit feeder,
#'     \code{"Susp.Dep.sur."} for suspension and surface deposit feeder,
#'     and \code{"Omnivore"} for omnivore.
#'   }
#'
#'   \item{mobility}{
#'     Character. Functional mobility category of the benthic organism, with
#'     values \code{"Sedentary"}, \code{"Low mobility"}, and \code{"Mobile"}.
#'     \code{"Sedentary"} identifies largely sessile or strongly site-attached
#'     taxa, \code{"Low mobility"} identifies taxa capable of limited local
#'     movement or repositioning within or on the sediment, and
#'     \code{"Mobile"} identifies actively moving taxa.
#'   }
#' }
#'
#' @details
#' This table is intended to be joined to benthic contamination datasets
#' using the \code{species} variable.
#'
#' Feeding-mode categories describe the dominant trophic strategy assigned
#' to each taxon, whereas mobility categories describe the general degree
#' of movement of organisms within or over the sediment.
#'
#' @source
#' CHOPIN project benthic trait reference table.
#'
#' @keywords datasets
#'
#' @name benthos_info
NULL


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
#'     Factor. Sampling season, with levels \code{"spring"} and
#'     \code{"autumn"}.
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
#'     Character. Taxonomic identifier used in the CHOPIN datasets and
#'     analysis scripts. Genus and species names are separated by an
#'     underscore.
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
#'     Character. Abbreviated taxonomic label used for figures and tables.
#'   }
#'
#'   \item{taxa}{
#'     Character. Broad taxonomic group of the organism, with values
#'     \code{"Bivalves"}, \code{"Polychaetes"}, and \code{"Crustaceans"}.
#'   }
#'
#'   \item{feeding_mode}{
#'     Character. Feeding-mode category of the benthic organism.
#'     Categories are:
#'     \code{"Susp."} for suspension feeder,
#'     \code{"Dep.sur."} for surface deposit feeder,
#'     \code{"Dep.sub."} for subsurface deposit feeder,
#'     \code{"Susp.Dep.sur."} for suspension and surface deposit feeder,
#'     and \code{"Omnivore"} for omnivore.
#'   }
#'
#'   \item{mobility}{
#'     Character. Functional mobility category of the benthic organism, with
#'     values \code{"Sedentary"}, \code{"Low mobility"}, and \code{"Mobile"}.
#'     \code{"Sedentary"} identifies largely sessile or strongly site-attached
#'     taxa, \code{"Low mobility"} identifies taxa capable of limited local
#'     movement or repositioning within or on the sediment, and
#'     \code{"Mobile"} identifies actively moving taxa.
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



# 4-data_formatting_soles.R -----------------------------------------------


#' Biological traits of common sole
#'
#' Reference table describing the taxonomic identity and main biological
#' and functional traits assigned to common sole (\emph{Solea solea}) in
#' the CHOPIN project.
#'
#' @format A tibble with 1 row and 5 variables:
#' \describe{
#'
#'   \item{species}{
#'     Character. Taxonomic identifier used in the CHOPIN datasets and
#'     analysis scripts. Genus and species names are separated by an
#'     underscore.
#'   }
#'
#'   \item{labels}{
#'     Character. Abbreviated taxonomic label used for figures and tables.
#'   }
#'
#'   \item{taxa}{
#'     Character. Broad taxonomic group of the organism. For this dataset,
#'     the value is \code{"Fish"}.
#'   }
#'
#'   \item{feeding_mode}{
#'     Character. Feeding-mode category assigned to common sole. For this
#'     dataset, the value is \code{"Omnivore"}.
#'   }
#'
#'   \item{mobility}{
#'     Character. Functional mobility category assigned to common sole.
#'     For this dataset, the value is \code{"Mobile"}.
#'   }
#' }
#'
#' @details
#' This table is intended to provide a trait reference for common sole and
#' can be joined to fish contamination datasets using the \code{species}
#' variable.
#'
#' @source
#' CHOPIN project fish trait reference table.
#'
#' @keywords datasets
#'
#' @name soles_info
NULL

#' Contaminant concentrations in common sole
#'
#' Biological characteristics and contaminant concentrations measured in
#' common sole (\emph{Solea solea}) collected during the CHOPIN project in
#' the Seine estuary.
#'
#' The dataset includes fish from three age classes (G0, G1, and G2).
#' G0 fish were analysed as pooled samples, G1 fish were analysed as
#' whole-body samples, and G2 fish were analysed by tissue or body
#' compartment, including liver, gonads, and the remaining body tissues.
#'
#' Contaminant measurements include PCBs, PFASs, and HBCDD isomers.
#' Concentrations are provided on a dry-weight basis and, for selected
#' hydrophobic contaminants, on a lipid-weight basis. The dataset also
#' includes contaminant burdens, summed concentrations by chemical family,
#' and the relative contribution of individual compounds to family sums.
#'
#' @format A tibble with 74 rows and 215 variables. A row represents a pooled
#' sample, a whole fish, or a tissue/body compartment depending on
#' \code{sample_type}. Variables include:
#' \describe{
#'
#'   \item{year}{
#'     Numeric. Sampling year.
#'   }
#'
#'   \item{date}{
#'     POSIXct. Sampling date in UTC.
#'   }
#'
#'   \item{season}{
#'     Character. Sampling season, with values \code{"spring"} and
#'     \code{"autumn"}.
#'   }
#'
#'   \item{zone}{
#'     Character. Sampling area within the Seine estuary, including
#'     \code{"Chenal"}, \code{"Embouchure"}, \code{"Fosse Nord"}, and
#'     \code{"Fosse Sud"}.
#'   }
#'
#'   \item{species}{
#'     Character. Fish species. All observations correspond to common sole,
#'     \emph{Solea solea}.
#'   }
#'
#'   \item{labels}{
#'     Character. Abbreviated species labels used in figures and tables.
#'   }
#'
#'   \item{taxa}{
#'     Character. Taxonomic group (\code{"Fish"}).
#'   }
#'
#'   \item{feeding_mode}{
#'     Character. Feeding mode (\code{"Omnivore"}).
#'   }
#'
#'   \item{mobility}{
#'     Character. Functional mobility category (\code{"mobile"}).
#'   }
#'
#'   \item{class}{
#'     Character. Fish age class: \code{"G0"}, \code{"G1"}, or \code{"G2"}.
#'   }
#'
#'   \item{cohort}{
#'     Numeric. Year-class of the fish, corresponding to its year of birth.
#'   }
#'
#'   \item{sample_type}{
#'     Factor. Type of biological sample. Levels are \code{"pool"} for pooled
#'     fish, \code{"WB"} for whole-body samples, \code{"gonads"} for gonadal
#'     tissue, \code{"liver"} for liver tissue, and \code{"rest"} for the
#'     remaining body compartment after liver and gonads were removed.
#'   }
#'
#'   \item{sample_TAG}{
#'     Character. Sample identifier used in the CHOPIN project. For G2 fish,
#'     the same identifier may occur several times because different tissues
#'     from the same individual were analysed separately.
#'   }
#'
#'   \item{sex}{
#'     Character. Sex code recorded for the sampled fish
#'     (\code{"F"}, \code{"M"}, or \code{"I"}).
#'   }
#'
#'   \item{length_TL_cm}{
#'     Numeric. Total fish length, expressed in centimetres. For pooled
#'     samples, values represent the mean length of individuals in the pool.
#'   }
#'
#'   \item{length_TL_cm_sd}{
#'     Numeric. Standard deviation of total length within pooled samples.
#'     Missing for individually analysed fish.
#'   }
#'
#'   \item{length_SL_cm}{
#'     Numeric. Standard fish length, expressed in centimetres.
#'   }
#'
#'   \item{mass_tot_gww}{
#'     Numeric. Total fish wet mass, expressed in grams wet weight (g ww).
#'     For pooled samples, values represent the mean individual mass.
#'   }
#'
#'   \item{mass_tot_gww_sd}{
#'     Numeric. Standard deviation of total wet mass within pooled samples.
#'     Missing for individually analysed fish.
#'   }
#'
#'   \item{dry_content_percent}{
#'     Numeric. Dry matter content expressed as a percentage of wet mass.
#'   }
#'
#'   \item{lip_dw_percent}{
#'     Numeric. Lipid content expressed as a percentage of dry weight.
#'   }
#'
#'   \item{delta13C}{
#'     Numeric. Carbon stable isotope composition, expressed as
#'     delta-13-C values.
#'   }
#'
#'   \item{delta15N}{
#'     Numeric. Nitrogen stable isotope composition, expressed as
#'     delta-15-N values.
#'   }
#'
#'   \item{mass_tissue_gww}{
#'     Numeric. Wet mass of the analysed tissue or body compartment,
#'     expressed in grams wet weight (g ww). Mainly used for G2 tissue
#'     samples.
#'   }
#'
#'   \item{mass_gdw}{
#'     Numeric. Dry mass of the analysed sample or tissue, expressed in
#'     grams dry weight (g dw).
#'   }
#'
#'   \item{SI}{
#'     Numeric. Index variable retained in the original dataset. Values are
#'     missing in the current version of the dataset.
#'   }
#'
#'   \item{a.HBCDD_pg_gdw, b.HBCDD_pg_gdw, g.HBCDD_pg_gdw}{
#'     Numeric. Concentrations of alpha-, beta-, and gamma-HBCDD,
#'     respectively, expressed in pg per g dry weight (pg g^-1 dw).
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
#'     Numeric. HBCDD concentrations prepared for statistical analyses of
#'     censored observations.
#'   }
#'
#'   \item{<chemical>_ng_glw}{
#'     Numeric. Lipid-normalized concentration of an individual PCB congener
#'     or HBCDD isomer, expressed in ng per g lipid weight
#'     (ng g^-1 lw).
#'   }
#'
#'   \item{<chemical>_ng}{
#'     Numeric. Total amount of an individual contaminant in the analysed
#'     sample, fish, or tissue, expressed in ng. These values combine
#'     dry-weight contaminant concentration with the dry mass of the
#'     corresponding biological sample.
#'   }
#'
#'   \item{a.HBCDD_ng_censored, b.HBCDD_ng_censored,
#'   g.HBCDD_ng_censored}{
#'     Numeric. Total amounts of HBCDD isomers prepared for analyses involving
#'     censored observations.
#'   }
#'
#'   \item{sumPCB_ng_gdw}{
#'     Numeric. Sum of PCB congener concentrations, expressed in
#'     ng per g dry weight.
#'   }
#'
#'   \item{sumHBCDD_ng_gdw}{
#'     Numeric. Sum of alpha-, beta-, and gamma-HBCDD concentrations,
#'     expressed in ng per g dry weight.
#'   }
#'
#'   \item{sumHBCDD_ng_gdw_censored}{
#'     Numeric. Sum of HBCDD concentrations based on the variables prepared
#'     for censored-data analyses.
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
#'   \item{<chemical>_normalised_sum_ng_gdw}{
#'     Numeric. Relative contribution of an individual compound to the
#'     corresponding contaminant-family sum, calculated from dry-weight
#'     concentrations. Values are proportions and therefore dimensionless
#'     despite the historical variable suffix.
#'   }
#'
#'   \item{<HBCDD>_normalised_sum_ng_gdw_censored}{
#'     Numeric. Relative contribution of an HBCDD isomer to total HBCDD,
#'     calculated using concentrations prepared for censored-data analyses.
#'   }
#' }
#'
#' @details
#' The structure of the dataset differs among age classes. G0 samples are
#' pools of juvenile soles, whereas G1 samples correspond to individual
#' whole fish. For G2 fish, contaminant concentrations were measured
#' separately in the liver, gonads, and remaining body compartment. Thus,
#' several rows can refer to different tissues from the same G2 individual.
#'
#' Morphometric variables associated with pooled samples represent mean
#' individual values, with their corresponding standard deviations when
#' available. Morphometric information is repeated across tissue-specific
#' rows belonging to the same G2 individual.
#'
#' Individual contaminant identifiers follow the nomenclature provided in
#' \code{\link{contam_info}}. Concentration variables ending in
#' \code{_ng_gdw} are expressed on a dry-weight basis, whereas variables
#' ending in \code{_ng_glw} are normalized to lipid content.
#'
#' HBCDD concentrations were initially available in pg g^-1 dry weight and
#' are also provided after conversion to ng g^-1 dry weight. Specific
#' variables are retained for analyses accounting for censored HBCDD
#' observations.
#'
#' Variables ending in \code{_ng} represent contaminant amounts rather than
#' concentrations. They can therefore be used to reconstruct contaminant
#' burdens across the different tissues of G2 fish.
#'
#' Variables containing \code{normalised_sum} represent the proportional
#' contribution of each compound to the summed concentration of its
#' contaminant family and should not be interpreted as concentrations.
#'
#' Zero values in contaminant variables are retained as provided in the
#' analytical dataset and should not automatically be interpreted as true
#' absence without considering analytical detection and quantification limits.
#'
#' @source
#' CHOPIN project common sole sampling and contaminant analytical dataset.
#'
#' @seealso
#' \code{\link{contam_info}}
#'
#' @keywords datasets
#'
#' @name soles_contam
NULL



# 5-data_formatting_isotopes.R --------------------------------------------


#' Stable isotope signatures of benthos and common sole
#'
#' Stable isotope data for benthic organisms and common sole
#' (\emph{Solea solea}) collected during the CAPES and CHOPIN projects
#' in the Seine estuary.
#'
#' The dataset contains carbon and nitrogen stable isotope signatures,
#' taxonomic and functional information, sampling location, and selected
#' biological characteristics of common sole.
#'
#' @format A tibble with 285 rows and 21 variables:
#' \describe{
#'
#'   \item{sample_TAG}{
#'     Character. Unique sample identifier used in the CAPES or CHOPIN
#'     project.
#'   }
#'
#'   \item{species}{
#'     Factor. Taxonomic identifier of the sampled organism. Genus and
#'     species names are separated by an underscore. The dataset includes
#'     benthic invertebrates and common sole (\code{"Solea_solea"}).
#'   }
#'
#'   \item{season}{
#'     Character. Sampling season, corresponding to spring or autumn.
#'   }
#'
#'   \item{zone}{
#'     Character. Sampling area within the Seine estuary, including
#'     \code{"Chenal"}, \code{"Embouchure"}, \code{"Fosse Nord"}, and
#'     \code{"Fosse Sud"}.
#'   }
#'
#'   \item{site}{
#'     Character. Sampling-site identifier.
#'   }
#'
#'   \item{num_increment}{
#'     Character. Identifier of the sample or analytical increment used
#'     for stable isotope measurements.
#'   }
#'
#'   \item{delta13C}{
#'     Numeric. Carbon stable isotope signature, expressed as
#'     delta-13-C values.
#'   }
#'
#'   \item{delta15N}{
#'     Numeric. Nitrogen stable isotope signature, expressed as
#'     delta-15-N values.
#'   }
#'
#'   \item{C_percent}{
#'     Numeric. Carbon content of the analysed sample, expressed as a
#'     percentage of dry mass.
#'   }
#'
#'   \item{N_percent}{
#'     Numeric. Nitrogen content of the analysed sample, expressed as a
#'     percentage of dry mass.
#'   }
#'
#'   \item{source}{
#'     Character. Project from which the observation originates, with
#'     values \code{"CAPES"} and \code{"CHOPIN"}.
#'   }
#'
#'   \item{labels}{
#'     Character. Abbreviated taxonomic label used for figures and tables.
#'   }
#'
#'   \item{taxa}{
#'     Character. Broad taxonomic group of the organism, including
#'     \code{"Bivalves"}, \code{"Polychaetes"}, \code{"Crustaceans"},
#'     and \code{"Fish"}.
#'   }
#'
#'   \item{feeding_mode}{
#'     Character. Feeding-mode category of the organism.
#'     Categories include \code{"Susp."} for suspension feeder,
#'     \code{"Dep.sur."} for surface deposit feeder,
#'     \code{"Dep.sub."} for subsurface deposit feeder,
#'     \code{"Susp.Dep.sur."} for suspension and surface deposit feeder,
#'     and \code{"Omnivore"} for omnivore.
#'   }
#'
#'   \item{mobility}{
#'     Character. Functional mobility category of the organism, with
#'     values \code{"Sedentary"}, \code{"Low mobility"}, and
#'     \code{"Mobile"}.
#'   }
#'
#'   \item{lip_dw_percent}{
#'     Numeric. Lipid content expressed as a percentage of dry weight.
#'     Available only for a subset of samples.
#'   }
#'
#'   \item{class}{
#'     Character. Age class of common sole, with values \code{"G0"} and
#'     \code{"G1"}. Missing for benthic organisms.
#'   }
#'
#'   \item{stade}{
#'     Character. Composite stage identifier used for common sole,
#'     combining species, age class, and stage category
#'     (e.g. \code{"Solea_solea.G0.S1"}).
#'     Missing for benthic organisms.
#'   }
#'
#'   \item{length_TL_cm}{
#'     Numeric. Total length of common sole. Missing for benthic organisms.
#'   }
#'
#'   \item{lon}{
#'     Numeric. Longitude of the sampling location in decimal degrees.
#'   }
#'
#'   \item{lat}{
#'     Numeric. Latitude of the sampling location in decimal degrees.
#'   }
#' }
#'
#' @details
#' Stable isotope signatures are expressed as delta values for carbon
#' (\eqn{\delta^{13}C}) and nitrogen (\eqn{\delta^{15}N}).
#'
#' The dataset combines benthic invertebrates and common sole in order to
#' characterize trophic relationships and support analyses of contaminant
#' transfer through the benthic food web.
#'
#' Biological traits for benthic taxa and common sole are included directly
#' in the dataset through the \code{taxa}, \code{feeding_mode}, and
#' \code{mobility} variables.
#'
#' Variables \code{class}, \code{stade}, and \code{length_TL_cm} apply to
#' common sole and are missing for benthic organisms.
#'
#' @source
#' CAPES and CHOPIN projects, Seine estuary.
#'
#' @seealso
#' \code{\link{benthos_info}},
#' \code{\link{soles_info}}
#'
#' @keywords datasets
#'
#' @name isotopes
NULL



# 6-data_formatting_stomach_content.R -------------------------------------


#' Stomach and gut contents of juvenile common sole
#'
#' Diet composition and digestive tract contents of juvenile common sole
#' (\emph{Solea solea}) sampled during the CAPES project.
#'
#' The dataset contains fish identification and biological characteristics,
#' digestive tract measurements, and taxonomic information on prey items
#' identified in the stomach and gut. Prey abundance, degradation stage,
#' and identification notes are recorded separately for the two digestive
#' compartments.
#'
#' @format A tibble with 29 variables:
#' \describe{
#'
#'   \item{sample_TAG}{
#'     Character. Identifier of the sampled fish.
#'   }
#'
#'   \item{class}{
#'     Character. Fish age class, including \code{"G0"}, \code{"G1"},
#'     and \code{"G2"}.
#'   }
#'
#'   \item{zone}{
#'     Character. Sampling area within the Seine estuary.
#'   }
#'
#'   \item{site}{
#'     Character. Sampling-site identifier.
#'   }
#'
#'   \item{date}{
#'     Sampling date.
#'   }
#'
#'   \item{hour}{
#'     Sampling time.
#'   }
#'
#'   \item{sex}{
#'     Character. Sex of the sampled fish.
#'   }
#'
#'   \item{mass_stomach_full_g}{
#'     Numeric. Mass of the stomach including its contents, expressed
#'     in grams.
#'   }
#'
#'   \item{mass_stomach_empty_g}{
#'     Numeric. Mass of the empty stomach, expressed in grams.
#'   }
#'
#'   \item{mass_stomach_content_g}{
#'     Numeric. Mass of the stomach contents, expressed in grams.
#'   }
#'
#'   \item{mass_gut_full_g}{
#'     Numeric. Mass of the gut including its contents, expressed
#'     in grams.
#'   }
#'
#'   \item{mass_gut_empty_g}{
#'     Numeric. Mass of the empty gut, expressed in grams.
#'   }
#'
#'   \item{mass_gut_content_g}{
#'     Numeric. Mass of the gut contents, expressed in grams.
#'   }
#'
#'   \item{observations_tutorial}{
#'     Character. Additional observations recorded during the examination
#'     of the digestive tract.
#'   }
#'
#'   \item{species}{
#'     Character. Taxonomic identification of the prey item or other
#'     biological material recorded in the digestive tract.
#'     Identification may be provided at different taxonomic levels.
#'   }
#'
#'   \item{status}{
#'     Character. Status assigned to the identified item, used to
#'     distinguish prey from other recorded material.
#'   }
#'
#'   \item{N_stomach}{
#'     Numeric. Number of prey individuals or items recorded in the stomach.
#'   }
#'
#'   \item{degradation_stage_stomach}{
#'     Degradation stage of the prey material found in the stomach.
#'   }
#'
#'   \item{N_gut}{
#'     Numeric. Number of prey individuals or items recorded in the gut.
#'   }
#'
#'   \item{degradation_stage_gut}{
#'     Degradation stage of the prey material found in the gut.
#'   }
#'
#'   \item{N_tract}{
#'     Numeric. Total number of prey individuals or items recorded
#'     in the digestive tract.
#'   }
#'
#'   \item{observations}{
#'     Character. Additional observations concerning the identified item,
#'     including morphological characteristics, body fragments, and
#'     information used for taxonomic identification or prey counting.
#'   }
#'
#'   \item{length_TL_cm}{
#'     Numeric. Total fish length, expressed in centimetres.
#'   }
#'
#'   \item{length_SL_cm}{
#'     Numeric. Standard fish length, expressed in centimetres.
#'   }
#'
#'   \item{mass_tot_gww}{
#'     Numeric. Total fish wet mass, expressed in grams wet weight
#'     (g ww).
#'   }
#'
#'   \item{mass_liver_mgww}{
#'     Numeric. Liver wet mass, expressed in milligrams wet weight
#'     (mg ww).
#'   }
#'
#'   \item{mass_tractus_mgww}{
#'     Numeric. Digestive tract wet mass, expressed in milligrams
#'     wet weight (mg ww).
#'   }
#'
#'   \item{mass_gonads_gww}{
#'     Numeric. Gonad wet mass, expressed in grams wet weight
#'     (g ww).
#'   }
#'
#'   \item{mass_eviceratedd_mgww}{
#'     Numeric. Eviscerated fish wet mass, expressed in milligrams
#'     wet weight (mg ww).
#'   }
#' }
#'
#' @details
#' Each fish can be represented by several rows corresponding to different
#' prey taxa or other items identified in its digestive tract. Fish-level
#' information, including morphometric measurements and digestive tract
#' masses, may therefore be repeated across rows sharing the same
#' \code{sample_TAG}.
#'
#' Prey abundance is recorded separately for the stomach (\code{N_stomach})
#' and gut (\code{N_gut}), as well as for the complete digestive tract
#' (\code{N_tract}).
#'
#' The \code{species} variable contains the taxonomic identification
#' recorded during the analysis. Some items are identified only to genus
#' or a higher taxonomic level, whereas others remain unidentified.
#'
#' The \code{status} variable can be used to select prey observations
#' before analysing diet composition.
#'
#' Missing values indicate that the corresponding measurement or
#' information was not available for the observation.
#'
#' @source
#' CAPES project, Seine estuary. Juvenile common sole stomach and
#' gut content dataset.
#'
#' @seealso
#' \code{\link{soles_contam}},
#' \code{\link{soles_info}},
#' \code{\link{benthos_info}}
#'
#' @keywords datasets
#'
#' @name soles_stomach
NULL


#' Taxonomic classification of prey identified in common sole
#'
#' Reference table providing the taxonomic classification of organisms
#' identified in the digestive tract contents of common sole
#' (\emph{Solea solea}) during the CAPES project.
#'
#' Taxonomic information was retrieved from the World Register of Marine
#' Species (WoRMS). The dataset contains the scientific name recorded
#' in the stomach content data and its corresponding taxonomic hierarchy,
#' from kingdom to species or the lowest available taxonomic rank.
#'
#' @format A tibble with 29 variables:
#' \describe{
#'
#'   \item{scientific_name}{
#'     Character. Scientific name or taxonomic identifier recorded in
#'     the stomach content dataset. Names may correspond to species,
#'     genera, families, or higher taxonomic groups.
#'   }
#'
#'   \item{Kingdom}{
#'     Character. Taxonomic kingdom.
#'   }
#'
#'   \item{Subkingdom}{
#'     Character. Taxonomic subkingdom.
#'   }
#'
#'   \item{Infrakingdom}{
#'     Character. Taxonomic infrakingdom.
#'   }
#'
#'   \item{Phylum}{
#'     Character. Taxonomic phylum.
#'   }
#'
#'   \item{Subphylum}{
#'     Character. Taxonomic subphylum.
#'   }
#'
#'   \item{Infraphylum, Parvphylum}{
#'     Character. Additional taxonomic subdivisions of the phylum.
#'   }
#'
#'   \item{Gigaclass, Superclass, Class, Subclass, Infraclass,
#'   Subterclass}{
#'     Character. Taxonomic class and its subdivisions or higher
#'     classification levels.
#'   }
#'
#'   \item{Superorder, Order, Suborder, Infraorder, Parvorder}{
#'     Character. Taxonomic order and its subdivisions or higher
#'     classification levels.
#'   }
#'
#'   \item{Section, Subsection}{
#'     Character. Additional intermediate taxonomic ranks.
#'   }
#'
#'   \item{Superfamily, Family, Subfamily, Tribe}{
#'     Character. Taxonomic family and its subdivisions or higher
#'     classification levels.
#'   }
#'
#'   \item{Genus}{
#'     Character. Taxonomic genus.
#'   }
#'
#'   \item{Subgenus}{
#'     Character. Taxonomic subgenus, when applicable.
#'   }
#'
#'   \item{Species}{
#'     Character. Scientific name at the species level, when the
#'     organism was identified to species.
#'   }
#'
#'   \item{Subspecies}{
#'     Character. Scientific name at the subspecies level, when
#'     applicable.
#'   }
#' }
#'
#' @details
#' Each row represents a taxon recorded in the stomach content dataset.
#' Taxonomic classification was obtained using the R package
#' \code{worrms}, which provides access to the World Register of Marine
#' Species (WoRMS).
#'
#' Taxa identified only to genus or a higher taxonomic rank retain their
#' available classification without being assigned to an arbitrary species.
#' For example, a record identified as \code{"Spisula sp"} may have a
#' classification extending to the genus \code{"Spisula"}, while its
#' \code{Species} field remains missing.
#'
#' Missing values indicate that the corresponding taxonomic rank was not
#' available or was not applicable to the taxon. Some ranks are specific
#' to particular taxonomic groups and are therefore not populated for
#' all organisms.
#'
#' The \code{scientific_name} variable can be used to join this reference
#' table to the stomach content dataset.
#'
#' @source
#' CAPES project stomach content dataset.
#' Taxonomic classification retrieved from the World Register of Marine
#' Species (WoRMS).
#'
#' @seealso
#' \code{\link{soles_stomach}},
#' \code{\link{benthos_info}}
#'
#' @keywords datasets
#'
#' @name species_classif
NULL




# 7-data_formatting_soles_biomarkers.R ------------------------------------


#' Biological characteristics and biomarkers of common sole
#'
#' Biological characteristics, somatic condition indices, histological
#' observations, and biomarkers measured in common sole (\emph{Solea solea})
#' collected during the CHOPIN project in the Seine estuary.
#'
#' The dataset includes fish morphometric measurements, liver and gonad
#' masses, hepatosomatic and gonadosomatic indices, and biomarkers related
#' to neurotoxicity, biotransformation activity, genotoxicity, and
#' reproductive physiology.
#'
#' @format A tibble with 33 variables. Each row represents an individual
#' fish or, for G0 samples, a pooled group of fish. Variables include:
#' \describe{
#'
#'   \item{species}{
#'     Character. Taxonomic identifier of the sampled fish. All observations
#'     correspond to common sole, \code{"Solea_solea"}.
#'   }
#'
#'   \item{year}{
#'     Numeric. Sampling year.
#'   }
#'
#'   \item{date}{
#'     Date. Sampling date.
#'   }
#'
#'   \item{season}{
#'     Character. Sampling season, derived from the sampling date.
#'   }
#'
#'   \item{series}{
#'     Character. Identifier of the sampling or experimental series.
#'   }
#'
#'   \item{sample_TAG}{
#'     Character. Sample identifier used in the CHOPIN project.
#'   }
#'
#'   \item{class}{
#'     Factor. Fish age class, with levels \code{"G0"}, \code{"G1"},
#'     and \code{"G2"}.
#'   }
#'
#'   \item{sex}{
#'     Character. Sex of the sampled fish, with \code{"F"} for female
#'     and \code{"M"} for male. Missing when sex was not determined
#'     or not recorded.
#'   }
#'
#'   \item{length_TL_cm}{
#'     Numeric. Total fish length, expressed in centimetres.
#'     For pooled samples, values represent the mean individual length.
#'   }
#'
#'   \item{length_TL_cm_sd}{
#'     Numeric. Standard deviation of total fish length within pooled
#'     samples, expressed in centimetres.
#'   }
#'
#'   \item{length_SL_cm}{
#'     Numeric. Standard fish length, expressed in centimetres.
#'     For pooled samples, values represent the mean individual length.
#'   }
#'
#'   \item{length_SL_cm_sd}{
#'     Numeric. Standard deviation of standard fish length within pooled
#'     samples, expressed in centimetres.
#'   }
#'
#'   \item{mass_tot_gww}{
#'     Numeric. Total fish wet mass, expressed in grams wet weight (g ww).
#'     For pooled samples, values represent the mean individual mass.
#'   }
#'
#'   \item{mass_tot_gww_sd}{
#'     Numeric. Standard deviation of total fish wet mass within pooled
#'     samples, expressed in grams wet weight (g ww).
#'   }
#'
#'   \item{mass_eviscerated_gww}{
#'     Numeric. Eviscerated fish wet mass, expressed in grams wet weight
#'     (g ww). For pooled samples, values represent the mean individual
#'     mass.
#'   }
#'
#'   \item{mass_eviscerated_gww_sd}{
#'     Numeric. Standard deviation of eviscerated fish wet mass within
#'     pooled samples, expressed in grams wet weight (g ww).
#'   }
#'
#'   \item{mass_gonads_gww}{
#'     Numeric. Gonad wet mass, expressed in grams wet weight (g ww).
#'   }
#'
#'   \item{mass_liver_gww}{
#'     Numeric. Liver wet mass, expressed in grams wet weight (g ww).
#'   }
#'
#'   \item{comment}{
#'     Character. Additional observations recorded during fish examination,
#'     including the presence of intestinal parasites when noted.
#'   }
#'
#'   \item{GSI}{
#'     Numeric. Gonadosomatic index, expressed as the percentage of total
#'     fish wet mass represented by gonad wet mass.
#'   }
#'
#'   \item{HSI}{
#'     Numeric. Hepatosomatic index, expressed as the percentage of total
#'     fish wet mass represented by liver wet mass.
#'   }
#'
#'   \item{liver_histology}{
#'     Character. Histological assessment of the liver, recorded using
#'     the categorical or numerical codes of the original protocol.
#'   }
#'
#'   \item{gonad_histology}{
#'     Character. Histological assessment of the gonads, recorded using
#'     the developmental-stage codes of the original protocol.
#'   }
#'
#'   \item{AChE_mean}{
#'     Numeric. Mean acetylcholinesterase (AChE) activity, expressed in
#'     micromoles per minute per milligram
#'     (\eqn{\mu mol min^{-1} mg^{-1}}).
#'   }
#'
#'   \item{AChE_sd}{
#'     Numeric. Standard deviation of acetylcholinesterase activity,
#'     expressed in \eqn{\mu mol min^{-1} mg^{-1}}.
#'   }
#'
#'   \item{EROD_mean}{
#'     Numeric. Mean ethoxyresorufin-O-deethylase (EROD) activity,
#'     expressed in picomoles per minute per milligram
#'     (\eqn{pmol min^{-1} mg^{-1}}).
#'   }
#'
#'   \item{EROD_sd}{
#'     Numeric. Standard deviation of EROD activity, expressed in
#'     \eqn{pmol min^{-1} mg^{-1}}.
#'   }
#'
#'   \item{COMET_OTM}{
#'     Numeric. DNA damage measured using the comet assay and expressed
#'     as Olive tail moment (OTM), an index combining the amount and
#'     migration distance of DNA in the comet tail.
#'   }
#'
#'   \item{COMET_OTM_sd}{
#'     Numeric. Standard deviation of Olive tail moment (OTM)
#'     measurements.
#'   }
#'
#'   \item{COMET_pDNAtail}{
#'     Numeric. DNA damage measured using the comet assay, expressed as
#'     the percentage of DNA in the comet tail (\% tail DNA).
#'   }
#'
#'   \item{micronuclei}{
#'     Numeric. Micronucleus frequency or measurement recorded during
#'     the micronucleus assay, according to the original analytical protocol.
#'   }
#'
#'   \item{VTG_mean}{
#'     Numeric. Mean vitellogenin (VTG) measurement, expressed in the
#'     units of the original analytical protocol.
#'   }
#'
#'   \item{VTG_sd}{
#'     Numeric. Standard deviation of the vitellogenin measurement,
#'     expressed in the same units as \code{VTG_mean}.
#'   }
#' }
#'
#' @details
#' The dataset combines observations from different sampling series
#' and fish age classes. G0 observations correspond to pooled samples,
#' whereas G1 and G2 observations correspond to individual fish.
#'
#' For pooled samples, morphometric and mass measurements are reported
#' as mean individual values with their associated standard deviations
#' when available.
#'
#' The gonadosomatic index (GSI) and hepatosomatic index (HSI) are
#' calculated from gonad and liver wet masses, respectively, relative
#' to total fish wet mass:
#'
#' \deqn{GSI = 100 \times \frac{M_{gonads}}{M_{total}}}
#'
#' \deqn{HSI = 100 \times \frac{M_{liver}}{M_{total}}}
#'
#' These indices are provided as recorded in the original dataset and
#' are not recalculated.
#'
#' AChE activity is used as a biomarker of neurotoxicity, whereas EROD
#' activity is used as a biomarker of biotransformation activity.
#' DNA damage is assessed using the comet assay through Olive tail
#' moment (OTM) and the percentage of DNA in the comet tail.
#' Micronucleus measurements provide an additional genotoxicity endpoint,
#' while vitellogenin measurements are related to reproductive physiology.
#'
#' Missing values indicate that the corresponding measurement or
#' observation was not available for the sample.
#'
#' @source
#' CHOPIN project, Seine estuary. Common sole biological characteristics,
#' histological observations, and biomarker dataset.
#'
#' @seealso
#' \code{\link{soles_contam}},
#' \code{\link{soles_info}}
#'
#' @keywords datasets
#'
#'
#' @name soles_biomarkers
NULL




# BUILD DOCUMENTATION -----------------------------------------------------

# devtools::document()
