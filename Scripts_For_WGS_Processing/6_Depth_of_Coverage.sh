#!/bin/sh


cd /home/szg0062/miRNA/BC_Cases/GVCF_FILES


module load gatk 
module load samtools


FILELIST=`cat FSamplesList.txt`  ##Can be used if a file list is needed
for FILE in $FILELIST; do

        #########Creating Variable for File names#################
##Need to be changed based on naming system
#Input = BC-CR-100-1_1_Apr2022.fastq.gz

#SHORTER=`echo $FILE | awk -F "." '{print $1}'`
SHORT=`echo $FILE | awk -F "_" '{print $1}'`     

##SHORT = BC-CR-100-1
#BC-CR-100-1.memsorted.bam 

 gatk DepthOfCoverage \
   -R /hosted/cvmpt/archive/Human_Genome/genome.fa \
   -O "$SHORT".DOC_base \
   -I "$SHORT".markdup.sorted.bam \
   -L /hosted/cvmpt/Human_Research/KnownSites/wgs_calling_regions.hg38.interval_list \
   --summary-coverage-threshold 4 --summary-coverage-threshold 6 --summary-coverage-threshold 10 --summary-coverage-threshold 15 --summary-coverage-threshold 20 --summary-coverage-threshold 25 --summary-coverage-threshold 30 --summary-coverage-threshold 35 --summary-coverage-threshold 40 --summary-coverage-threshold 45 --summary-coverage-threshold 50 \

done 

