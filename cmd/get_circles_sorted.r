#! /usr/bin/Rscript

library(myvariant)
library(ggplot2)

args <- commandArgs(trailingOnly=TRUE)  #引数受け取り  
data <- read.table(args[1])
var.names <- c("case", "gene", "lrt", "fathmm_mkl", "dann", "siphy_29way","gerp","phastcons_100way","fathmm","genocanyon","phastcons_30way","phylo_p30way", 
               "phastcons_17way", "phylo_p17way", "primateai", "fathmm-xf", "metasvm", "mutationassessor","polyphen2", "metalr", "m-cap","mpc","sift","mutationtater", 
               "phylo_p100way","list-s2", "clinpred", "metaRNN", "bayesdel", "vest4","revel","mutpred", "mvp","deogen2", "provean", "eigen-pc", "sift4g")

variantmatrix <- matrix(numeric(37*nrow(data)), nrow=nrow(data), ncol=37)

for ( i in 1:nrow(data)){
  variantFunction <- function(){
    b <- ifelse (is.null(variant[[1]]$dbnsfp$dann$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$dann$rankscore)
    c <- ifelse (is.null(variant[[1]]$dbnsfp$deogen2$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$deogen2$rankscore)
    d <- ifelse (is.null(variant[[1]]$dbnsfp$'eigen-pc'$raw_coding_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$'eigen-pc'$raw_coding_rankscore)
    e <- ifelse (is.null(variant[[1]]$dbnsfp$'fathmm-mkl'$coding_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$'fathmm-mkl'$coding_rankscore)
    f <- ifelse (is.null(variant[[1]]$dbnsfp$'fathmm-xf'$coding_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$'fathmm-xf'$coding_rankscore)
    g <- ifelse (is.null(variant[[1]]$dbnsfp$genocanyon$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$genocanyon$rankscore)
    h <- ifelse (is.null(variant[[1]]$dbnsfp$'m-cap'$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$'m-cap'$rankscore)
    i <- ifelse (is.null(variant[[1]]$dbnsfp$metalr$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$metalr$rankscore)
    j <- ifelse (is.null(variant[[1]]$dbnsfp$metasvm$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$metasvm$rankscore)
    k <- ifelse (is.null(variant[[1]]$dbnsfp$mpc$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$mpc$rankscore)
    l <- ifelse (is.null(variant[[1]]$dbnsfp$mutpred$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$mutpred$rankscore)
    m <- ifelse (is.null(variant[[1]]$dbnsfp$mvp$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$mvp$rankscore)
    n <- ifelse (is.null(variant[[1]]$dbnsfp$primateai$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$primateai$rankscore)
    p <- ifelse (is.null(variant[[1]]$dbnsfp$revel$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$revel$rankscore)
    q <- ifelse (is.null(variant[[1]]$dbnsfp$mutationassessor$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$mutationassessor$rankscore)
    r <- ifelse (is.null(variant[[1]]$dbnsfp$mutationtaster$converted_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$mutationtaster$converted_rankscore)
    s <- ifelse (is.null(variant[[1]]$dbnsfp$polyphen2$hdiv$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$polyphen2$hdiv$rankscore)
    t <- ifelse (is.null(variant[[1]]$dbnsfp$provean$converted_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$provean$converted_rankscore)
    u <- ifelse (is.null(variant[[1]]$dbnsfp$sift$converted_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$sift$converted_rankscore)
    v <- ifelse (is.null(variant[[1]]$dbnsfp$sift4g$converted_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$sift4g$converted_rankscore)
    w <- ifelse (is.null(variant[[1]]$dbnsfp$vest4$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$vest4$rankscore)
    x <- ifelse (is.null(variant[[1]]$dbnsfp$lrt$converted_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$lrt$converted_rankscore)
    y <- ifelse (is.null(variant[[1]]$dbnsfp$fathmm$converted_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$fathmm$converted_rankscore)
    z <- ifelse (is.null(variant[[1]]$dbnsfp$integrated$fitcons_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$integrated$fitcons_rankscore)
    aa <- ifelse (is.null(variant[[1]]$dbnsfp$phastcons$'100way_vertebrate'$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$phastcons$'100way_vertebrate'$rankscore)
    ab <- ifelse (is.null(variant[[1]]$dbnsfp$phastcons$'30way_mammalian'$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$phastcons$'30way_mammalian'$rankscore)
    ac <- ifelse (is.null(variant[[1]]$dbnsfp$phastcons$'17way_primate'$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$phastcons$'17way_primate'$rankscore)
    ad <- ifelse (is.null(variant[[1]]$dbnsfp$phylop$'100way_vertebrate'$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$phylop$'100way_vertebrate'$rankscore)
    ae <- ifelse (is.null(variant[[1]]$dbnsfp$phylop$'17way_primate'$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$phylop$'17way_primate'$rankscore)
    af <- ifelse (is.null(variant[[1]]$dbnsfp$phylop$'30way_mammalian'$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$phylop$'30way_mammalian'$rankscore)
    ag <- ifelse (is.null(variant[[1]]$dbnsfp$siphy_29way$logodds_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$siphy_29way$logodds_rankscore)
    ah <- ifelse (is.null(variant[[1]]$dbnsfp$'gerp++'$rs_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$'gerp++'$rs_rankscore)
    ai <- ifelse (is.null(variant[[1]]$dbnsfp$bayesdel$add_af$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$bayesdel$add_af$rankscore)
    aj <- ifelse (is.null(variant[[1]]$dbnsfp$bstatistic$converted_rankscore)==TRUE, NA, variant[[1]]$dbnsfp$bstatistic$converted_rankscore)
    ak <- ifelse (is.null(variant[[1]]$dbnsfp$clinpred$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$clinpred$rankscore)
    al <- ifelse (is.null(variant[[1]]$dbnsfp$'list-s2'$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$'list-s2'$rankscore)
    am <- ifelse (is.null(variant[[1]]$dbnsfp$metarnn$rankscore)==TRUE, NA, variant[[1]]$dbnsfp$metarnn$rankscore)
    variantList1 <<- c(x, e, b, ag, ah, aa, y, g, ab, af, ac, ae, n, f, j, q, s, i, h, k, u, r, al, ad, ak, am, ai, w, p, l, m, c, t, d, v)
  }
  
  c_palette <- c("#FFFFFF","#000099", "#333399","#6666CC", "#6699CC", "#99CCFF", "#FFFF00", "#FFCC00", "#FF6633", "#FF3300", "#FF3333", "#FF0000")
  
  variant <- getVariant(data[i,1])
  variantFunction()
  variantmatrix[i,]<- c(data[i,3], data[i,2], variantList1)
  
  x <- replace(variantList1, which(is.na(variantList1)), -0.1) # NA-> -0.1
  variantList1 <- c(-0.1,x)
  
  x_seq <- seq(2, 5, length.out = 12)
  variantdf <- data.frame(xval=c(1,x_seq[1:12],x_seq[1:12],x_seq[1:11]),
                          yval=c(1,rep(1,12), rep(1.06,12), rep(1.12,11)), score=round(variantList1*10))
  p <- ggplot(variantdf, aes(x=xval, y=yval, fill=score)) + geom_point(shape=21, colour="black", size=9) # original z=7
  p + scale_fill_gradientn(colours = c_palette) + ylim(0.5,1.5) + theme_classic() +
    theme(axis.text.x = element_blank(),axis.text.y = element_blank()) + 
    theme(axis.title.x = element_blank(), axis.title.y = element_blank()) + 
    theme(axis.ticks = element_blank(), axis.text.y = element_blank()) +
    theme(legend.position = "none") +
  　annotate("text",x=3.5, y=1.20, label=data[i,2], size=6)
  ggsave(filename=paste("figs/", data[i,3], "_", data[i,2], ".png", sep=""), width=5.8, height=5.3, units="in", dpi=300) 
}

variant.df <- data.frame(variantmatrix)
colnames(variant.df) <- var.names
x <- as.matrix(variant.df)
write.csv(x, paste("./figs/", args[2], ".csv", sep=""))
