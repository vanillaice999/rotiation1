#!/bin/bash
#SBATCH --job-name=Assembly_stats_mystery
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=10g
#SBATCH --time=02:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

##load your bash profile so you can use conda install
source $HOME/.bash_profile

##activate your conda environment
conda activate /shared/conda/shared/

#get some basic assembly statistics on the barcode01 assembly
assembly-stats /workhere/students_2023/Group_1_SLY/mystery_genome/barcode01/unicycler_output/assembly.fasta > /workhere/students_2023/Group_1_SLY/mystery_genome/assembly_mystery_stats/barcode01_assembly_stats.txt

#get some basic assembly statistics on the barcode09 assembly
assembly-stats /workhere/students_2023/Group_1_SLY/mystery_genome/barcode09/unicycler_output/assembly.fasta > /workhere/students_2023/Group_1_SLY/mystery_genome/assembly_mystery_stats/barcode09_assembly_stats.txt

#get some basic assembly statistics on the barcode10 assembly
assembly-stats /workhere/students_2023/Group_1_SLY/mystery_genome/barcode10/unicycler_output/assembly.fasta > /workhere/students_2023/Group_1_SLY/mystery_genome/assembly_mystery_stats/barcode10_assembly_stats.txt

echo "Finished"

##lastline!
