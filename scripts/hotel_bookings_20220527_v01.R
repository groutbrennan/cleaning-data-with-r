library(tidyverse)
library(skimr)
library(janitor)
library(dplyr)

bookings_df <- read_csv("hotel_bookings.csv")

head(bookings_df)
str(bookings_df)
colnames(bookings_df)
skim_without_charts(bookings_df)
View(bookings_df)

## Only interested in: hotel, is_canceled, lead_time
trimmed_df <- bookings_df %>% 
  select(hotel, is_canceled, lead_time)

head(trimmed_df)

## Combine columns using the unite() function.
example_df <- bookings_df %>% 
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")
head(example_df)

## Use the mutate() function to make changes to your columns.
## Create a new column that summed up all the adults, children, and babies on a reservation for the total number of people.
acb_df <- bookings_df %>% 
  mutate(guests = adults, children, babies)
str(acb_df)

## Calculate the total number of canceled bookings and the average lead time for booking using summarize() function.
example_df <- bookings_df %>% 
  summarize(number_canceled = sum(is_canceled), average_lead_time = mean(lead_time))
head(example_df)  

## Find the hotel that host the most children.
children_df <- bookings_df %>%
  select(hotel, children) %>% 
  group_by(hotel) %>% 
  drop_na() %>% 
  summarize(sum_children = sum(children))
head(children_df)

