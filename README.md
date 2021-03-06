# Nanopore sequence transcriptome data analysis of moss Physcomitrella patens

### Laboratory of Functional Genomics and Proteomics, Institute of Bioorganic Chemistry, Moscow

**Last update**: whole analysis pipeline added in *full_notebook.ipynb* for greater convenience.

Here we analyzed *Physcomitrella patens* transcriptome of two ontogenesis stages (protonemata and gametophores) using Nanopore direct RNA sequencing. The differential expression analysis was conducted using featureCounts and DeSeq2. PolyA tail length and nucleotide modifications were found using Nanopolish and Nanocompore. Also, the lncRNA isoforms expression was proved with SQANTI2.

Differential expression analysis showed that the two stages were extremely different (90% of variation). Genes involved in translation are more active in protonemata, while more active transcription factors were active in gametophores.

A weak negative correlation between gene polyA tail length and number of reads was observed. 579 genes had longer polyA tails in protonemata while only 21 had longer tails in gametophores. 86 of these genes were differentially expressed. Most of them were active in protonemata.

Only about 140 genes had enough coverage for base modifications analysis with Nanocompore. 28 of them had possible modification sites, and most of the sites were located in 3`-UTR regions. It is consistent with earlier studies of Arabidopsis (Parker et al. ELife 2020).

We also aimed to prove the expression of lncRNAs. Presence of 3100 isoforms was proved using SQANTI2 out of 19000 annotated lncRNAs. About 350 more isoforms were only slightly different from the annotation. They have the same splice-sites but may be shorter at the ends of the sequences.

To sum up, direct RNA sequencing is a useful approach for plant transcriptomics analysis. It allows not only to study differential expression but also epitranscriptomics features.

- Pipeline information is in full_notebook.ipynb or as well in NOTEBOOK.doc
- Sequence quality control reports are in *qc_reports*
- Used scripts are in *scripts*, their usage is in the notebook

### References

- Leger, A., Amaral, P.P., Pandolfini, L., Capitanchik, C., Capraro, F., Barbieri, I., Migliori, V., Luscombe, N.M., Enright, A.J., Tzelepis, K., Ule, J., Fitzgerald, T., Birney, E., Leonardi, T., Kouzarides, T., 2019. RNA modifications detection by comparative Nanopore direct RNA sequencing (preprint). Genomics. https://doi.org/10.1101/843136
- Li, H., 2018. Minimap2: pairwise alignment for nucleotide sequences. Bioinformatics 34, 3094–3100. https://doi.org/10.1093/bioinformatics/bty191
- Li, H., Handsaker, B., Wysoker, A., Fennell, T., Ruan, J., Homer, N., Marth, G., Abecasis, G., Durbin, R., 1000 Genome Project Data Processing Subgroup, 2009. The Sequence Alignment/Map format and SAMtools. Bioinformatics 25, 2078–2079. https://doi.org/10.1093/bioinformatics/btp352
- Liao, Y., Smyth, G.K., Shi, W., 2014. featureCounts: an efficient general purpose program for assigning sequence reads to genomic features. Bioinformatics 30, 923–930. https://doi.org/10.1093/bioinformatics/btt656
- Love, M.I., Huber, W., Anders, S., 2014. Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. Genome Biol 15, 550. https://doi.org/10.1186/s13059-014-0550-8
- Parker, M.T., Knop, K., Sherwood, A.V., Schurch, N.J., Mackinnon, K., Gould, P.D., Hall, A.J., Barton, G.J., Simpson, G.G., 2020. Nanopore direct RNA sequencing maps the complexity of Arabidopsis mRNA processing and m6A modification. eLife 9, e49658. https://doi.org/10.7554/eLife.49658
- Quinlan, A.R., Hall, I.M., 2010. BEDTools: a flexible suite of utilities for comparing genomic features. Bioinformatics 26, 841–842. https://doi.org/10.1093/bioinformatics/btq033
- Tardaguila, M., de la Fuente, L., Marti, C., Pereira, C., Pardo-Palacios, F.J., del Risco, H., Ferrell, M., Mellado, M., Macchietto, M., Verheggen, K., Edelmann, M., Ezkurdia, I., Vazquez, J., Tress, M., Mortazavi, A., Martens, L., Rodriguez-Navarro, S., Moreno-Manzano, V., Conesa, A., 2018. Corrigendum: SQANTI: extensive characterization of long-read transcript sequences for quality control in full-length transcriptome identification and quantification. Genome Res. 28, 1096–1096. https://doi.org/10.1101/gr.239137.118
- https://github.com/jts/nanopolish
- https://github.com/Magdoll/SQANTI
- https://github.com/roblanf/minion_qc
- https://phytozome.jgi.doe.gov/pz/portal.html
