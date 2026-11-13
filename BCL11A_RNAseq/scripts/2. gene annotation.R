#retrieval of gene annotations
gene_ids <- rownames(res_bcl11a)
gene_symbols <- mapIds(
  org.Hs.eg.db,
  keys = gene_ids,
  column = 'SYMBOL',
  keytype = 'ENSEMBL',
  multiVals = 'first'
)

#attaching retrieved gene symbols to the results
res_bcl11a_df <- as.data.frame(res_bcl11a)
res_bcl11a_df$gene_symbol <- gene_symbols[
  rownames(res_bcl11a_df)
]

res_hbg_df <- as.data.frame(res_hbg)
res_hbg_df$gene_symbol <- gene_symbols[
  rownames(res_hbg_df)
]

#count non-annotated genes
sum(is.na(res_bcl11a_df$gene_symbol))
sum(is.na(res_hbg_df$gene_symbol))

head(gene_ids)
keytypes(org.Hs.eg.db)
sum(gene_ids %in% keys(org.Hs.eg.db, keytype = "ENSEMBL"))