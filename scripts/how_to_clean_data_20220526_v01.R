library(skimr)
library(janitor)
library(here)
library(dplyr)
library(palmerpenguins)
library(tidyverse)

## Find the data summary without the data frame information using skim_without_charts() function.
skim_without_charts(penguins)

glimpse(penguins)
head(penguins)

## Select only the species of penguins using a pipe and select() function.
## select() is good for pulling a subset of variables from a large data set.
penguins %>% 
  select(species)

## Rename a column using the rename() function.
penguins %>% 
  rename(island_new=island)

## Make all column names uppercase
rename_with(penguins,toupper)

## Make all column names lowercase
rename_with(penguins,tolower)

## Clean column names to ensure only characters, numbers, and underscores in the names
clean_names(penguins)

## Sort penguins by bill length using arrange() function
## Add a minus (-) sign before bill_length_mm to sort by descending order.
penguins %>% arrange(-bill_length_mm)

## Create a new data frame penguins2 with bill_length_mm sorted descending first.
penguins2 <- penguins %>%  arrange(-bill_length_mm)
View(penguins2)

## Get a summary of the average bill length of penguins per island.
penguins %>%  
  group_by(island) %>% 
  drop_na() %>% 
  summarize(mean_bill_length_mm = mean(bill_length_mm))

## Find the max bill length of penguins at each island.
penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarize(max_bill_length_mm = max(bill_length_mm))

## Find the max and mean of penguins on each island, group by species and island.
penguins %>% 
  group_by(species, island) %>% 
  drop_na() %>% 
  summarize(max_bl = max(bill_length_mm), mean_bl = mean(bill_length_mm))

## Filter only Adelie penguin species. 
penguins %>% 
  filter(species == "Adelie")

