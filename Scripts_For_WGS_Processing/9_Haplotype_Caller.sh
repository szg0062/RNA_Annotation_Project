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

 gatk --java-options "-Xmx80g" HaplotypeCaller  \
   -R /hosted/cvmpt/archive/Human_Genome/genome.fa \
   -I "$SHORT".recal.sorted.bam \
   -O "$SHORT".g.vcf.gz \
   -ERC GVCF \
   -A AlleleFraction \
   -A BaseQuality \
   -A MappingQuality \
   --native-pair-hmm-threads 48 
   
done
