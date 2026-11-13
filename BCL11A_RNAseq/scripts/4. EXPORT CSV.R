#differential expression analysis result export
write.csv(
  as.data.frame(res_bcl11a),
  "//wsl.localhost/Ubuntu/home/anjana_12/BCL11A_RNAseq/results/DESeq2_BCL11A_vs_Control.csv"
)

write.csv(
  as.data.frame(res_hbg),
  "//wsl.localhost/Ubuntu/home/anjana_12/BCL11A_RNAseq/results/DESeq2_HBG_vs_Control.csv"
)

#metadata
write.csv(
  metadata,
  "//wsl.localhost/Ubuntu/home/anjana_12/BCL11A_RNAseq/results/metadata.csv"
)

#Annotated differential expression results
write.csv(
  res_bcl11a_df,
  "//wsl.localhost/Ubuntu/home/anjana_12/BCL11A_RNAseq/results/Annotated_BCL11A_vs_Control.csv"
)

write.csv(
  res_hbg_df,
  "//wsl.localhost/Ubuntu/home/anjana_12/BCL11A_RNAseq/results/Annotated_HBG_vs_Control.csv"
)

#significant gene lists (Ensembl IDs)
write.csv(
  data.frame(Ensembl_ID = genes_bcl11a),
  "//wsl.localhost/Ubuntu/home/anjana_12/BCL11A_RNAseq/results/Significant_genes_BCL11A.csv",
  row.names = FALSE
)

write.csv(
  data.frame(Ensembl_ID = genes_hbg),
  "//wsl.localhost/Ubuntu/home/anjana_12/BCL11A_RNAseq/results/Significant_genes_HBG.csv",
  row.names = FALSE
)

#GO enrichment results
write.csv(
  go_bcl11a,
  "//wsl.localhost/Ubuntu/home/anjana_12/BCL11A_RNAseq/results/GO_enrichment_BCL11A.csv",
  row.names = FALSE
)

write.csv(
  go_hbg,
  "//wsl.localhost/Ubuntu/home/anjana_12/BCL11A_RNAseq/results/GO_enrichment_HBG.csv",
  row.names = FALSE
)