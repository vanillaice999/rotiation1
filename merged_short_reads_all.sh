#!/bin/bash
#SBATCH --job-name=R1_merge_reads
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=8g
#SBATCH --time=02:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

#merge short reads into one file by changing directory
cd /workhere/students_2023/Group_1_SLY/short_reads/

#concatenate R1 (forward) fastq.gz files using cat
cat /workhere/students_2023/Group_1_SLY/short_reads/H164_S1_L00*_R1_001.fastq.gz > ./merged_short_reads_R1.fastq.gz

#concatenate R2 (reverse) short reads fastq.gz files using cat
cat /workhere/students_2023/Group_1_SLY/short_reads/H164_S1_L00*_R2_001.fastq.gz > ./merged_short_reads_R2.fastq.gz

#end file

