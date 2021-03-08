# Variables
ver <- "2020-09-22"

## PATHS and common variables
version_dir <- sprintf("%s",ver)

## Create directory for plots
plt_dir <- sprintf("%s/plots_%s", ver, ver) 

## Create directory for RDS objects
robj_dir <- sprintf("%s/R_objects_%s", ver, ver)

## Paths to all the folders
an_27 <- "spatial_analysis"
an_28 <- "sc_analysis"

## SC paths
qc_28 <- sprintf("%s/02-QC", an_28)
clust_28 <- sprintf("%s/03-integration_clustering", an_28)
anot_28 <- sprintf("%s/04-annotation", an_28)
palm_28 <- sprintf("%s/05-palm_comparison", an_28)


## SP paths
qc_27 <- sprintf("%s/02-QC", an_27)
clust_27 <- sprintf("%s/03-Clustering", an_27)
anot_27 <- sprintf("%s/04-annotation", an_27)
# Variables
ver <- "2020-09-22"

## PATHS and common variables
version_dir <- sprintf("%s",ver)

## Create directory for plots
plt_dir <- sprintf("%s/plots_%s", ver, ver) 

## Create directory for RDS objects
robj_dir <- sprintf("%s/R_objects_%s", ver, ver)

## Paths to all the folders
an_27 <- "spatial_analysis"
an_28 <- "sc_analysis"

## SC paths
qc_28 <- sprintf("%s/02-QC", an_28)
clust_28 <- sprintf("%s/03-integration_clustering", an_28)
anot_28 <- sprintf("%s/04-annotation", an_28)
palm_28 <- sprintf("%s/05-palm_comparison", an_28)


## SP paths
qc_27 <- sprintf("%s/02-QC", an_27)
clust_27 <- sprintf("%s/03-Clustering", an_27)
anot_27 <- sprintf("%s/04-annotation", an_27)
map_27 <- sprintf("%s/05-sc_mapping", an_27)

## Paths to data
cell_ranger <- sprintf("%s/01-cellranger/results", an_28)
spaceranger <- sprintf("%s/01-spaceranger/results", an_27)
filtered_mtrx <- "outs/filtered_feature_bc_matrix"

# Single cell ID
id_df <- readr::read_csv(file = here::here(glue::glue("{cell_ranger}/epid_sc_metadata.csv")))

id_ls <- c("qsbh45_pccb6n", "k8uz5b_fjwlh2", "btlfxa_fff3je", "pvnq5v_ew78kc")

# Spatial ID
id_sp_df <- readr::read_csv(file = here::here(glue::glue("{an_27}/01-spaceranger/data/sample_id.txt")))

id_sp_ls <- id_sp_df$gem_id


# Spatial IDs
sp_id_ls <- c("ivuznh_s8xyfv", "k886qc_rqix54", "s2yq8o_t5hk8u", "uzntl1_fkclxp")

## QC dictionary SC
qc_dict <- list()
qc_dict[["yqfd3h_hpruh5"]] <- list()
qc_dict[["yqfd3h_hpruh5"]][["min_lib_size"]] <- 1000
qc_dict[["yqfd3h_hpruh5"]][["max_lib_size"]] <- 35000
qc_dict[["yqfd3h_hpruh5"]][["min_n_genes"]] <- 300
qc_dict[["yqfd3h_hpruh5"]][["max_pct_mt"]] <- 10
qc_dict[["yqfd3h_hpruh5"]][["min_cells"]] <- 8
qc_dict[["yqfd3h_hpruh5"]][["scrublet_thresh"]] <- 0.49

qc_dict[["fqgqu2_e9lci4"]] <- list()
qc_dict[["fqgqu2_e9lci4"]][["min_lib_size"]] <- 1500
qc_dict[["fqgqu2_e9lci4"]][["max_lib_size"]] <- 50000
qc_dict[["fqgqu2_e9lci4"]][["min_n_genes"]] <- 350
qc_dict[["fqgqu2_e9lci4"]][["max_pct_mt"]] <- 10
qc_dict[["fqgqu2_e9lci4"]][["min_cells"]] <- 8
qc_dict[["fqgqu2_e9lci4"]][["scrublet_thresh"]] <- 0.37

qc_dict[["c2skal_afw18q"]] <- list()
qc_dict[["c2skal_afw18q"]][["min_lib_size"]] <- 3000
qc_dict[["c2skal_afw18q"]][["max_lib_size"]] <- 45000
qc_dict[["c2skal_afw18q"]][["min_n_genes"]] <- 400
qc_dict[["c2skal_afw18q"]][["max_pct_mt"]] <- 10
qc_dict[["c2skal_afw18q"]][["min_cells"]] <- 8
qc_dict[["c2skal_afw18q"]][["scrublet_thresh"]] <- 0.51

qc_dict[["tww1z2_j8a6ap"]] <- list()
qc_dict[["tww1z2_j8a6ap"]][["min_lib_size"]] <- 3000
qc_dict[["tww1z2_j8a6ap"]][["max_lib_size"]] <- 40000
qc_dict[["tww1z2_j8a6ap"]][["min_n_genes"]] <- 350
qc_dict[["tww1z2_j8a6ap"]][["max_pct_mt"]] <- 10
qc_dict[["tww1z2_j8a6ap"]][["min_cells"]] <- 8
qc_dict[["tww1z2_j8a6ap"]][["scrublet_thresh"]] <- 0.50

qc_dict[["rxb7l3_qfjfhy"]] <- list()
qc_dict[["rxb7l3_qfjfhy"]][["min_lib_size"]] <- 3000
qc_dict[["rxb7l3_qfjfhy"]][["max_lib_size"]] <- 40000
qc_dict[["rxb7l3_qfjfhy"]][["min_n_genes"]] <- 400
qc_dict[["rxb7l3_qfjfhy"]][["max_pct_mt"]] <- 10
qc_dict[["rxb7l3_qfjfhy"]][["min_cells"]] <- 8
qc_dict[["rxb7l3_qfjfhy"]][["scrublet_thresh"]] <- 0.51

qc_dict[["rbz6fp_cwmqhm"]] <- list()
qc_dict[["rbz6fp_cwmqhm"]][["min_lib_size"]] <- 3000
qc_dict[["rbz6fp_cwmqhm"]][["max_lib_size"]] <- 40000
qc_dict[["rbz6fp_cwmqhm"]][["min_n_genes"]] <- 600
qc_dict[["rbz6fp_cwmqhm"]][["max_pct_mt"]] <- 10
qc_dict[["rbz6fp_cwmqhm"]][["min_cells"]] <- 8
qc_dict[["rbz6fp_cwmqhm"]][["scrublet_thresh"]] <- 0.46

qc_dict[["chbcd9_r2rxcz"]] <- list()
qc_dict[["chbcd9_r2rxcz"]][["min_lib_size"]] <- 3000
qc_dict[["chbcd9_r2rxcz"]][["max_lib_size"]] <- 45000
qc_dict[["chbcd9_r2rxcz"]][["min_n_genes"]] <- 350
qc_dict[["chbcd9_r2rxcz"]][["max_pct_mt"]] <- 10
qc_dict[["chbcd9_r2rxcz"]][["min_cells"]] <- 8
qc_dict[["chbcd9_r2rxcz"]][["scrublet_thresh"]] <- 0.30

qc_dict[["pvnq5v_ew78kc"]] <- list()
qc_dict[["pvnq5v_ew78kc"]][["min_lib_size"]] <- 7000
qc_dict[["pvnq5v_ew78kc"]][["max_lib_size"]] <- 30000
qc_dict[["pvnq5v_ew78kc"]][["min_n_genes"]] <- 600
qc_dict[["pvnq5v_ew78kc"]][["max_pct_mt"]] <- 10
qc_dict[["pvnq5v_ew78kc"]][["min_cells"]] <- 8
qc_dict[["pvnq5v_ew78kc"]][["scrublet_thresh"]] <- 0.44

qc_dict[["k8uz5b_fjwlh2"]] <- list()
qc_dict[["k8uz5b_fjwlh2"]][["min_lib_size"]] <- 1000
qc_dict[["k8uz5b_fjwlh2"]][["max_lib_size"]] <- 35000
qc_dict[["k8uz5b_fjwlh2"]][["min_n_genes"]] <- 300
qc_dict[["k8uz5b_fjwlh2"]][["max_pct_mt"]] <- 10
qc_dict[["k8uz5b_fjwlh2"]][["min_cells"]] <- 8
qc_dict[["k8uz5b_fjwlh2"]][["scrublet_thresh"]] <- 0.39

qc_dict[["qsbh45_pccb6n"]] <- list()
qc_dict[["qsbh45_pccb6n"]][["min_lib_size"]] <- 1000
qc_dict[["qsbh45_pccb6n"]][["max_lib_size"]] <- 33000
qc_dict[["qsbh45_pccb6n"]][["min_n_genes"]] <- 400
qc_dict[["qsbh45_pccb6n"]][["max_pct_mt"]] <- 10
qc_dict[["qsbh45_pccb6n"]][["min_cells"]] <- 8
qc_dict[["qsbh45_pccb6n"]][["scrublet_thresh"]] <- 0.49

qc_dict[["btlfxa_fff3je"]] <- list()
qc_dict[["btlfxa_fff3je"]][["min_lib_size"]] <- 3000
qc_dict[["btlfxa_fff3je"]][["max_lib_size"]] <- 45000
qc_dict[["btlfxa_fff3je"]][["min_n_genes"]] <- 250
qc_dict[["btlfxa_fff3je"]][["max_pct_mt"]] <- 10
qc_dict[["btlfxa_fff3je"]][["min_cells"]] <- 8
qc_dict[["btlfxa_fff3je"]][["scrublet_thresh"]] <- 0.49

# QC dictionary SP
## QC dictionary
qc_dict[["ivuznh_s8xyfv"]] <- list()
qc_dict[["ivuznh_s8xyfv"]][["min_lib_size"]] <- 500
qc_dict[["ivuznh_s8xyfv"]][["min_n_genes"]] <- 50
qc_dict[["ivuznh_s8xyfv"]][["max_pct_mt"]] <- 50
qc_dict[["ivuznh_s8xyfv"]][["min_cells"]] <- 8
qc_dict[["ivuznh_s8xyfv"]][["sample_id"]] <- id_sp_df %>% filter(gem_id == "ivuznh_s8xyfv") %>% pull(donor_id)

qc_dict[["k886qc_rqix54"]] <- list()
qc_dict[["k886qc_rqix54"]][["min_lib_size"]] <- 500
qc_dict[["k886qc_rqix54"]][["min_n_genes"]] <- 50
qc_dict[["k886qc_rqix54"]][["max_pct_mt"]] <- 50
qc_dict[["k886qc_rqix54"]][["min_cells"]] <- 8
qc_dict[["k886qc_rqix54"]][["sample_id"]] <- id_sp_df %>% filter(gem_id == "k886qc_rqix54") %>% pull(donor_id)

qc_dict[["s2yq8o_t5hk8u"]] <- list()
qc_dict[["s2yq8o_t5hk8u"]][["min_lib_size"]] <- 500
qc_dict[["s2yq8o_t5hk8u"]][["min_n_genes"]] <- 50
qc_dict[["s2yq8o_t5hk8u"]][["max_pct_mt"]] <- 50
qc_dict[["s2yq8o_t5hk8u"]][["min_cells"]] <- 8
qc_dict[["s2yq8o_t5hk8u"]][["sample_id"]] <- id_sp_df %>% filter(gem_id == "s2yq8o_t5hk8u") %>% pull(donor_id)

qc_dict[["uzntl1_fkclxp"]] <- list()
qc_dict[["uzntl1_fkclxp"]][["min_lib_size"]] <- 500
qc_dict[["uzntl1_fkclxp"]][["min_n_genes"]] <- 50
qc_dict[["uzntl1_fkclxp"]][["max_pct_mt"]] <- 50
qc_dict[["uzntl1_fkclxp"]][["min_cells"]] <- 8
qc_dict[["uzntl1_fkclxp"]][["sample_id"]] <- id_sp_df %>% filter(gem_id == "uzntl1_fkclxp") %>% pull(donor_id)


