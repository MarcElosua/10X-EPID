#!/bin/bash

# Removes the temporary files of cellranger's output
project_path=$(pwd)
jobs_path="${project_path}/jobs"
cd "$jobs_path"
for dir in ./*; do
    rm -r "${dir}/${dir}/SC_RNA_COUNTER_CS"
done
