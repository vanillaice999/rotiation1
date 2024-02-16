#!/bin/bash
#SBATCH --job-name=quast_miniasm_pass_unicycler_short_long
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=20g
#SBATCH --time=36:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

#load bash profile to use conda install
source $HOME/.bash_profile

##activate your conda environment
conda activate /shared/conda/shared/

##quast command for the reference genome with 8 threads for the miniasm long pass assembly 
python /shared/conda/shared/bin/quast.py -t 8 --labels --circos --report-all-metrics /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/pass/miniasm_pass_long_read.fa -r /workhere/students_2023/Group_1_SLY/assembly_quality_assessment/reference_data/ncbi_dataset/ncbi_dataset/data/GCA_000337315.1/GCA_000337315.1_ASM33731v1_genomic.fna -o /workhere/students_2023/Group_1_SLY/assembly_quality_assessment/minimap_long_pass_assessment/

##for the long read unicycler assembly
python /shared/conda/shared/bin/quast.py -t 8 --labels --circos --report-all-metrics /workhere/students_2023/Group_1_SLY/unicycler_output/unicycler_long/assembly.fasta -r /workhere/students_2023/Group_1_SLY/assembly_quality_assessment/reference_data/ncbi_dataset/ncbi_dataset/data/GCA_000337315.1/GCA_000337315.1_ASM33731v1_genomic.fna -o /workhere/students_2023/Group_1_SLY/assembly_quality_assessment/unicycle_long_assessment/


##for the short read unicycle
python /shared/conda/shared/bin/quast.py -t 8 --labels --circos --report-all-metrics /workhere/students_2023/Group_1_SLY/unicycler_output/unicycler_short/assembly.fasta -r /workhere/students_2023/Group_1_SLY/assembly_quality_assessment/reference_data/ncbi_dataset/ncbi_dataset/data/GCA_000337315.1/GCA_000337315.1_ASM33731v1_genomic.fna -o /workhere/students_2023/Group_1_SLY/assembly_quality_assessment/unicycle_short_assessment/

##for the hybrid unicycler assembly
python /shared/conda/shared/bin/quast.py -t 8 --labels --circos --report-all-metrics /workhere/students_2023/Group_1_SLY/unicycler_output/unicycler_hybrid/assembly.fasta -r /workhere/students_2023/Group_1_SLY/assembly_quality_assessment/reference_data/ncbi_dataset/ncbi_dataset/data/GCA_000337315.1/GCA_000337315.1_ASM33731v1_genomic.fna -o /workhere/students_2023/Group_1_SLY/assembly_quality_assessment/unicycle_hybrid_assessment/
