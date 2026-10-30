

# Step 1. define the path of ovitraps ####
path_ovitraps <- "/Users/fdzul/Library/CloudStorage/Dropbox/CENAPRECE/2026/20_oaxaca"


# Step 2.1 define the arguments for spatial prediction with INLA-SPDE for one week ####
pto_escondido40 <- deneggs::eggs_hotspots_week2(path_lect = path_ovitraps,
                                                year = "2026", 
                                                locality  = "Puerto Escondido", 
                                                cve_ent = "20",
                                                leg_title = "Eggs", 
                                                fam = "zeroinflatednbinomial1", 
                                                alpha = 0.99, 
                                                plot = TRUE,
                                                aproximation = "gaussian", 
                                                integration = "eb",
                                                k = 80, 
                                                sem = 40,
                                                palette_vir = "viridis", 
                                                hist_dataset = FALSE)


pto_escondido21$map

# Step 2.2 run the spde model of Veracruz for all year ####
rgeomex::extract_locality(cve_edo = "20",
                          locality  = "Puerto Escondido")

pto_escondido_2026  <- deneggs::eggs_hotspots_year(cve_mpo = c("318"),
                                                   cve_edo = "20",
                                                   year = "2026",
                                                   hist_dataset = FALSE,
                                                   locality  = "Puerto Escondido",
                                                   path_vect = path_ovitraps,
                                                   integration_strategy = "eb",
                                                   aproximation_method = "gaussian",
                                                   fam_distribution = "zeroinflatednbinomial1",
                                                   kvalue = 80,
                                                   plot = TRUE,
                                                   palette.viridis = "viridis",
                                                   alpha.value = .99)

# Step 3. visudalization eggs hotspots intensity ####
deneggs::map_eggs_hotspots(betas = pto_escondido_2026 $betas,
                           locality  = "Puerto Escondido",
                           cve_edo = "20",
                           palette = rcartocolor::carto_pal,
                           name = "SunsetDark",
                           static_map = TRUE)

# Step 4. save the results ####
save(pto_escondido_2026, pto_escondido40, 
     file = "8.RData/20_puerto_escondido_2026.RData")


