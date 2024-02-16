#!/bin/bash
#SBATCH --job-name=unicycle_long_reads
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=20g
#SBATCH --time=62:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

######################################
##set up conda env
###################################
source $HOME/.bash_profile
conda activate /shared/conda/shared/

######################################
##change directory to mystery_genome
cd /workhere/students_2023/Group_1_SLY/mystery_genome/

#############################################
##First merge each of the long read data
############################################

#barcode 01 merge
cat barcode01/PAH51710*.gz > barcode01/barcode01_merged.fastq.gz

#barcode 09 merge
cat barcode09/PAH51710*.gz > barcode09/barcode09_merged.fastq.gz

#barcode 10 merge
cat barcode10/PAH51710*.gz > barcode10/barcode10_merged.fastq.gz

#############################################
## Nanoplot for analysis of quality of the long reads
############################################
# barcode 01
NanoPlot --fastq barcode01/barcode01_merged.fastq.gz -t 8 --loglength --color orange --plots kde --N50 --tsv_stats -o barcode01/nanoplot_output/

# barcode 09
NanoPlot --fastq barcode09/barcode09_merged.fastq.gz -t 8 --loglength --color orange --plots kde --N50 --tsv_stats -o barcode09/nanoplot_output/

# barcode 10
NanoPlot --fastq barcode10/barcode10_merged.fastq.gz -t 8 --loglength --color orange --plots kde --N50 --tsv_stats -o barcode10/nanoplot_output/

##########################################
#Run unicycler for all merged long reads
#########################################
#barcode 01
unicycler -l /workhere/students_2023/Group_1_SLY/mystery_genome/barcode01/barcode01_merged.fastq.gz -o /workhere/students_2023/Group_1_SLY/mystery_genome/barcode01/unicycler_output/

#barcode 09
unicycler -l /workhere/students_2023/Group_1_SLY/mystery_genome/barcode09/barcode09_merged.fastq.gz -o /workhere/students_2023/Group_1_SLY/mystery_genome/barcode09/unicycler_output/

#barcode 10
unicycler -l /workhere/students_2023/Group_1_SLY/mystery_genome/barcode10/barcode10_merged.fastq.gz -o /workhere/students_2023/Group_1_SLY/mystery_genome/barcode10/unicycler_output/


echo "finished!"

#done!

