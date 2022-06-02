library(readr)
library(dplyr)
library(tidyverse)

## Create flavors_df data frame by importing flavors_of_cacao.csv spreadsheet.
flavors_df <- read_csv("flavors_of_cacao.csv")
head(flavors_df)
colnames(flavors_df)

best_trimmed_flavors_df <-
  trimmed_flavors_df %>% 
  filter(Cocoa.Percent >= "75%") %>% 
  filter(Rating >= 3.5)
