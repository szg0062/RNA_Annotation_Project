#!/bin/sh

module load gatk 
module load samtools
module load R

FILELIST=`cat FSamplesList.txt`  ##Can be used if a file list is needed
for FILE in $FILELIST; do

        #########Creating Variable for File names#################
##Need to be changed based on naming system
#Input = BC-CR-100-1_1_Apr2022.fastq.gz

#SHORTER=`echo $FILE | awk -F "." '{print $1}'`
SHORT=`echo $FILE | awk -F "_" '{print $1}'`     

##SHORT = BC-CR-100-1
#BC-CR-100-1.memsorted.bam 

 gatk BaseRecalibrator \
   -I "$SHORT".markdup.sorted.bam \
   -R /hosted/cvmpt/archive/Human_Genome/genome.fa \
   --known-sites /hosted/cvmpt/Human_Research/KnownSites/dbsnp_146.hg38.vcf \
   --known-sites /hosted/cvmpt/Human_Research/KnownSites/Mills_and_1000G_gold_standard.indels.hg38.vcf \
   -O "$SHORT".recal_data.table
 
 gatk ApplyBQSR \
   -R /hosted/cvmpt/archive/Human_Genome/genome.fa \
   -I "$SHORT".markdup.sorted.bam \
   --bqsr-recal-file "$SHORT".recal_data.table \
   -O "$SHORT".recal.bam
 
 gatk AnalyzeCovariates \
   -bqsr "$SHORT".recal_data.table \
   -plots "$SHORT".AnalyzeCovariates.pdf

samtools sort -@ 48 "$SHORT".recal.bam -o "$SHORT".recal.sorted.bam
samtools index -@ 48 "$SHORT".recal.sorted.bam

done
