#!/bin/bash
#SBATCH --job-name=unicycle_long_reads
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=20g
#SBATCH --time=24:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

#set up conda env
source $HOME/.bash_profile
conda activate /shared/conda/shared/

#Run unicycler for PASS long reads only
unicycler -l /workhere/students_2023/Group_1_SLY/long_reads/merged_long_reads/pass_merged_long_reads.fastq.gz -o /workhere/students_2023/Group_1_SLY/unicycler_output/unicycler_long

#done!

