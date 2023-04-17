#!/bin/sh
##Needs to be ran on fastq files that have already been trimmed
##Make sure to adjust the number of the threads requested to match the number of available processors per core on Easley

cd /home/szg0062/miRNA/BC_Cases/GVCF_FILES

############## Module Load #####################################
# bwa/0.7.17
# samtools/1.11

module load bwa
module load samtools

######### For Loop to align using BWA mem files #############################
##This requires a preexisting file containing in list form all of the basic file names used;
## only needs to have the first portion namesd to match - variables will be set below to 
##isolate portion of name needed for each step


FILELIST=`cat FSamplesList_Group<INSERT GROUP #>.txt`  ##Can be used if a file list is needed
for FILE in $FILELIST; do

        #########Creating Variable for File names#################
##Need to be changed based on naming system
#Input = BC-CR-100-1_1_Apr2022.fastq.gz

#SHORTER=`echo $FILE | awk -F "." '{print $1}'`
SHORT=`echo $FILE | awk -F "_" '{print $1}'`

#Output = BC-CR-100-1
        #########################################################
### Aligning with 48 threads/cores/processors
##For reference Genome specify the directory and then the base part of the genome name
#####The part before the .fa

gzip -d "$SHORT".trim_1P.fastq.gz "$SHORT".trim_2P.fastq.gz
        
        bwa mem -t 48 -M /hosted/cvmpt/archive/Human_Genome/genome "$SHORT".trim_1P.fastq \
        "$SHORT".trim_2P.fastq > "$SHORT".mem.sam

        ##################################################################################

samtools view -Sb -@ 48 "$SHORT".mem.sam -o "$SHORT".mem.bam
samtools sort -@ 48 "$SHORT".mem.bam -o "$SHORT".memsorted.bam
samtools index -@ 48 "$SHORT".memsorted.bam

gzip "$SHORT".trim_1P.fastq "$SHORT".trim_2P.fastq

done

