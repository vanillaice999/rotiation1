#!/bin/bash
#SBATCH --job-name=genovi
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=6g
#SBATCH --time=1:00:00
#SBATCH --output=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.out
#SBATCH --error=/workhere/students_2023/Group_1_SLY/public_slurm_oande/slurm-%x-%j.err

##load your bash profile so you can use conda install
source $HOME/.bash_profile


conda env remove --name genovi

conda create -n genovi python=3.7 circos

conda activate genovi

pip install genovi

cd /workhere/students_2023/Group_1_SLY/mystery_genome/genovi_gbk_files

#genovi -i barcode01_prokka.gbk -s draft -cs paradise --cogs_unclassified -bc white -o barcode01_output_test

#genovi -i barcode09_prokka.gbk -s draft -cs paradise --cogs_unclassified -bc white -o barcode09_output_test

#genovi -i barcode10_prokka.gbk -s draft -cs paradise --cogs_unclassified -bc white -o barcode10_output_test

#put your code below
########try a line for complete - displays all contigs as separate files --size to include the size
#for barcode01
genovi -i barcode01_prokka.gbk -cs strong -s complete --size --title 'filename' -o barcode01_complete

#for barcode09
genovi -i barcode09_prokka.gbk -cs strong -s complete --size --title 'filename' -o barcode09_complete

#for barcode10
genovi -i barcode10_prokka.gbk -cs strong -s complete --size --title 'filename' -o barcode10_complete
