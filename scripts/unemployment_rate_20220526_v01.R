library(tidyverse)
library(ggplot2)

## Import unemployment rate csv spreadsheet.
unemployed_df <- read_csv("unemp_rate.csv")
View(unemployed_df)

##  Create a new data frame using the "select" function based on gender, unemp rate, country name.
gender_unemployed_df <- select(unemployed_df, gender, unemployment_rate, country_name, date)
colnames(gender_unemployed_df)
head(gender_unemployed_df)

## Filter out the "ALL" gender values to only analyze the "MALE" "FEMALE" values.
## Group by the country name.
## Show highest unemployment rate first.
filter_gender <- gender_unemployed_df %>% 
  filter(!gender=='ALL') %>%
  arrange(desc(unemployment_rate))

head(filter_gender)

ggplot(filter_gender, aes(x=date, y=unemployment_rate)) +
  geom_line()