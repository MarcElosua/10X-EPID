#!/usr/bin/env bash

# Script to be run from where the Rmarkdown document is
set -euo pipefail

declare -A id_dict=( \
  ["qsbh45_pccb6n"]="25_Plko_Palmdiet" \
  ["k8uz5b_fjwlh2"]="25_Plko_ct_diet" \
  ["btlfxa_fff3je"]="25_shcD36_ctdiet" \
  ["pvnq5v_ew78kc"]="25_shcD36_PALM_diet")

# Normaltongue 25-PLKOControlDiet 25-shCD36ControlDiet 25-shGalControlDiet 25-PLKOPalmDiet 25-shCD36PalmDiet 25-shGalPalmDiet
# for id in yqfd3h_hpruh5 fqgqu2_e9lci4 pvnq5v_ew78kc rbz6fp_cwmqhm k8uz5b_fjwlh2 c2skal_afw18q tww1z2_j8a6ap chbcd9_r2rxcz qsbh45_pccb6n btlfxa_fff3je rxb7l3_qfjfhy
for id in qsbh45_pccb6n k8uz5b_fjwlh2 btlfxa_fff3je pvnq5v_ew78kc
do
# Get the donor id in human form
donor_id=${id_dict[${id}]}

R -e "rmarkdown::render('03-QC_common.Rmd',
                        params = list(
                          sample_id = '$id',
                          donor_id = '$donor_id'
                        ),
                        output_file='03-QC_${id}.html')"
done
