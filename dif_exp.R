    ### Adapted script of Konstantin Zaitsev, ITMO

library(ggplot2)
library(DESeq2)
library(apeglm)
library(dplyr)

countFiles <- list.files("lnc25", full.names = T)

counts <- lapply(countFiles, function(countsFile) {
  read.table(countsFile, sep="\t", header=1, row.names = 1, stringsAsFactors = F, comment.char = "")
})


## Merging them into one table
counts <- lapply(counts, function(countsTable) countsTable[, "Count", drop=F])
counts <- do.call(cbind, counts)
colnames(counts) <- gsub(".*(GSM\\d+).*", "\\1", countFiles)

counts$lnc_count <- counts$`lnc25/lnc200gam25` + counts$`lnc25/lnc200prot25`

length(subset(counts$lnc_count, counts$lnc_count > 5 ))

## Creating dataset annotation

coldata <- data.frame(
  gsm=gsub(".*(GSM\\d+).*", "\\1", countFiles),
  foam=gsub(".*(GSM\\d+)_(foam|non_foam).*", "\\2", countFiles),
  row.names =gsub(".*(GSM\\d+).*", "\\1", countFiles)
)

coldata$row.names <- c('g', 'g', 'p', 'g', 'p')



# only keeping genes that have at least 10 reads
dds <- DESeqDataSetFromMatrix(countData = counts[rowSums(counts) > 10, ],
                              colData = coldata,
                              design= ~ foam)
dds <- DESeq(dds)
resultsNames(dds) # lists the coefficients



## VST
vst <- varianceStabilizingTransformation(dds)
plotPCA(vst, intgroup=c("foam"))




## LFC shrink
res <- lfcShrink(dds, coef="foam_non_foam_vs_foam", type="apeglm")
head(res)


## Mapping the genes
res$Gene.symbol <- rownames(res)


## Volcano
res <- as.data.frame(res)
ggplot(res, aes(x=log2FoldChange, y=-log10(padj), color=padj < 0.05)) +
  geom_point() + theme_bw() + scale_color_manual(values=c("black", "red")) +
  geom_text_repel(data=res %>% dplyr::filter(padj < 1e-20), aes(label=Gene.symbol, color=NULL))
