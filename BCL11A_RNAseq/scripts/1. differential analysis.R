#load the count matrix, if in ubuntu, load the path address
counts <- read.csv(
  "//wsl.localhost/Ubuntu/home/anjana_12/BCL11A_RNAseq/data/GSE264491_merged_counts.csv/GSE264491_merged_counts.csv",
  row.names = 1,
  check.names = FALSE
)
dim(counts)
head(counts)

#load the metadata
metadata <- read.csv(
  "//wsl.localhost/Ubuntu/home/anjana_12/BCL11A_RNAseq/data/metadata.csv",
  row.names = 1,
  check.names = FALSE
)
metadata

#check if sample id's match across count matrix and metadata
all(colnames(counts)==rownames(metadata))

#set up experimental design, select the reference level
metadata$condition <- factor(
  metadata$condition,
  levels = c('control','BCL11A_edited','HBG_promoter_edited')
)
levels(metadata$condition)

#load DEseq2 library and create deseq2 dataset
library(DESeq2)
dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = metadata,
  design = ~ condition
)
dds <- DESeq(dds)

#extract results, primary analysis result
res_bcl11a <- results(
  dds,
  contrast = c('condition','BCL11A_edited','control')
)
head(res_bcl11a)

# secondary analysis result
res_hbg <- results(
  dds,
  contrast = c('condition','HBG_promoter_edited','control')
)
head(res_hbg)

#filter out differentially expressed genes
sum(res_bcl11a$padj < 0.05, na.rm = TRUE)
sum(res_hbg$padj < 0.05, na.rm = TRUE)

#extract significant filtered out genes a/c to appropriate threshold, form a table and count rows
sig_bcl11a <- subset(res_bcl11a,padj < 0.05)
sig_hbg <- subset(res_hbg,padj < 0.05)

nrow(sig_bcl11a)
nrow(sig_hbg)

#sort and arrange them in an increasing manner by their adjusted p-value
sig_bcl11a <- sig_bcl11a[order(sig_bcl11a),]
sig_hbg <- sig_hbg[order(sig_hbg),]
head(sig_bcl11a,10)
head(sig_hbg,10)

# log10 of adjusted p-values, for volcano plot later
volcano_bcl11a <- as.data.frame(res_bcl11a)
volcano_bcl11a$log10_padj <- -log10(volcano_bcl11a$padj)
head(volcano_bcl11a,10)

volcano_hbg <- as.data.frame(res_hbg)
volcano_hbg$log10_padj <- -log10(volcano_hbg$padj)
head(volcano_hbg,10)


#visualization of sample patterns by PCA plot
vsd <- vst(dds,blind = FALSE)
plotPCA(vsd, intgroup = 'condition')

#gene expression changes by MA plot
plotMA(res_bcl11a, alpha = 0.05, ylim = c(-5,3), main = 'bcl11a-edited vs control')
plotMA(res_hbg, alpha = 0.05, ylim = c(-5,3), main = 'hbg-edited vs control')

#visualize change in expression and its statistical evidence by volcano plot
plot(
  volcano_bcl11a$log2FoldChange,
  volcano_bcl11a$log10_padj,
  col = ifelse(
    !is.na(volcano_bcl11a$padj) & volcano_bcl11a$padj < 0.05, 'blue','grey'
  ),
  pch = 20,
  xlab = 'log2 fold change',
  ylab = '-log10 adjusted p-value',
  main = 'BCL11A-edited vs control',
  ylim = c(0,10)
)
abline(h = -log10(0.05), lty = 2)
abline(v = c(1,-1), lty = 2)

plot(
  volcano_hbg$log2FoldChange,
  volcano_hbg$log10_padj,
  col = ifelse(
    !is.na(volcano_hbg$padj) & volcano_hbg$padj < 0.05, 'red','grey'
  ),
  pch = 20,
  xlab = 'log2 fold change',
  ylab = '-log10 adjusted p-value',
  main = 'HBG promoter-edited vs control',
  ylim = c(0,10)
)
abline(h = -log10(0.05), lty = 2)
abline(v = c(1,-1), lty = 2)

#similarity among sample's expression profile is visualized using sample distance heatmap
library(pheatmap)
sampleDists <- dist(t(assay(vsd)))
pheatmap(
  as.matrix(sampleDists),
  clustering_distances_rows = sampleDists,
  clustering_distance_cols = sampleDists,
  main = 'sample to sample distance heatmap'
)