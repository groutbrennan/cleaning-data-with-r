library(ggplot2)
library(palmerpenguins)
library(tidyverse)

hotel_bookings <- read_csv("hotel_bookings.csv")
head(hotel_bookings)

ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x=stays_in_weekend_nights, y=children))
