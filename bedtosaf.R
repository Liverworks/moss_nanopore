a = "m_protsandlnc_200"
path <- paste("/home/andrey/anna/" , a , ".bed", sep = "")
outpath <- paste("/home/andrey/anna/", a, ".saf", sep = "")
tmp <- read.csv(path, sep = "\t", header = F)
fcc <-  tmp[,c(4, 1, 2, 3, 6)]
write.table(fcc, outpath, sep = "\t", row.names = FALSE, col.names = F)
