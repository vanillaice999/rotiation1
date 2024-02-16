#!/bin/bash
#SBACTH --job-name=flye_assembly
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=20g
#SBATCH --time=10:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err 

###########################
##load your bash profile so you can use conda install
source $HOME/.bash_profile
###########################

####################################
##activate your conda environment 
conda activate /shared/conda/shared/
####################################

###################################
##change working directory to mystery_genome folder
cd /workhere/students_2023/Group_1_SLY/mystery_genome/
###################################

#####################################
##barcode01 flye assembly 
#flye -t 8 --nano-raw barcode01/barcode01_merged.fastq.gz --genome-size 4m --out-dir barcode01/flye_assembly/
######################################

####################################
##barcode09 flye assembly
#flye -t 8 --nano-raw barcode09/barcode09_merged.fastq.gz --genome-size 4m --out-dir barcode09/flye_assembly/
###################################

##################################
##barcode10 flye assembly
#flye -t 8 --nano-raw barcode10/barcode10_merged.fastq.gz --genome-size 4m --out-dir barcode10/flye_assembly/
################################

##################################
##assembly statistics on all 3 assemblies

#barcode01
assembly-stats barcode01/flye_assembly/barcode01_flye.fasta barcode09/flye_assembly/barcode09_flye.fasta barcode10/flye_assembly/barcode10_flye.fasta > assembly_stats/flye_stats_all.txt
##################################

echo "Done!"

#lastline

