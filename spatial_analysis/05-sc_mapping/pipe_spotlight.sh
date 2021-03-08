#! /bin/bash

pipe_dir='/scratch/devel/melosua/phd/projects/EPID/spatial_analysis/05-sc_mapping'

pipe_fn="$pipe_dir/pipe_spotlight_epid.pipe"
rm "$pipe_fn"
touch "$pipe_fn"

declare -A id_dict=( \
  ["uzntl1_fkclxp"]="GP027_PKLO_Palm_Diet" \
  ["k886qc_rqix54"]="GP029_PLKO_CT_Diet" \
  ["ivuznh_s8xyfv"]="GP20004_dKDCD36_CT_Diet" \
  ["s2yq8o_t5hk8u"]="GP024_dKDCD36_Palm_Diet")

for spatial in uzntl1_fkclxp k886qc_rqix54 ivuznh_s8xyfv s2yq8o_t5hk8u
do

# Get the donor id in human form
donor_id=${id_dict[${spatial}]}

r_cmd="R -e \"rmarkdown::render(\'06-sc_mapping.Rmd\', params = list(sample_id = \'$spatial\', donor_id = \'$donor_id\'), output_file=\'06-sc_mapping_$donor_id.html\')\""

printf "$spatial.decon\t$spatial\t-\t.\tn\t4:00:00\t1\t6\t.\tmodule purge; module load gsl/1.9_64 gsl/2.4 gcc/6.3.0 gmp/6.1.2 R/4.0.1 hdf5/1.10.1 PANDOC/2.8.0.1; $r_cmd\n" >> "$pipe_fn"
done
/home/devel/melosua/bin/cnag_pipeline.pl "$pipe_fn"