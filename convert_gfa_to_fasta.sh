#!/bin/bash
#SBATCH --job-name=convert_gfa_to_fasta
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=8g
#SBATCH --time=10:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err 

##load your bash profile so you can use conda install
source $HOME/.bash_profile

##activate your conda environment 
conda activate /shared/conda/shared/


#change directory
cd /workhere/students_2023/Group_1_SLY/long_reads/minimap_results/
#commands to convet gfa to fasta

#pass
awk '/^S/{print ">"$2"\n"$3}' pass/miniasm_pass_long_read.gfa > pass/miniasm_pass_long_read.fa

#pass_fail
awk '/^S/{print ">"$2"\n"$3}' pass_fail/pass_fail_miniasm.gfa > pass_fail/pass_fail_miniasm.fa

#fail
awk '/^S/{print ">"$2"\n"$3}' fail/miniasm_fail.gfa > fail/miniasm_fail.fa

#done!
