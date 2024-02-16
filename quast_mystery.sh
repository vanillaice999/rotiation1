#!/bin/bash
#SBATCH --job-name=quast_mystery
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=10g
#SBATCH --time=10:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

##########################
#load bash profile
source $HOME/.bash_profile
##########################

#################################
##activate your conda environment
conda activate /shared/conda/shared/
#################################

######################################
##change directory to mystery_genome
cd /workhere/students_2023/Group_1_SLY/mystery_genome/
#######################################

###################################################
##quast command comparing barcode01, barcode09, and barcode10 unicycler assemblies with: 8 threads, report all metrics
python /shared/conda/shared/bin/quast.py -t 8 --circos --report-all-metrics barcode01/unicycler_output/barcode01_unicycler.fasta barcode09/unicycler_output/barcode09_unicycler.fasta barcode10/unicycler_output/barcode10_unicycler.fasta -o quast_output/all_barcodes/
######################################################

#########################################################
##compare barcode09 unicycler assembly to the barcode09 miniasm and the barcode09 flye assembly compared to the H. volcanii reference genome 
python /shared/conda/shared/bin/quast.py -t 8 --circos --report-all-metrics --gene-finding barcode09/barcode09_miniasm/barcode09_miniasm.fasta barcode09/unicycler_output/barcode09_unicycler.fasta barcode09/flye_assembly/barcode09_flye.fasta -r h_volcanii_reference/ncbi_dataset_volcanii/data/GCF_000025685.1/GCF_000025685.1_ASM2568v1_genomic.fna -o quast_output/barcode09_quast_all/
#########################################################

##########################################################
##quast command to compare the barcode01 unicycler and flye assemblies
python /shared/conda/shared/bin/quast.py -t 8 --circos --report-all-metrics barcode01/unicycler_output/barcode01_unicycler.fasta barcode01/flye_assembly/barcode01_flye.fasta -o quast_output/barcode01_flye_vs_unicycler/
##########################################################

##########################################################
##quast command to compare the barcode01 unicycler and flye assemblies vs the H. mediterranei reference
#python /shared/conda/shared/bin/quast.py -t 8 --circos --report-all-metrics barcode01/unicycler_output/barcode01_unicycler.fasta barcode01/flye_assembly/barcode01_flye.fasta -r h_mediterranei_reference/ncbi_dataset_mediterranei/data/GCF_005406325.1/GCF_005406325.1_ASM540632v1_genomic.fna -o quast_output/barcode01_flye_vs_unicycler_vs_mediterranei
########################################################

###########################################################
##quast command to compare the barcode10 unicycler and flye assemblies - use H_mediterranei reference
python /shared/conda/shared/bin/quast.py -t 8 --circos --report-all-metrics --gene-finding barcode10/unicycler_output/assembly.fasta barcode10/flye_assembly/assembly.fasta -r h_mediterranei_reference/ncbi_dataset_mediterranei/data/GCF_005406325.1/GCF_005406325.1_ASM540632v1_genomic.fna -o quast_output/barcode10_flye_vs_unicycler/
#########################################################

#######################################################
##quast command to compare the H. volcanii reference and the H. mediterranei reference to barcode01 flye assembly and the barcode01 unicycler assembly
#python /shared/conda/shared/bin/quast.py -t 8 --circos --report-all-metrics barcode01/flye_assembly/barcode01_flye.fasta barcode01/unicycler_output/barcode01_unicycler.fasta -r h_mediterranei_reference/ncbi_dataset_mediterranei/data/GCF_005406325.1/GCF_005406325.1_ASM540632v1_genomic.fna h_volcanii_reference/ncbi_dataset_volcanii/data/GCF_000025685.1/GCF_000025685.1_ASM2568v1_genomic.fna -o quast_output/barcode01_assemblies_vs_reference/
####################################################


echo "Finito!"

##done!
