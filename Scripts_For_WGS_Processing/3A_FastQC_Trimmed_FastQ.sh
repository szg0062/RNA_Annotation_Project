#!/bin/sh

##Change to the working directory if you are working on Easley
cd /home/szg0062/miRNA/BC_Cases/GVCF_FILES

#load FastQC on easley
module load fastqc

########### Run FastQC on original forward fastq files.
########### What is FastQC analysis: A simple program used to assess the quality of the sequencing data generated from high throughput sequencing pipelines.

### This step should be performed before and after trimming.
#run fastqc on original forward fastq files

for TRIMMED_F_FASTQ in *1P.fastq.gz
do

fastqc $TRIMMED_F_FASTQ

done

mkdir Fastqc_trimmed
mv *.html Fastqc_trimmed
tar -czvf Fastqc_trimmed.tar Fastqc_trimmed
