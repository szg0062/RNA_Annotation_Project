# miRNA_Annotation_Project

Submit as a link to a .md file in a github repository for your project (see the video on markdown above for different syntax you can use for creating your markdown file in github). 
The link to the repo I made is https://github.com/szg0062/miRNA_Annotation_Project.

# Purpose
#### Overall purpose of the project (i.e. what are you trying to create scripts or a tutorial for)

The overall purpose of these scripts is to annotate VCFs that have been processed through a bioinformatics pipeline and miRNA regions extracted from whole genome sequencing for genetic analysis. Annotation is fairly important in my research because there are many genes that are going to present in the data and knowing the name of the miRNAs can help with seeing which ones are functionally revelant. Furthermore, this miRNA name should be from some database to make identification easier. My research group are looking to identify mutations that could be associated with breast cancer. There is newer research that shows that miRNAs are key players in tumorigenesis because they are involved in gene expression of messenger RNAs. Identifying miRNA mutations may help uncover alternative binding of mRNAs, which would subsequently change gene expression. 

# Coding language(s)
Coding languages to be used are mainly in Python, but I  may need to do some bash.

# Existing packages you would like to use for the project.

There are some requirements for the conda environment that are needed and listed below.

* matplotlib==3.4.3
* pandas==1.2.3
* click==7.1.2
* openpyxl==3.0.7
* numpy==1.20.2
* biopython==1.78
* xlrd==2.0.1
* lxml==4.6.3
* requests==2.25.1
* scipy==1.6.3
* seaborn==0.11.1
* regex==2021.7.6
* hgvs

# Data Source

I will be using data from my current research project, but there are sample files included  with the original annotation repo that I could use. I have a total of 40 breast cancer cases, and 50 non-cancer cases with miRNAs have been extracted. And I am in the processing the individual VCF files into a single VCF to use as an input file for the miRNA annotation program.
