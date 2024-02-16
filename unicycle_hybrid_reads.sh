#!/bin/bash
#SBATCH --job-name=unicycle_short_reads
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

#set up conda env
source $HOME/.bash_profile
conda activate /shared/conda/shared/


#Run unicycler for hybrid reads only
unicycler -1 /workhere/students_2023/Group_1_SLY/short_reads/H164_S1_L001_R1_001.fastq.gz -2 /workhere/students_2023/Group_1_SLY/short_reads/H164_S1_L001_R2_001.fastq.gz -l /workhere/students_2023/Group_1_SLY/long_reads/merged_long_reads/pass_merged_long_reads.fastq.gz -o /workhere/students_2023/Group_1_SLY/unicycler_output/unicycler_hybrid
 
#done!

