data <- read.csv("./rep2_rna_seq_mouse.tsv", header=TRUE, sep="\t",  row.names = 1)
labels <- read.csv("./datalabels.tsv", header=TRUE, sep="\t",  row.names = 1)
data_labeled <- rbind(t(labels), data)
genes <- rownames(data)


for (i in 1:ncol(data_labeled)){
  ptype = data_labeled[1,i]
  dev_stage <- data_labeled[2,i]
  outdata <- as.data.frame(data_labeled[3:nrow(data_labeled) ,i])
  rownames(outdata) <- genes
  colnames(outdata) <- colnames(data)[i]
  outname <- paste0("./", colnames(data)[i], "_", ptype, "_", dev_stage, "_mouse2.tsv")
  write.table(outdata, outname, sep="\t")
}

