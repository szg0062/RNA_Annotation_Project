#!/bin/sh

module load gatk
module load picard


cd /home/szg0062/miRNA/BC_Cases/GVCF_FILES

FILELIST=`cat FSamplesList.txt`  ##Can be used if a file list is needed
for FILE in $FILELIST; do

        #########Creating Variable for File names#################
##Need to be changed based on naming system
#Input = BC-CR-100-1_1_Apr2022.fastq.gz

#SHORTER=`echo $FILE | awk -F "." '{print $1}'`
SHORT=`echo $FILE | awk -F "_" '{print $1}'`

#Output = BC-CR-100-1

 java -jar /tools/picard-2.23.9/libs/picard.jar AddOrReplaceReadGroups \
       I="$SHORT".memsorted.bam \
       O="$SHORT".rg.bam \
       RGID="$SHORT" \
       RGLB=WGS2 \
       RGPL=ILLUMINA \
       RGPU=unit1 \
       RGSM="$SHORT"_WGS2
 
done
