library(tidyverse)
library(skimr)
library(janitor)

hotel_bookings <- read_csv("hotel_bookings.csv")
head(hotel_bookings)
str(hotel_bookings)
skim_without_charts(hotel_bookings)
colnames(hotel_bookings)

## Find the max lead time using the arrange() function.
max_lead_df <- hotel_bookings %>% 
  select(lead_time) %>% 
  arrange(desc(lead_time))
head(max_lead_df)

## Can also just use the max() and min() functions with the dollar sign '$' to find the max and min of a data frame.
max(hotel_bookings$lead_time)
min(hotel_bookings$lead_time)
mean(hotel_bookings$lead_time)

## Filter out only City Hotel in the data frame.
hotel_bookings_city <- filter(hotel_bookings, hotel_bookings$hotel=="City Hotel")
head(hotel_bookings_city)
## Find the average hotel lead times just for the City Hotel.
mean(hotel_bookings_city$lead_time)

## See how the hotels are different using the group_by() and summarise() functions.
hotel_summary <-
  hotel_bookings %>% 
  group_by(hotel) %>% 
  summarise(average_lead_time=mean(lead_time),
            min_lead_time=min(lead_time),
            max_lead_time=max(lead_time))
head(hotel_summary)
