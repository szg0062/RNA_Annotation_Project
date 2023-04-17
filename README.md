# miRNA_Annotation_Project

Submit as a link to a .md file in a github repository for your project (see the video on markdown above for different syntax you can use for creating your markdown file in github). 
The link to the repo I made is https://github.com/szg0062/miRNA_Annotation_Project.

## Purpose
##### Overall purpose of the project (i.e. what are you trying to create scripts or a tutorial for)

The overall purpose of these scripts is to annotate VCFs that have been processed through a bioinformatics pipeline and miRNA regions extracted from whole genome sequencing for genetic analysis. Annotation is fairly important in my research because there are many genes that are going to present in the data and knowing the name of the miRNAs can help with seeing which ones are functionally revelant. Furthermore, this miRNA name should be from some database to make identification easier. My research group are looking to identify mutations that could be associated with breast cancer. There is newer research that shows that miRNAs are key players in tumorigenesis because they are involved in gene expression of messenger RNAs. Identifying miRNA mutations may help uncover alternative binding of mRNAs, which would subsequently change gene expression. 

## Coding language(s)
Coding languages to be used are mainly in Python for annotation, but the earlier data processing used bash scripts.

## Existing packages you would like to use for the project.
Required packages for data processing are listed below.
* gatk
* vcftools
* samtools
* picard
* R

There are some requirements for the conda environment that are needed and listed below.

* matplotlib==3.4.3
* pandas==1.2.3
* click==7.1.2
* openpyxl==3.0.7
* numpy==1.20.2
* biopython==1.78
* xlrd==2.0.1
* lxml==4.6.3
* requests==2.25.1
* scipy==1.6.3
* seaborn==0.11.1
* regex==2021.7.6
* hgvs

## Data Source

I will be using WGS data from my current research project, but there are sample files included  with the original annotation repo that I could use. I have a total of 40 breast cancer cases, and 50 non-cancer cases with the miRNA regions being extracted. And I am in the processing the individual VCFs into a single VCF to use as an input file for the miRNA annotation program.


##  SCRIPTS INFORMTION
Most of the scripts used in this bioinformatic pipeline were retreived from GATK v4.1.9.0 guide (https://gatk.broadinstitute.org/hc/en-us/sections/360010932391-4-1-9-0). Overall, there are 15 scripts for this analysis. Nine are for processing WGS data, five for miRNA prep, and 1 in python. The python script have 18 other supplemental scripts for the program to function to make the annotations to the final VCF. These python scripts were developed by Martyna O. Urbanek-Trzeciak and this program is available on https://github.com/martynaut/mirnome-mutations.



The following  scripts are included in the Scripts_For_WGS_Processing folder:
* **FastQC.sh** – Quality check for FastQ files
* **Trimmomatic.sh** – Cleaning sequencing data by trimming ends
* **FastQC_Trimmed_FastQ.sh** – Quality check for FastQ files after trimming 
* **BWA-mem.sh** – Aligning WGS data to HG38 (human genome)
* **Read_groups.sh** (Add or Replace Read Groups) – Adds or replaces read group tags in Fastq files
* **Mark_Duplicates.sh** – Marks duplicate reads that could be artifacts of PCR
* **Flag_stats.sh** and Depth_of_Coverage.sh – counts the number of alignments and the number of times a nucleotide is read during a sequencing run
* **Base_Recalibration.sh** – detects sequencing machine errors 
* **Haplotype_Caller.sh** – identify possible variant sites in samples

The following scripts are the scripts present in Scripts_For_miRNA_Processing:
* **miRNA_extraction.sh** - Extraction of miRNA regions from VCF
* **Index_File_Feature_for_GDBImport.sh** - index files for GDBI
* **DB_for_GDBI_Merge.sh** - create database to merge VCFs
* **GDBI_merge.sh** - Merging individual VCFs into a single VCF
* **VQSR.sh** - filtering step that using a list of variants to filter out artifacts from the processed sequencing data



Unfortunately, I have not been able to figure out how to get this annotation program to function to process to gen an annotated VCF generated from the scripts above. However, I hope you will find this repo helpful.

For better understanding of the annotation scripts please refer to the protocol of this program (https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8686061/).


Sample data is provided in **Sample_Control_File folder** . Due to this being preliminary data for an ongoing project and the size of the files in this analysis, I tried providing only one file for this analysis. But, the one file was too large for Github. 
To address this issue, I will copy lines and input in a new file titled Sample_data.vcf. For the demo, you will use the five scripts in the Scripts_for_miRNA_Processing folder. 




