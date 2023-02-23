# miRNA_Annotation_Project

Submit as a link to a .md file in a github repository for your project (see the video on markdown above for different syntax you can use for creating your markdown file in github). 
The link to the repo I made is https://github.com/szg0062/miRNA_Annotation_Project.

# Purpose
Overall purpose of the project (i.e. what are you trying to create scripts or a tutorial for)

The overall purpose of these scripts is to annotate VCFs that have been processed through a bioinformatics pipeline and extract the miRNAs regions from whole genome sequencing for genetic analysis. For my research group, we are looking to identify gene mutations that could be associated with breast cancer. There is more newer research that suggest that miRNAs are key players in tumorigenesis because they are involved in gene expression of messenger RNAs.

# Coding language(s)
Coding languages to be used are mainly in Python, but I  may need to do some bash.

# Existing packages you would like to use for the project.

There are some requirements for the conda environment that are needed and listed below.

matplotlib==3.4.3
pandas==1.2.3
click==7.1.2
openpyxl==3.0.7
numpy==1.20.2
biopython==1.78
xlrd==2.0.1
lxml==4.6.3
requests==2.25.1
scipy==1.6.3
seaborn==0.11.1
regex==2021.7.6
hgvs

# Data Source

I will be using data from my current research project, but there are sample files included  with the original that I could use. I have a total of 40 breast cancer cases, and 50 non-cancer cases with miRNAs have been extracted. And I am in the processing the individual VCF files into a single VCF to use as an inout file for the miRNA annotation program.
