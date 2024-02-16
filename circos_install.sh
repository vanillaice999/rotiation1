#!/bin/bash
#SBATCH --job-name=circos_installation
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=8g
#SBATCH --time=20:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

##load your bash profile so you can use conda install
source $HOME/.bash_profile

##activate your conda environment 
conda activate /shared/conda/shared/

#put your code below

conda install -c bioconda circos
