#!/bin/bash

# Submit one job per library, in which the job is to map the fastq files to a 
# reference with CellRanger and call the feature-barcode matrices.
project_path=$(pwd)
jobs_path="${project_path}/jobs"
cd "$jobs_path"
for dir in ./*; do
  cd "$dir"
  mnsubmit "${dir}.cmd"
  cd "$jobs_path"
done
