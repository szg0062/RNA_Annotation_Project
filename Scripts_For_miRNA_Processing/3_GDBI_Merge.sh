#!/bin/sh
gatk --java-options "-Xmx550g" GenotypeGVCFs \
   -R /hosted/cvmpt/archive/Human_Genome/genome.fa \
   -V gendb://WGSALL_GDBI_Workspace \
   -O GenotypeGVCF_output_WGSALL.vcf.gz \
   --tmp-dir GenotypeGVCF_ALL_tmp
