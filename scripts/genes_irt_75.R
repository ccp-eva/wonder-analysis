library(tidyverse)
library(stuart)
library(lavaan)
library(reshape2)
library(parallel)


data <- read_csv("../data/wonder_data.csv")%>%
  filter(word %in% readRDS("../saves/fit_selected_items.rds"))%>%
  select(subjID, word, score, sex)%>%
  pivot_wider(names_from = word, values_from = score)%>%
  select( -subjID, -sex)

fs<-list(f=names(data))

irt_75 <- gene(data, fs, 75,item.invariance = 'ess.equivalent' , cores=50)
saveRDS(irt_75, "../saves/irt_75.rds")