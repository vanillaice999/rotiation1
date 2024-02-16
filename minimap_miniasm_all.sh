#!/bin/bash
#SBATCH --job-name=minimap2_miniasm
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=20g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/home/pmyla1/workhere/students_2023/Group_1_SLY/slurm_OandE/slurm-%x-%j.out
#SBATCH --error=/shared/home/pmyla1/workhere/students_2023/Group_1_SLY/slurm_OandE/slurm-%x-%j.err

#load bash profile to use conda install
source $HOME/.bash_profile

##activate your conda environment
conda activate /shared/conda/shared/

##minimap command on pass data
minimap2 -t 8 -x ava-ont /workhere/students_2023/Group_1_SLY/long_reads/merged_long_reads/pass_merged_long_reads.fastq.gz /workhere/students_2023/Group_1_SLY/long_reads/merged_long_reads/pass_merged_long_reads.fastq.gz | gzip -1 > /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/pass/minimap_long_read_pass_assembly.paf.gz

#minimap2 command for the pass and fail data
minimap2 -t 8 -x ava-ont /workhere/students_2023/Group_1_SLY/long_reads/merged_long_reads/pass_fail_merged_long_reads.fastq.gz /workhere/students_2023/Group_1_SLY/long_reads/merged_long_reads/pass_fail_merged_long_reads.fastq.gz | gzip -1 > /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/pass_fail/minimap_pass_fail_long_read_assembly.paf.gz 

#minimap command for the fail data
minimap2 -t 8 -x ava-ont /workhere/students_2023/Group_1_SLY/long_reads/merged_long_reads/fail_merged_long_reads.fastq.gz /workhere/students_2023/Group_1_SLY/long_reads/merged_long_reads/fail_merged_long_reads.fastq.gz | gzip -1 > /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/fail/minimap_fail.paf.gz

#use miniasm on the fastq.gz file for the pass merged long reads
miniasm -f /workhere/students_2023/Group_1_SLY/long_reads/merged_long_reads/pass_merged_long_reads.fastq.gz /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/pass/minimap_long_read_pass_assembly.paf.gz > /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/pass/miniasm_pass_long_read.gfa

#use miniasm on the fastq.gz file for the pass and failed merged long reads
miniasm -f /workhere/students_2023/Group_1_SLY/long_reads/merged_long_reads/pass_fail_merged_long_reads.fastq.gz /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/pass_fail/minimap_pass_fail_long_read_assembly.paf.gz > /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/pass_fail/pass_fail_miniasm.gfa

#use miniasm on the fastq.gz file for the failed long reads
miniasm -f /workhere/students_2023/Group_1_SLY/long_reads/merged_long_reads/fail_merged_long_reads.fastq.gz /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/fail/minimap_fail.paf.gz > /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/fail/miniasm_fail.gfa
