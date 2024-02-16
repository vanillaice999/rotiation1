#!/bin/bash
#SBATCH --job-name=busco
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=10g
#SBATCH --time=10:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

###########################
##activate bash profile
source $HOME/.bash_profile
############################

##################################
##activate conda environment
conda activate /shared/conda/busco/
####################################

###################################################
##change directory to the busco_output directory 
cd /workhere/students_2023/Group_1_SLY/busco_output/ 
################################################### 

###############################################################################
##for the hybrid unicycler assembly because this is the most complete assembly
busco -i /workhere/students_2023/Group_1_SLY/unicycler_output/unicycler_hybrid/assembly.fasta -m genome -c 8 -l haloferacales_odb10 -o busco_uni_hybrid

#############################################################################
##busco commands for the long unicycler assembly
busco -i /workhere/students_2023/Group_1_SLY/unicycler_output/unicycler_long/assembly.fasta -m genome -c 8 -l haloferacales_odb10 -o busco_uni_long

############################################################################
##busco commands for unicycler short assembly
busco -i /workhere/students_2023/Group_1_SLY/unicycler_output/unicycler_short/assembly.fasta -m genome -c 8 -l haloferacales_odb10 -o busco_uni_short

#############################################################################
##busco commands for miniasm long assembly
#busco -i /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/pass/miniasm_pass_long_reads.fa -m genome -c 8 -l haloferacales_odb10 -o busco_mini_long
###########################################################################

########################################################################
##move the short_summary.txt files for the 3 assemblies into a new directory called busco_plots
mv busco_uni_hybrid/short_summary*.txt /workhere/students_2023/Group_1_SLY/busco_output/busco_plots/
#######################################################################
mv busco_uni_long/short_summary*.txt /workhere/students_2023/Group_1_SLY/busco_output/busco_plots/
######################################################################
mv busco_uni_short/short_summary*.txt /workhere/students_2023/Group_1_SLY/busco_output/busco_plots/
######################################################################

#######################################################################
##make a plot of the busco data 
python3 /shared/conda/busco/bin/generate_plot.py -wd /workhere/students_2023/Group_1_SLY/busco_output/busco_plots/
####################################################################


echo "Finished :))"

##lastline


