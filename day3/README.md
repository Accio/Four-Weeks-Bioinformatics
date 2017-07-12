Day 3
===

Today we will learn about the Bioconductor package _limma_, which performs linear modelling for microarray data and other types of data that can be analysed with linear models. We will learn how to perform differential gene expression analysis with _limma_; moreover, we will use _limma_ as an example to learn how to use packages in Bioconductor in general.

1. Install limma if not yet installed. Note that it may take some time to install the package for the first time because other packages which it depends on will be installed first.
2. Read the vignettes of limma.
3. We will get an example dataset to be analysed with _limma_. For this purpose, checkout the __GEOquery__ package, and download the dataset associated withthe ID __GSE19284__.
4. Use _limma_ to compare tip cells versus endothelial stalk cells. 
5. What are the most strongly differentially expressed genes? Visualise a few of them to check whether the results of _limma_ makes sense.
 