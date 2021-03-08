#!/bin/bash

# module load python3/3.6.5
# Activate conda environment with the right dependencies
## Get base path
CONDA_BASE=$(conda info --base)
## reference your conda installation path
source $CONDA_BASE/etc/profile.d/conda.sh
## Activate conda
conda activate spaceranger

# Set common parameters
project="EPID_27"
pipe_fn="EPID_27_pipe.cmd"

# Create pipefile to append pipe commands
rm -r $pipe_fn
touch $pipe_fn

# Copy the fastq symbolic links to the project
python3 2-copy_lims_files_spaceranger.py info.txt ../projects ../data/sample_id.txt

# uzntl1_fkclxp k886qc_rqix54 ivuznh_s8xyfv s2yq8o_t5hk8u
for id in uzntl1_fkclxp
do
  # printf "python 3-make_spaceranger.py --spaceranger /scratch/devel/melosua/phd/10x_software/spaceranger-1.1.0 --subproject BCLLATLAS_32 --reference_path /scratch/devel/melosua/phd/10x_software/refdata-gex-GRCh38-2020-A/ --gem_id {$id} --metadata ../data/sample_id.txt\n"
  
  # 3-make_spaceranger.py writes a bash script ready to launch a job to the cluster
  python3 3-make_spaceranger.py \
    --spaceranger /scratch/groups/hheyn/software/spaceranger/1.1.0/spaceranger \
    --subproject EPID_27 \
    --reference_path /scratch/groups/hheyn/data/reference/refdata-gex-GRCh38-and-mm10-2020-A \
    --gem_id $id \
    --metadata ../data/sample_id.txt \
  
  # Give execution permission to the file  
  chmod 755 ../projects/$project/jobs/$id/$id.cmd
  
  # Send job to the cluster
  printf "$id.spaceranger\t$id\t-\t.\tn\t08:00:00\t1\t8\t.\tmodule purge; ./../projects/$project/jobs/$id/$id.cmd\n" >> "$pipe_fn"
    
done

/home/devel/melosua/bin/cnag_pipeline.pl "$pipe_fn"
