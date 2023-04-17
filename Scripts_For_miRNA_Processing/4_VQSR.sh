#!/bin/sh

module load gatk
module load R

## recalibrate SNPs
 gatk VariantRecalibrator \
   -R /hosted/cvmpt/archive/Human_Genome/genome.fa \
   -V GenotypeGVCF_WGSCases_Controls.vcf.gz \
   --resource:1000G,known=false,training=true,truth=false,prior=10.0 /hosted/cvmpt/Human_Research/KnownSites/Mills_and_1000G_gold_standard.indels.hg38.vcf \
   --resource:dbsnp,known=true,training=false,truth=false,prior=2.0 /hosted/cvmpt/Human_Research/KnownSites/dbSNP150.hg38.vcf \
   --resource:hapmap,known=false,training=true,truth=true,prior=15.0 /hosted/cvmpt/Human_Research/KnownSites/hapmap_3.3.hg38.vcf \
   -an DP -an QD -an FS -an SOR -an MQ -an ReadPosRankSum -an MQRankSum \
   -mode SNP \
   -L /hosted/cvmpt/Human_Research/KnownSites/wgs_calling_regions.hg38.interval_list \
   -O VQSR_SNP_WGSCases_Controls_Output.vcf.recal \
   --tranches-file VQSR_SNP_WGSCases_Controls_Output.vcf.tranches \
   --rscript-file VQSR_SNP_WGSCases_Controls_Output.vcf.plots.R

 gatk ApplyVQSR \
   -R /hosted/cvmpt/archive/Human_Genome/genome.fa \
   -V GenotypeGVCF_WGSCases_Controls.vcf.gz \
   -O ApplyVQSR_SNPs_WGSCases_Controls_Output.vcf.gz \
   --truth-sensitivity-filter-level 90.0 \
   --tranches-file VQSR_SNP_WGSCases_Controls_Output.vcf.tranches \
   --recal-file VQSR_SNP_WGSCases_Controls_Output.vcf.recal \
   -mode SNP

## reaclibrate for INDELs
 gatk VariantRecalibrator \
   -R /hosted/cvmpt/archive/Human_Genome/genome.fa \
   -V ApplyVQSR_SNPs_WGSCases_Controls_Output.vcf.gz \
   --resource:1000G,known=false,training=true,truth=false,prior=10.0 /hosted/cvmpt/Human_Research/KnownSites/Mills_and_1000G_gold_standard.indels.hg38.vcf \
   --resource:dbsnp,known=true,training=false,truth=false,prior=2.0 /hosted/cvmpt/Human_Research/KnownSites/dbSNP150.hg38.vcf \
   --resource:hapmap,known=false,training=true,truth=true,prior=15.0 /hosted/cvmpt/Human_Research/KnownSites/hapmap_3.3.hg38.vcf \
   -an DP -an QD -an FS -an SOR -an MQ -an ReadPosRankSum -an MQRankSum \
   -mode INDEL \
   -L /hosted/cvmpt/Human_Research/KnownSites/wgs_calling_regions.hg38.interval_list \
   -O ApplyVQSR_INDEL_SNP_WGSCases_Controls_Output.vcf.recal \
   --tranches-file VQSR_INDEL_SNP_WGSCases_Controls_Output.vcf.tranches \
   --rscript-file VQSR_INDEL_SNP_WGSCases_Controls_Output.vcf.plots.R

 gatk ApplyVQSR \
   -R /hosted/cvmpt/archive/Human_Genome/genome.fa \
   -V ApplyVQSR_SNPs_WGSCases_Controls_Output.vcf.gz \
   -O ApplyVQSR_INDEL_SNP_WGSCases_Controls_Output.vcf.gz \
   --truth-sensitivity-filter-level 90.0 \
   --tranches-file VQSR_INDEL_SNP_WGSCases_Controls_Output.vcf.tranches \
   --recal-file ApplyVQSR_INDEL_SNP_WGSCases_Controls_Output.vcf.recal \
   -mode INDEL
