# This script initializes the filesystem of this project:
# It creates a "jobs" folder which contains as many subdirectories as samples it has
# For each sample directory, it creates the following files/folders:
# 1. fastq: dir with the symlinks pointing to the fastq files (2 links, as it is pair-end)
# 2. output: dir which contains the files with the (1) standard output and (2) standard error of cellranger
# 3. (sample_id).cmd: job script to compute the features-barcode matrix using cellranger

# Import required packages
import numpy as np
import pandas as pd
import os
import argparse
import subprocess

# Read the lims output table 
lims = pd.read_csv("info.txt", sep = "\t", header = 0)
print("Successfully read!")
print(lims.head())

# Define command-line arguments
parser = argparse.ArgumentParser(description = "options to initialize the filesystem and scripts of this project")
parser.add_argument("-r", "--reference",
		    dest = "reference",
		    action = "store",
		    default = None,
		    help = "Reference genome to use (human or mouse")
options = parser.parse_args()

# Define important paths and directories
fastq_path = "/scratch/project/production/fastq"
reference = options.reference
if reference == "human":
    ref_path = "/scratch/groups/hheyn/data/reference/refdata-gex-GRCh38-2020-A/"
elif reference == "mouse":
    ref_path = "/scratch/groups/hheyn/data/reference/refdata-gex-mm10-2020-A/"
if not os.path.exists("jobs"):
    os.mkdir("jobs")
print("Reference path is {}".format(ref_path)) 

# Create cellranger-friendly symmlinks to fastq files
lims["SampleName"] = lims["SampleName"].str.replace(' ', '')
sample_ids = np.unique(lims["SampleName"])
print(sample_ids)
for iden in sample_ids:

    print("Current library is {}".format(iden))
 
    # Define and create directories
    cwd = os.getcwd()
    jobs_dir = "{}/jobs/{}".format(cwd, iden)
    fastq_dir = "{}/fastq/".format(jobs_dir)
    output_dir = "{}/output".format(jobs_dir)
    dirs_to_create = [jobs_dir, fastq_dir, output_dir]
    print("The directories to create are {}".format(dirs_to_create))
    for new_dir in dirs_to_create:
        if not os.path.exists(new_dir):
            os.mkdir(new_dir) 
    bool_mask = (lims["SampleName"] == iden) & (lims["libraryPassFail"] == "pass") & (lims["LanePassFail"] == "pass")
    print(bool_mask)
    lims_sub = lims.loc[bool_mask]
    print(lims_sub)
    library = lims_sub.loc[lims_sub.index[0], "library"]
    index = lims_sub.loc[lims_sub.index[0], "index"]

    # Fastq files are under /project/production/fastq/FC/Lane/fastq/FC_Lane_Index_1/2.fastq.gz
    # The CellRanger convention establishes that the symlinks should be named: lib_S1_L00(Lane)_R1/2_001.fastq.gz
    count_id = lims_sub.shape[0]
    print("The variable count_id = {}".format(count_id))
    print(lims_sub["library"])
    print("The variable iden = {}".format(iden))
    if count_id > 1:
        # Concatenates fastq files from same sample but in different flow cells and/or lanes
        fc_lane_list = [(lims_sub["flowcell"][x], lims_sub["lane"][x]) for x in lims_sub.index]
        print(fc_lane_list)
        fastq_path_list_r1 = ["{}/{}/{}/fastq/{}_{}_{}_1.fastq.gz".format(fastq_path, fc, lane, fc, lane, index) for fc, lane in fc_lane_list]
        print(fastq_path_list_r1)
        fastq_path_list_r2 = ["{}/{}/{}/fastq/{}_{}_{}_2.fastq.gz".format(fastq_path, fc, lane, fc, lane, index) for fc, lane in fc_lane_list]
        fastq_path_list_r1.insert(0, "cat")
        fastq_path_list_r2.insert(0, "cat")
        print(fastq_path_list_r1)
        subprocess.run(fastq_path_list_r1, stdout = open("{}/{}_S1_L001_R1_001.fastq.gz".format(fastq_dir, iden), "w"))
        subprocess.run(fastq_path_list_r2, stdout = open("{}/{}_S1_L001_R2_001.fastq.gz".format(fastq_dir, iden), "w"))
    else:
        # As this sample is only present in one flowcell and lane, there is no need to concatenate fastq
        # Create symlinks
        fc = lims_sub["flowcell"].values[0]
        lane = lims_sub["lane"].values[0]
        fastq_path_r1 = "{}/{}/{}/fastq/{}_{}_{}_1.fastq.gz".format(fastq_path, fc, lane, fc, lane, index)
        fastq_path_r2 = "{}/{}/{}/fastq/{}_{}_{}_2.fastq.gz".format(fastq_path, fc, lane, fc, lane, index)    
        subprocess.run(["ln", "-s", fastq_path_r1, "{}/{}_S1_L001_R1_001.fastq.gz".format(fastq_dir, iden)])
        subprocess.run(["ln", "-s", fastq_path_r2, "{}/{}_S1_L001_R2_001.fastq.gz".format(fastq_dir, iden)])  
    
    # Create job script with the call to cellranger
    job_script_file = open("{}/{}.cmd".format(jobs_dir, iden), "w")
    job_script = """#!/bin/bash 

# @ initialdir = . 
# @ error = ./output/{}.err 
# @ output = ./output/{}.out 
# @ cpus_per_task = 12 
# @ wall_clock_limit = 16:00:00 

module load PYTHON/2.7.5 
module load lims/1.2 

/scratch/groups/hheyn/software/cellranger/4.0.0/cellranger count --fastqs {} --id {} --chemistry SC3Pv3 --expect-cells 5000 --localcores 8 --localmem 64 --sample {} --transcriptome {};
    """.format(iden, iden, fastq_dir, iden, iden, ref_path)
    job_script_file.write(job_script)
    job_script_file.close()
