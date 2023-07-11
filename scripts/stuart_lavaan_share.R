library(stuart)
library(lavaan)
library(reshape2)
library(parallel)
library(tidyverse)

### STUART 

# data <- read_csv("../data/share_data.csv")%>%
#   pivot_wider(names_from = word, values_from = score)%>%
#   select( -subjID)

#fs<-list(f=names(data))

#irt_100 <- gene(data, fs, 100,item.invariance = 'ess.equivalent' , cores=50)
#saveRDS(irt_100, "../saves/irt_100.rds")

irt_100 <- readRDS("../saves/irt_100.rds")

fitMeasures(irt_100$final)%>%as_tibble(rownames = "index")%>%
  filter(index == "rmsea" | index == "cfi" | index == "srmr")

# index value     
# <chr> <lvn.vctr>
# 1 cfi   0.80914155
# 2 rmsea 0.03804701
# 3 srmr  0.08348969

### LAVAAN

items_genes_100 <- irt_100$solution$f%>%
  as_tibble(rownames = "item")%>%
  filter(value == TRUE)%>%
  pull(item)

select_data <- read_csv("../data/share_data.csv")%>%
  filter(word %in% items_genes_100)%>%
  pivot_wider(names_from = word, values_from = score)%>%
  select( -subjID)

model100genex <- paste(paste0("1*",items_genes_100, "+"), collapse = " ")

model100gene <- paste0("f =~", substr(model100genex, 1, nchar(model100genex)-1))

freq100gene <- sem(model100gene, select_data, ordered =TRUE, parameterization = "theta")
 
fit_in_100gene <- fitMeasures(freq100gene)%>%as_tibble(rownames = "index")%>%
  filter(index == "rmsea" | index == "cfi" | index == "srmr")%>%
  mutate(no_items = 100)

# index value      no_items
# <chr> <lvn.vctr>    <dbl>
# 1 cfi   0.9738902       100
# 2 rmsea 0.0450743       100
# 3 srmr  0.1123646       100
