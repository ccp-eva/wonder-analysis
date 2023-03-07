library(tidyverse)
library(brms)

data <- read_csv("../data/wonder_data.csv")%>%
  mutate(age_group = factor(substr(age, 1,1)))

irt_dat <- data%>%
  select(subjID, word, score, sex, aoa_rating_german)

## 1PL Model

prior_1pl <- 
  prior("normal(0, 1)", class = "sd", group = "subjID") + 
  prior("normal(0, 3)", class = "sd", group = "word")

irt1 <- brm(
  data = irt_dat,
  family = bernoulli(),
  score ~ 1 + (1 | word) + (1 | subjID),
  prior = prior_1pl,
  control = list(adapt_delta = 0.95, max_treedepth = 20),
  cores = 6,
  chains = 6,
  iter = 16000,
  threads = threading(8), #to speed things up, comment out if not on a cluster
  backend = "cmdstanr" #to speed things up, comment out if not on a cluster
)

saveRDS(irt1, "../saves/irt1.rds")

irt1 <- add_criterion(
  irt1,
  criterion = c("loo","waic"),
  cores = 2,
  ndraws = 2000
)

saveRDS(irt1, "../saves/irt1.rds")