####################################
##         COLOR PALETTES
####################################


PALETTE_PFAS_sed = c("PFNA" = "#4d194d",
                     "PFDA" = "#9900cc",
                     "PFUnDA" =  "#ff66ff",
                     "PFDoA" = "#0000b3",

                     "MeFOSAA" = "#0099cc",
                     "EtFOSAA" = "#ccffe6" ,

                     "PFOS(L)" = "#51C56AFF" ,
                     "PFOS(Br)" = "#C2DF23FF",
                     "PFDS" = "#FDE725FF",

                     "6:2-FTSA" = "#e67300",
                     "10:2-FTSA" = "#e63900",
                     "Autres" = "#990000")


PALETTE_PFAS_benthos = c("PFNA" = "#4d194d",
                         "PFDA" = "#9900cc",
                         "PFUnDA" = "#ff66ff",
                         "PFDoA" = "#0000b3",
                         "PFTrDA" = "#0066ff",
                         "PFTeDA" = "#80bfff",

                         "FOSA" = "#33cccc",
                         "EtFOSAA" = "#ccff99",

                         "L.PFOS" = "#51C56AFF",

                         "X6.2.FTSA" = "#e67300",
                         "otherPFASs" = "#990000")


PALETTE_PFAS_soles = c("PFNA" = "#4d194d",
                       "PFDA" = "#9900cc",
                       "PFUnDA" = "#ff66ff",
                       "PFDoA" = "#0000b3",
                       "PFTrDA" = "#0066ff",
                       "PFTeDA" = "#80bfff",

                       "FOSA" = "#33cccc",

                       "L.PFOS" = "#51C56AFF",

                       "otherPFASs" = "#990000")


usethis::use_data(PALETTE_PFAS_sed,
                  PALETTE_PFAS_benthos,
                  PALETTE_PFAS_soles,
                  overwrite = TRUE)
