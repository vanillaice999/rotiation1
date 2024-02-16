#!/bin/bash
#SBATCH --job-name=pass_fail_long_reads_merge
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=8g
#SBATCH --time=01:00:00
#SBATCH --output=/shared/home/pmyla1/slurm-%x-%j.out
#SBATCH --error=/shared/home/pmyla1/slurm-%x-%j.err 

##merge the pass and fail long reads into one file  
cd /workhere/students_2023/Group_1_SLY/long_reads/

cat /workhere/students_2023/Group_1_SLY/long_reads/barcode01/FAQ09231_pass_barcode01_a6a5014a_*.fastq.gz /workhere/students_2023/Group_1_SLY/long_reads/barcode01_fail/FAQ09231_fail_barcode01_a6a5014a_0.fastq.gz > pass_fail_merged_long_reads.fastq.gz 
