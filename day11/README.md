Differential gene expression with seqencing data
===

We had previously learned how to perform differential gene expression with microarray data. Today we learn how to do that with count data that come from technologies such as RNA-sequencing. In the coming days, you will learn more details about how to derive count data from raw sequencing files (_e.g._ FASTQ files) exported by sequencing machines; now let's focus on the differential expression analysis of such data.

To start have a look at the vignette of the (_edgeR_ package)[http://bioconductor.org/packages/release/bioc/html/edgeR.html] in Bioconductor.

Next, try to analyse the differential gene expression using the data provided in the folder.

* rnaseq-example-readCounts.gct: Counts in [gct file format](http://software.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats#GCT:_Gene_Cluster_Text_file_format_.28.2A.gct.29)
* rnaseq-example-DesignMatrix:txt: Design matrix required by _edgeR_, specifying the experiment setup.
* rnaseq-example-ContrastMatrix:txt: Contrast matrix required by _edgeR_, specifying the comparisons that we want to make
* rnaseq-example-sampleGroups.txt: A plain-text file with one line for each sample, used to classify samples into groups
* rnaseq-example-sampleGroupLevels.txt: A plain-text file with one line for each sample group, used to rank the sample groups by a desired order, such as _control_, _low-dose treatment_, and _high-dose treatment_.
