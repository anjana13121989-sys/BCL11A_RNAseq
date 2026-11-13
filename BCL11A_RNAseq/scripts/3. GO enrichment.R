#gene ontology enrichment begins
library(clusterProfiler)

#ensembl ids of significant genes (padj < 0.05)
genes_bcl11a <- rownames(
  res_bcl11a_df[
    !is.na(res_bcl11a_df$padj) & res_bcl11a_df$padj < 0.05,
  ]
)

genes_hbg <- rownames(
  res_hbg_df[
    !is.na(res_hbg_df$padj) & res_hbg_df$padj < 0.05,
  ]
)

#prepare the background gene universe
universe_genes <- rownames(res_bcl11a_df)[
  rownames(res_bcl11a_df) %in%
    keys(org.Hs.eg.db, keytype = 'ENSEMBL')
]
sum(genes_bcl11a %in% universe_genes )
sum(genes_hbg %in% universe_genes )

#GO enrichment
ego_bcl11a <- enrichGO(
  gene = genes_bcl11a,
  universe = universe_genes,
  OrgDb = org.Hs.eg.db,
  keyType = 'ENSEMBL',
  ont = 'BP',
  pAdjustMethod = 'BH',
  pvalueCutoff = 0.05,
  qvalueCutoff = 0.05
)

ego_hbg <- enrichGO(
  gene = genes_hbg,
  universe = universe_genes,
  OrgDb = org.Hs.eg.db,
  keyType = 'ENSEMBL',
  ont = 'BP',
  pAdjustMethod = 'BH',
  pvalueCutoff = 0.05,
  qvalueCutoff = 0.05
)

#display of GO enrichment results table
go_bcl11a <- as.data.frame(ego_bcl11a)
go_bcl11a <- go_bcl11a[
  order(go_bcl11a$p.adjust),
]
head(
  go_bcl11a[, c(
  'ID',
  'Description',
  'GeneRatio',
  'p.adjust',
  'Count'
)],
10
)

go_hbg <- as.data.frame(ego_hbg)
go_hbg <- go_hbg[
  order(go_hbg$p.adjust),
]
head(
  go_hbg[, c(
    'ID',
    'Description',
    'GeneRatio',
    'p.adjust',
    'Count'
  )],
  10
)

#visualize the GO enrichment
dotplot(
  ego_bcl11a,
  showCategory = 10,
  title = 'GO biological processes: BCL11A-edited vs Control'
)

dotplot(
  ego_hbg,
  showCategory = 10,
  title = 'GO biological processes: HBG promoter-edited vs Control'
)
