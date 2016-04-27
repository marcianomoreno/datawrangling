#
# Data Wrangling in R for SQL Programmers
# Author: Marciano Moreno, marciano_moreno@acm.org
#
# tidyR.R - Demostración de tidyR
# Basado en la viñeta Tidy data de Hadley Wickham
# https://cran.rstudio.com/web/packages/tidyr/vignettes/tidy-data.html
#
install.packages("tidyr")
install.packages("dplyr")
install.packages("devtools")
library(tidyr)
library(dplyr)
library(devtools)

#Optional ->
#devtools::install_github("hadley/tidy-data")

preg <- read.csv("datasets/tidyr-vignette/preg.csv", stringsAsFactors = FALSE)
preg

preg2 <- read.csv("datasets/tidyr-vignette/preg2.csv", stringsAsFactors = FALSE)
preg2

preg2 <- preg %>% 
  gather(treatment, n, treatmenta:treatmentb) %>% 
  mutate(treatment = gsub("treatment", "", treatment)) %>%
  arrange(name, treatment)
preg2

pew <- tbl_df(read.csv("datasets/tidyr-vignette/pew.csv", stringsAsFactors = FALSE, check.names = FALSE))
pew
pew[5,1]
pew %>% 
  gather(income, frequency, -religion)

billboard <- tbl_df(read.csv("datasets/tidyr-vignette/billboard.csv", stringsAsFactors = FALSE))
billboard
str(billboard)
billboard2 <- billboard %>% 
  gather(week, rank, which(colnames(billboard) %in% paste0("wk", 1:76)))
billboard2

billboard3 <- billboard2 %>%
  mutate(
    week = extract_numeric(week),
    date = as.Date(date.entered) + 7 * (week - 1)) %>%
  select(-date.entered)
billboard3

billboard3 %>% arrange(artist, track, week)

billboard3 %>% arrange(date, rank)

# Multiple variables stored in one column
tb <- tbl_df(read.csv("datasets/tidyr-vignette/tb.csv", stringsAsFactors = FALSE))
tb

# Gather non-variable columns
tb2 <- tb %>% 
  gather(demo, n, -iso2, -year, na.rm = TRUE)
tb2

tb3 <- tb2 %>% 
  separate(demo, c("age", "sex"), 1)
tb3

