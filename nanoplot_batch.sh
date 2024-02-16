#!/bin/bash
#SBATCH --job-name=nanoplot_sam
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=8g
#SBATCH --time=01:00:00
#SBATCH --output=/shared/home/mbysh17/slurm-%x-%j.out
#SBATCH --error=/shared/home/mbysh17/slurm-%x-%j.err
#get name of input file

cd /workhere/students_2023/Group_1_SLY/long_reads/

#activate conda environment
source $HOME/.bash_profile
conda activate /shared/conda/shared

#module purge
#module load biocontainers
#module load nanoplot

#this command produced the nanoplot report with the summary stats and graphs for the long_read data
NanoPlot --fastq /workhere/students_2023/Group_1_SLY/long_reads/barcode01/FAQ09231_pass_barcode01_a6a5014a_?.fastq.gz --plots kde --N50


#deactivate conda environment
conda deactivate

