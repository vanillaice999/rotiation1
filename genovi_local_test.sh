#!/bin/bash
#SBATCH --job-name=genovi_test
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
conda activate genovi

cd /workhere/students_2023/Group_1_SLY/mystery_genome/genovi_gbk_files/

#test genovi run copying command from Draft genome basic tutorial
genovi -i barcode01_prokka.gbk -s draft -cs paradise --cogs_unclassified -bc white

conda deactivate

#last line
