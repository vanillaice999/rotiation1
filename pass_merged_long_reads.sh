#!/bin/bash
#SBATCH --job-name=merged_long_reads
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=8g
#SBATCH --time=01:00:00
#SBATCH --output=/shared/home/mbysh17/slurm-%x-%j.out
#SBATCH --error=/shared/home/mbysh17/slurm-%x-%j.err

#merge long reads into one file 
cd /workhere/students_2023/Group_1_SLY/long_reads/barcode01/

#merge the long reads
cat /workhere/students_2023/Group_1_SLY/long_reads/barcode01/FAQ09231_pass_barcode01_a6a5014a_*.fastq.gz > merged_long_reads.fastq.gz

