#!/bin/bash
#SBATCH --job-name=minimap2_barcode09
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=10g
#SBATCH --time=10:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err 

#####################################
##load your bash profile so you can use conda install
source $HOME/.bash_profile
####################################

###################################
##activate your conda environment
conda activate /shared/conda/shared/
###################################

##################################
##change working directory to mystery_genome
cd /workhere/students_2023/Group_1_SLY/mystery_genome/
#################################

###################################
##minimap2 command to produce a barcode09 assembly because the unicycler assembly was poor
#minimap2 -t 8 -x ava-ont barcode09/barcode09_merged.fastq.gz barcode09/barcode09_merged.fastq.gz | gzip -1 > barcode09/barcode09_miniasm/barcode09_assembly.paf.gz
##################################

##################################
##miniasm command on the merged fastq.gz file and the assembly.paf.gz to produce a miniasm.gfa file
#miniasm -f barcode09/barcode09_merged.fastq.gz barcode09/barcode09_miniasm/barcode09_assembly.paf.gz > barcode09/barcode09_miniasm/barcode09_miniasm.gfa
##################################

########################################
##convert barcode09 miniasm assembly to fasta with awk command
#awk '/^S/{print ">"$2"\n"$3}' barcode09/barcode09_miniasm/barcode09_miniasm.gfa > barcode09/barcode09_miniasm/barcode09_miniasm.fasta
#######################################

##################################
##calculate assembly stats for the minimap2/miniasm assembly of barcode09
#assembly-stats barcode09/barcode09_miniasm/barcode09_miniasm.fasta > assembly_stats/barcode09_miniasm_stats.txt
##################################

echo "Finished!"

##lastline
