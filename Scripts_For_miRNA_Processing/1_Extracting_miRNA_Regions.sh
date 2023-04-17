#! /bin/sh

cd /home/szg0062/miRNA/BC_Cases/GVCF_FILES

module load vcftools


ls *.g.vcf > FSamplesList.txt
FILELIST=`cat FSamplesList.txt`  ##Can be used if a file list is needed

for FILE in $FILELIST; do
SHORT=`echo $FILE | awk -F "." '{print $1}'`

vcftools --vcf $SHORT.g.vcf --bed /home/szg0062/miRNA/microRNA_hg38.bed --out $SHORT.BC.miRNA --recode --keep-INFO-all

done
