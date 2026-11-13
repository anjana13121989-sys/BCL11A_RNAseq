GSE264491: Independent RNA-seq Differential Expression Analysis

## 1. Biological Question : How does CRISPR-Cas9 editing of the BCL11A erythroid enhancer and HBG1/2 promoter regions affect gene expression in human erythroid cells?

- the analysis compares transcriptomic changes between:
a. BCL11A enhancer-edited cells and control cells.
b. HBG1/2 promoter-edited cells and control cells.

- the objective is to identify differentially expressed genes and enriched biological processes associated with each editing strategy.

## 2. Dataset Used

- GEO accession: GSE264491 from NCBI Gene Expression Omnibus (GEO).
- experimental groups: Control, BCL11A enhancer-edited and HBG promoter-edited from erythroid cells derived from human CD34+ cells.
- Replicates, three samples per condition.

(data, metadata & literature attached)

## 3. Tools and Databases

- R: Statistical computing and data analysis.
- RStudio: Analysis environment.
- DESeq2: Differential gene expression analysis.
- org.Hs.eg.db: Human gene annotation.
- clusterProfiler: Gene Ontology enrichment analysis.
- ggplot2: Data visualization.

## 4. Rough Workflow

1. count matrix and sample metadata validation.

2. differential expression analysis using DESeq2.

3. gene annotation using Ensembl gene identifiers.

4. Identification of significantly differentially expressed genes.

5. gene Ontology biological process enrichment using clusterProfiler.

6. visualization using PCA, MA plots, volcano plots, sample-distance heatmaps and GO enrichment dot plots.

(analyzed result CSV files and analysis scripts attached, detailed handwritten process in the log pdf)

## 5. Results

- differential expression profiles were obtained for both editing conditions relative to control.

- PCA and sample-distance heatmaps were used to examine sample-level expression patterns.

- MA plots and volcano plots were generated to visualize differential expression.

- GO enrichment revealed distinct patterns of overrepresented biological processes between the two editing conditions.

- BCL11A enhancer editing showed enrichment of processes related to blood physiology, hemostasis, cell adhesion and actin organization.

- HBG promoter editing showed enrichment of processes related to ribonucleoprotein complex biogenesis, ribosome biogenesis, RNA processing, nuclear transport and cellular energy metabolism.
  
( detailed plot interpretation in the log pdf)

## 6. Biological Interpretation

- the enrichment results suggest distinct transcriptomic response patterns associated with BCL11A enhancer editing and HBG promoter editing.
- BCL11A associated changes were enriched in processes like wound healing, blood physiology while gor HBG promoter associated chnges were evident in RNA-related processes and cellular mechanisms.
- although they don't independently establish pathway activation, direct regulation or any changes in the hemoglobin production.

## 7. Key learnings

- working with gene count matrices, sample metadata and Ensembl gene identifiers.

- understanding DESeq2, normalized counts, log2 fold changes, p-values and adjusted p-values.

- interpreting PCA, MA plots, volcano plots and sample-distance heatmaps to explore gene expression patterns.

- mapping Ensembl identifiers to gene symbols using org.Hs.eg.db and understanding annotation coverage.

- understanding Gene Ontology biological process enrichment, over-representation analysis and adjusted p-values using clusterProfiler.

- exploring how different CRISPR-Cas9 editing strategies are associated with distinct transcriptomic changes in erythroid cells.

- organizing scripts, datasets, results, figures and project documentation into a structured project repository.





BCL11A-associated changes were enriched in several processes related to cellular interactions and blood physiology, whereas HBG promoter-associated changes showed enrichment in RNA-related processes and cellular metabolism.
