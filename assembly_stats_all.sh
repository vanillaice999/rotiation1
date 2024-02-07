#!/bin/bash
#SBATCH --job-name=Assembly_stats_all
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=8g
#SBATCH --time=01:00:00
#SBATCH --output=/shared/home/pmyla1/slurm-%x-%j.out
#SBATCH --error=/shared/home/pmyla1/slurm-%x-%j.err

##load your bash profile so you can use conda install
source $HOME/.bash_profile

##activate your conda environment
conda activate /shared/conda/shared/

#get some basic assembly statistics on the miniasm.fasta files for pass data
assembly-stats /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/pass/miniasm_pass_long_read.fa > ./miniasm_pass.txt

#get some basic assembly statistics on the miniasm.fasta files for fail data
assembly-stats /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/fail/miniasm_fail.fa > ./miniasm_fail.txt

#get some basic assembly statistics on the miniasm.fasta files for pass and fail data
assembly-stats /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/pass_fail/pass_fail_miniasm.fa > ./miniasm_pass_fail.txt
