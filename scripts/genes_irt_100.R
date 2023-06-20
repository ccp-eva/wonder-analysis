library(stuart)
library(lavaan)
library(reshape2)
library(parallel)

#setwd("~/Dropbox/Projekte/Research/Manuel_Bohn")
df<-read.csv("../data/wonder_irt_data.csv")
df_wide<-dcast(df, subjID +sex ~ word, value.var = "score")
names(df_wide) <- c("id", "sex", paste0("y", 1:270))
fs<-list(f=names(df_wide)[c(3:272)])
tmp <- df_wide[, 3:272] |> lapply(as.ordered) |> as.data.frame()

irt_100 <- gene(tmp, fs, 100,item.invariance = 'ess.equivalent' , cores=50)
saveRDS(irt_100, "../saves/irt_100.rds")