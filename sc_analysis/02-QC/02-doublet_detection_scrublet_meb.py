#####################################################################################
########################## Doublet Detection with Scrublet ##########################
#####################################################################################
# Scripts is intended to run from the directory it is save in.
# Jupyter notebook tutorial: https://github.com/AllonKleinLab/scrublet/blob/master/examples/scrublet_basics.ipynb

# Import packages
#conda activate scrublet
import numpy as np
import pandas as pd
import scipy.io
import sys
import scrublet as scr
import os
import sys
# import config_paths_qc as paths

# Initialize variables
subproject = sys.argv[1]
# subproject = "yqfd3h_hpruh5"
print(subproject)
# Common paths
path_to_matrices = "../../sc_analysis/01-cellranger/results"
path_to_save_scrublet = "2020-09-22/scrublet_scores"

# Load data
# counts_path = "{}/{}/{}/filtered_feature_bc_matrix/matrix.mtx.gz".format(paths.path_to_matrices, subproject, gem_id)
# barcodes_path = "{}/{}/{}/filtered_feature_bc_matrix/barcodes.tsv.gz".format(paths.path_to_matrices, subproject, gem_id)
counts_path = "{}/{}/outs/filtered_feature_bc_matrix/matrix.mtx.gz".format(path_to_matrices, subproject)
barcodes_path = "{}/{}/outs/filtered_feature_bc_matrix/barcodes.tsv.gz".format(path_to_matrices, subproject)
counts_matrix = scipy.io.mmread(counts_path).T.tocsc()
barcodes_df = pd.read_csv(barcodes_path, header = None)
# metadata = pd.read_csv(paths.path_to_tonsil_metadata)
print('Counts matrix shape: {} rows, {} columns'.format(counts_matrix.shape[0], counts_matrix.shape[1]))

# Initialize scrublet object
# lib_type = metadata.loc[metadata["gem_id"] == gem_id, :]["type"].values[0]
# if lib_type == "not_hashed":
expected_doublet_rate = 0.04
# elif lib_type == "hashed_cdna" or lib_type == "hashed_hto":
# expected_doublet_rate = 0.16

scrub = scr.Scrublet(counts_matrix, expected_doublet_rate = expected_doublet_rate)
doublet_scores, predicted_doublets = scrub.scrub_doublets(min_counts = 2,
min_cells = 3,
min_gene_variability_pctl = 75,
n_prin_comps = 30)


# Create data frame

scrublet_doubl_dict = {"barcodes":barcodes_df[0].values, "scrublet_doublet_scores":doublet_scores, "scrublet_predicted_doublet":predicted_doublets}
scrublet_doubl_df = pd.DataFrame(scrublet_doubl_dict)


# Save dataframe
## Create directory if it doesn't exist
if(not os.path.isdir(path_to_save_scrublet)):
  os.mkdir(Path(path_to_save_scrublet))

scrublet_doubl_df.to_csv("{}/scrublet_doublet_prediction-{}.csv".format(path_to_save_scrublet, subproject), index = False)
