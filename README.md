# Contents
* [Introduction of .sh file](#Introduction-of-.sh-file)
* [Environnment](#Environnment)
* [Data used](#Data-used)

# Introduction of .sh file

## File Merging
merging and assemblying the reads file
### pass_merged_long_reads.sh
merge long reads into one file with cat
### merged_short_reads_all.sh
Keep R1 and R2 in separate files
### assembly_stats_all.sh
merging miniasm
### assembly_stats_mystery.sh

## unicycler assembly
Make some assembly with unicycler
### unicycle_long_reads.sh
Make assembly of long reads with unicycler
### unicycle_short_reads.sh
Make assembly of short reads with unicycler
### unicycle_hybrid_reads.sh
Make assembly of hybrid reads with unicycler
### mystery_unicycler_all.sh
merge barcode file

## quast on the assemblies
The quality of genome assembly was assessed. Use Quast to evaluate different types of assembly. Run Quast and specify the reference genome for long-path Miniasm assembly, long-read Unicycler assembly, short-read Unicycler assembly, and hybrid Unicycler assembly, respectively.

### Quast_all.sh
Use Quast to evaluate different types of assembly. Run Quast and specify the reference genome for long-path Miniasm assembly, long-read Unicycler assembly, short-read Unicycler assembly, and hybrid Unicycler assembly, respectively
### Quast_all2.sh
Quast is used to evaluate long-path Miniasm assembly, long-read Unicycler assembly, short-read Unicycler assembly, and hybrid Unicycler assembly.
### quast_mystery.sh
The integrity of genome assembly was assessed using the BUSCO tool. BUSCO analysis was performed on different samples of different assembly schemes, and haloferacales_odb10 was used as the reference database

## Busco

### busco_mystery.sh
This file is used for genetic integrity assessment using the BUSCO tool in genome assembly. BUSCO analysis was performed on different samples (barcodes 01, 09, and 10 assembled using Unicycler and Flye), using haloferacales_odb10 as the reference database, and using BUSCO output to generate plots.
### busco_script.sh
BUSCO analysis of mixed Unicycler assembly, long-read Unicycler assembly and short-read Unicycler assembly was carried out, haloferacales_odb10 was used as reference database, and the graph is drawn

## prokka
### prokka_genovi.sh
Annotate and visualize the genome

## miniasm
### miniasm_mystery.sh
reassemble and count the genome. Reassemble the sequence of barcode09
### minimap_miniasm_all.sh
assemble long read data

## nanoplot
Data quality control with nanoplot
### nanoplot_env_setup.sh
set up the nanoplot environment 
### nanoplot_batch.sh
Generate Nanoplot reports that grow read data

## Genovi
Generates circular genome representations with Genovi
### genovi_lastest.sh
Visualize barcode01, barcode09, and barcode10 using the genovi command

# Environnment
## unicycler
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

## quast
Linux (64-bit and 32-bit with slightly limited functionality) and macOS are supported.

For the main pipeline:
- Python2 (2.5 or higher) or Python3 (3.3 or higher)
- Perl 5.6.0 or higher
- GCC 4.7 or higher
- GNU make and ar
- zlib development files

For the optional submodules:
- Time::HiRes perl module for GeneMark-ES (needed when using `--gene-finding --eukaryote`)
- Java 1.8 or later for GRIDSS (needed for SV detection)
- R for GRIDSS (needed for SV detection)

Most of those tools are usually preinstalled on Linux. MacOS, however, requires to install
the Command Line Tools for Xcode to make them available. 

QUAST draws plots in two formats: HTML and PDF. If you need the PDF versions, make sure that you have installed 
[Matplotlib](https://matplotlib.org/). We recommend to use Matplotlib version 1.1 or higher. QUAST is fully tested with Matplotlib v.1.3.1.
Installation on Ubuntu (tested on Ubuntu 20.04):

    sudo apt-get update && sudo apt-get install -y pkg-config libfreetype6-dev libpng-dev python3-matplotlib

## busco

## prokka
### Mandatory

* __BioPerl__  
Used for input/output of various file formats  
_Stajich et al, The Bioperl toolkit: Perl modules for the life sciences. Genome Res. 2002 Oct;12(10):1611-8._

* __GNU Parallel__  
A shell tool for executing jobs in parallel using one or more computers  
_O. Tange, GNU Parallel - The Command-Line Power Tool, ;login: The USENIX Magazine, Feb 2011:42-47._

* __BLAST+__  
Used for similarity searching against protein sequence libraries  
_Camacho C et al. BLAST+: architecture and applications. BMC Bioinformatics. 2009 Dec 15;10:421._

* __Prodigal__  
Finds protein-coding features (CDS)  
_Hyatt D et al. Prodigal: prokaryotic gene recognition and translation initiation site identification. BMC Bioinformatics. 2010 Mar 8;11:119._

* __TBL2ASN__
Prepare sequence records for Genbank submission
[Tbl2asn home page](https://www.ncbi.nlm.nih.gov/genbank/tbl2asn2/)

### Recommended

* __Aragorn__  
Finds transfer RNA features (tRNA)  
_Laslett D, Canback B. ARAGORN, a program to detect tRNA genes and tmRNA genes in nucleotide sequences. Nucleic Acids Res. 2004 Jan 2;32(1):11-6._

* __Barrnap__  
Used to predict ribosomal RNA features (rRNA). My licence-free replacement for RNAmmmer.  
_Manuscript under preparation._

* __HMMER3__  
Used for similarity searching against protein family profiles  
_Finn RD et al. HMMER web server: interactive sequence similarity searching. Nucleic Acids Res. 2011 Jul;39(Web Server issue):W29-37._

### Optional

* __minced__  
Finds CRISPR arrays
[Minced home page](https://github.com/ctSkennerton/minced)

* __RNAmmer__  
Finds ribosomal RNA features (rRNA)  
_Lagesen K et al. RNAmmer: consistent and rapid annotation of ribosomal RNA genes. Nucleic Acids Res. 2007;35(9):3100-8._

* __SignalP__  
Finds signal peptide features in CDS (sig_peptide)  
_Petersen TN et al. SignalP 4.0: discriminating signal peptides from transmembrane regions. Nat Methods. 2011 Sep 29;8(10):785-6._

* __Infernal__  
Used for similarity searching against ncRNA family profiles  
_D. L. Kolbe, S. R. Eddy. Fast Filtering for RNA Homology Search. Bioinformatics, 27:3102-3109, 2011._

## Genovi
* Circos 0.69-8
* Python 3.7 or later
* DeepNog 1.2.3
* NumPy 1.20.2
* MatPlotLib 3.5.2
* Pandas 1.2.4
* Biopython 1.79
* CairoSVG 2.5.2
* Seaborn 0.12
* Perl 5
* List::MoreUtils (Perl library)
* Natsort 8.2.0

# Data used

### https://www.ncbi.nlm.nih.gov/nuccore/NZ_AOHU00000000.1
### https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000025685.1/
### https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_005406325.1/
