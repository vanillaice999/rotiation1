#!/bin/bash
#SBATCH --job-name=prokka+genovi
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=12g
#SBATCH --time=10:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

####################################
##load bash profile to use conda install
source $HOME/.bash_profile
####################################

###################################
##activate your conda environment
conda activate /shared/conda/shared/
####################################

##################################
##change directory to mystery_genome
cd /workhere/students_2023/Group_1_SLY/mystery_genome/
##################################3

###################################
##prokka on barcode01 specifying the kingdom and genus
prokka --kingdom Archaea --genus Haloferax barcode01/unicycler_output/barcode01_unicycler.fasta --force --outdir barcode01/prokka_output_01 --prefix barcode01_prokka --locustag barcode01 --proteins --usegenus --addgenes
##################################

##################################
##prokka on barcode09
prokka --kingdom Archaea --genus Haloferax --species volcanii barcode09/flye_assembly/barcode09_flye.fasta --force --outdir barcode09/prokka_output_09 --prefix barcode09_prokka --locustag barcode09 --proteins --usegenus --addgenes
##################################

##################################
##prokka on barcode10
prokka --kingdom Archaea --genus Haloferax --species mediterranei barcode10/unicycler_output/barcode10_unicycler.fasta --force --outdir barcode10/prokka_output_10 --prefix barcode10_prokka --locustag barcode10 --proteins --usegenus --addgenes
###################################

##################################
##deactivate old conda environment
conda deactivate
#################################

#################################
##activate genovi environment
conda activate genovi 
################################

##################################
##change working directory to genovi_output
cd /workhere/students_2023/Group_1_SLY/mystery_genome/genovi_output/
#################################

################################
##genovi commands for barcode01, cs = colour scheme, -te = track explain, -s = status,
genovi -i /workhere/students_2023/Group_1_SLY/mystery_genome/genovi_gbk_files/barcode01_prokka.gbk -cs autumn --size -te -s draft -o barcode01_test
###############################

################################
##for barcode09
genovi -i /workhere/students_2023/Group_1_SLY/mystery_genome/genovi_gbk_files/barcode09_prokka.gbk --size -cs autumn -te -o barcode09_test -s draft
###############################

################################
##for barcode10
genovi -i /workhere/students_2023/Group_1_SLY/mystery_genome/genovi_gbk_files/barcode10_prokka.gbk --size -cs autumn -te -o barcode10_test -s draft
##############################

echo "Finished :))"

##last line 

