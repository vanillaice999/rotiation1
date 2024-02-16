#!/bin/bash
#SBATCH --job-name=busco_mystery
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=8g
#SBATCH --time=10:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

###################################
#load bash profile to use conda install
source $HOME/.bash_profile
###################################

###################################
##activate your conda environment
conda activate /shared/conda/busco/
###################################

###################################
##change directory to Group_1_SLY
cd /workhere/students_2023/Group_1_SLY/mystery_genome/busco_output/
###################################

###################################
##busco commands for barcode01 unicycler assembly
busco -f -i ../barcode01/unicycler_output/barcode01_unicycler.fasta -m genome -c 8 -l haloferacales_odb10 -o barcode01_unicycler/ --miniprot
###################################

###################################
##busco command for barcode01 Flye assembly
busco -f -i ../barcode01/flye_assembly/barcode01_flye.fasta -m genome -c 8 -l haloferacales_odb10 -o barcode01_flye/ --miniprot
###################################

###################################
##busco command for barcode09 Unicycler assembly 
busco -f -i ../barcode09/unicycler_output/barcode09_unicycler.fasta -m genome -c 8 -l haloferacales_odb10 -o barcode09_unicycler/ --miniprot
###################################

###################################
##busco command for barcode09 Flye assembly
busco -f -i ../barcode09/flye_assembly/barcode09_flye.fasta -m genome -c 8 -l haloferacales_odb10 -o barcode09_flye/ --miniprot
####################################

####################################
#busco command for barcode10 Unicycler assembly
busco -f -i ../barcode10/unicycler_output/barcode10_unicycler.fasta -m genome -c 8 -l haloferacales_odb10 -o barcode10_unicycler/ --miniprot
####################################

####################################
##busco command for barcode10 Flye assembly
busco -f -i ../barcode10/flye_assembly/barcode10_flye.fasta -m genome -c 8 -l haloferacales_odb10 -o barcode10_flye/ --miniprot
####################################

####################################
##move the short_summary.txt files from each of the folders into a new folder called busco_summary_plots
mv barcode01_unicycler/short_summary*.txt /workhere/students_2023/Group_1_SLY/mystery_genome/busco_output/busco_summary_plots/

mv barcode01_flye/short_summary*.txt /workhere/students_2023/Group_1_SLY/mystery_genome/busco_output/busco_summary_plots/

mv barcode09_unicycler/short_summary*.txt /workhere/students_2023/Group_1_SLY/mystery_genome/busco_output/busco_summary_plots/

mv barcode09_flye/short_summary*.txt /workhere/students_2023/Group_1_SLY/mystery_genome/busco_output/busco_summary_plots/

mv barcode10_unicycler/short_summary*.txt /workhere/students_2023/Group_1_SLY/mystery_genome/busco_output/busco_summary_plots/

mv barcode10_flye/short_summary*.txt /workhere/students_2023/Group_1_SLY/mystery_genome/busco_output/busco_summary_plots/
#####################################

######################################
##generate plots from the busco outputs
python3 /shared/conda/busco/bin/generate_plot.py -wd /workhere/students_2023/Group_1_SLY/mystery_genome/busco_output/busco_summary_plots/
######################################


echo "Finito!"

##done!
