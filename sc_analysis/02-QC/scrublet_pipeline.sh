#!/bin/bash

# module load python3/3.6.5
# Activate conda environment with the right dependencies
## Get base path
CONDA_BASE=$(conda info --base)
## reference your conda installation path
source $CONDA_BASE/etc/profile.d/conda.sh
## Activate conda
# conda create -n scrublet python=3.6 numpy pandas
# conda activate scrublet
# conda install -c bioconda scipy scrublet 
conda activate scrublet

# Set common parameters
project="EPID_27"

# Normaltongue 25-PLKOControlDiet 25-PLKOPalmDiet 25-shCD36ControlDiet 25-shCD36PalmDiet 25-shGalControlDiet 25-shGalPalmDiet
for id in yqfd3h_hpruh5 fqgqu2_e9lci4 pvnq5v_ew78kc rbz6fp_cwmqhm k8uz5b_fjwlh2 c2skal_afw18q tww1z2_j8a6ap chbcd9_r2rxcz qsbh45_pccb6n btlfxa_fff3je rxb7l3_qfjfhy
do
  python 02-doublet_detection_scrublet_meb.py $id
done
