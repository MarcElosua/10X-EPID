#!/usr/bin/env bash

# Script to be run from where the Rmarkdown document is
set -euo pipefail

declare -A id_dict=( \
  ["uzntl1_fkclxp"]="GP027_PKLO_Palm_Diet" \
  ["k886qc_rqix54"]="GP029_PLKO_CT_Diet" \
  ["ivuznh_s8xyfv"]="GP20004_dKDCD36_CT_Diet" \
  ["s2yq8o_t5hk8u"]="GP024_dKDCD36_Palm_Diet")

for id in ivuznh_s8xyfv k886qc_rqix54 s2yq8o_t5hk8u uzntl1_fkclxp
do
# Get the donor id in human form
donor_id=${id_dict[${id}]}
R -e "rmarkdown::render('02-QC_common.Rmd',
                        params = list( 
                          sample_id = '$id'
                        ),
                        output_file='02-QC_${donor_id}.html')"
done

