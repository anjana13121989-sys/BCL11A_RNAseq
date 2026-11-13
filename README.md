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

## 7. Limitations

1. **Sample size:** The analysis includes three biological replicates per condition, which limits statistical power and the ability to capture biological variability.

2. **Published count matrix:** The analysis uses an existing gene count matrix rather than independently processing raw FASTQ files. Therefore, upstream read quality control, alignment and quantification could not be independently evaluated.

3. **Gene annotation coverage:** Not all Ensembl gene identifiers could be mapped to gene symbols, and not all annotated genes had associated Gene Ontology terms. This may affect the coverage of downstream enrichment analysis.

4. **Biological interpretation:** Differential expression and GO enrichment identify statistical associations. They do not establish direct regulatory mechanisms, pathway activation or causality.

5. **Functional validation:** Transcriptomic findings alone cannot confirm changes in haemoglobin production, protein abundance or cellular phenotype. Additional experimental validation would be required.





BCL11A-associated changes were enriched in several processes related to cellular interactions and blood physiology, whereas HBG promoter-associated changes showed enrichment in RNA-related processes and cellular metabolism.
