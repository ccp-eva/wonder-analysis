library(brms)
library(tidyverse)

## load data and models

data <- read_csv("../data/wonder_data.csv")%>%
  mutate(age_group = factor(substr(age, 1,1)))

irt_dat_sel <- data%>%
  select(subjID, word, score, sex, aoa_rating_german)%>%
  filter(word %in% readRDS("../saves/fit_selected_items.rds"))

irt1_fit_sel <- readRDS("../saves/irt1_fit_sel.rds")

rasch_fit_mode_fit_sel <- readRDS("../saves/rasch_fit_mode_fit_sel.rds")

irt2PL_fit_sel <- readRDS("../saves/irt2PL_fit_sel.rds")

## make indices

items <-data%>%filter(word %in% readRDS("../saves/fit_selected_items.rds"))%>%distinct(word)%>%pull(word)
easiness_1PL_fit_sel <- ranef(irt1_fit_sel)$word%>%as_tibble(rownames = "item") %>%pull(Estimate.Intercept)
infit_fit_sel <- rasch_fit_mode_fit_sel %>% filter(fit_index == "infit")%>%arrange(word)%>% pull(mode)
outfit_fit_sel <- rasch_fit_mode_fit_sel %>% filter(fit_index == "outfit")%>%arrange(word)%>% pull(mode)
disc_2PL_fit_sel <- coef(irt2PL_fit_sel)$word[, , "logalpha_Intercept"] %>% as_tibble(rownames = "item")%>%pull(Estimate)

# source algorithm
source("../scripts/helper/simulated_annealing.R")

## fit models and save person parameters

determine_size <- tibble()

for (j in c(1:5)) {

  for (i in c(50, 75,100,125,150,175,200,225,250)) {

    sim <- simulated_annealing_rasch(i)

    sel <- items[unlist(sim$best_subset) == TRUE]

    sub_dat <- irt_dat_sel%>%filter(word %in% sel)

    m1PL <- update(irt1_fit_sel, newdata =sub_dat, chains = 6, cores = 6, threads = threading(8), backend = "cmdstanr")
  	
    row <- ranef(m1PL)$subjID%>%as_tibble(rownames = "subjID")%>%mutate(size = i, items = list(sel), iter = j, type = "with 2PL disc params")

    determine_size <- bind_rows(determine_size, row)

    saveRDS(determine_size, "../saves/determine_size_w2PL.rds")
  }
  
}

saveRDS(determine_size, "../saves/determine_size_w2PL.rds")
