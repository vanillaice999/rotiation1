#!/bin/bash
#SBATCH --job-name=genovi
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=10g
#SBATCH --time=10:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

####################################
##load bash profile to use conda install
source $HOME/.bash_profile
####################################

###################################
##activate your conda environment
conda activate /shared/conda/genovi/
#################################

#################################
##change directory to genovi_gbk_files
cd /workhere/students_2023/Group_1_SLY/mystery_genome/genovi_gbk_files/
################################

################################
##genovi commands for barcode01, cs = colour scheme, -te = track explain, -s = status,
genovi -i barcode01_prokka.gbk -s draft -o ./barcode01_genovi_new --size -cs autumn -te 
##############################

################################
##for barcode09 using status = draft 
genovi -i barcode09_prokka.gbk -s draft -o ./barcode09_genovi_new --size -cs autumn -te
###############################

################################
##for barcode10 using status = draft
genovi -i barcode10_prokka.gbk -s draft -o ./barcode10_genovi_new --size -cs autumn -te
###############################

echo "Finished :))"

##last line 
