# Introduction of .sh file

## File Merging
merging the reads file
### pass_merged_long_reads.sh
merge long reads into one file with cat
### merged_short_reads_all.sh
Keep R1 and R2 in separate files

## unicycler assembly
Make some assembly with unicycler
### unicycle_long_reads.sh
Make assembly of long reads with unicycler
### unicycle_short_reads.sh
Make assembly of short reads with unicycler
### unicycle_hybrid_reads.sh
Make assembly of hybrid reads with unicycler

## quast on the assemblies

### Quast_all.sh
introduction
### Quast_all2.sh
introduction
### quast_mystery.sh
introduction

## Busco

### busco_mystery.sh
introduction
### busco_mystery.sh
introduction

## Genovi

### genovi_lastest.sh
introduction

# Environnment
* Linux or macOS
* [Python](https://www.python.org/) 3.4 or later
* C++ compiler with C++14 support:
    * [GCC](https://gcc.gnu.org/) 4.9.1 or later
    * [Clang](http://clang.llvm.org/) 3.5 or later
    * [ICC](https://software.intel.com/en-us/c-compilers) also works (though I don't know the minimum required version number)
* [setuptools](https://packaging.python.org/installing/#install-pip-setuptools-and-wheel) (only required for installation of Unicycler)
* For short-read or hybrid assembly:
  * [SPAdes](http://bioinf.spbau.ru/spades) v3.14.0 or later (`spades.py`)
* For long-read or hybrid assembly:
  * [Racon](https://github.com/lbcb-sci/racon) (`racon`)
* For rotating circular contigs:
  * [BLAST+](https://www.ncbi.nlm.nih.gov/books/NBK279690/) (`makeblastdb` and `tblastn`)

Unicycler expects external tools to be available in `$PATH`. If they aren't, you can specify their location using Unicycler options (e.g. `--spades_path`).

[Bandage](https://github.com/rrwick/Bandage) isn't required to run Unicycler, but it is very helpful for manually investigating assemblies (the graph images in this README were made with Bandage).

# Data used

