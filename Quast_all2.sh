#!/bin/bash
#SBATCH --job-name=quast_combined
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=8g
#SBATCH --time=5:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

#load bash profile to use conda install
source $HOME/.bash_profile

##activate your conda environment
conda activate /shared/conda/shared/

cd /workhere/students_2023/Group_1_SLY/

##quast command for the reference genome with 8 threads for the miniasm long pass assembly 
python /shared/conda/shared/bin/quast.py -t 8 --circos --report-all-metrics long_reads/minimap_results/pass/miniasm_pass_long_read.fa unicycler_output/unicycler_long/assembly.fasta unicycler_output/unicycler_short/assembly.fasta unicycler_output/unicycler_hybrid/assembly.fasta -r /workhere/students_2023/Group_1_SLY/assembly_quality_assessment/reference_data/ncbi_dataset/ncbi_dataset/data/GCA_000337315.1/GCA_000337315.1_ASM33731v1_genomic.fna -o /workhere/students_2023/Group_1_SLY/assembly_quality_assessment/combined_assessment/ -g /workhere/students_2023/Group_1_SLY/assembly_quality_assessment/reference_data/ncbi_dataset/ncbi_dataset/data/GCA_000337315.1/genomic.gff


echo "Finito"

#lastline

