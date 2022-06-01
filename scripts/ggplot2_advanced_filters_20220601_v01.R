library(ggplot2)
library(tidyverse)
library(readr)
library(dplyr)

## Import hotel_bookings.csv and bind it to hotel_bookings variable.
hotel_bookings <- read_csv("hotel_bookings.csv")

head(hotel_bookings)
colnames(hotel_bookings)

ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x=lead_time, y=children))

## Find which hotel has the highest bookings by market segment, using facet_wrap() function to break out each market_segment subset.
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x=hotel)) +
  facet_wrap(~market_segment)

## Create a plot that shows the relationship between lead time and guests traveling with children for online bookings at city hotels.
## Use the filter() function from the tidyverse to create a data set that only includes the data you want.
onlineta_city_hotels_v2 <- hotel_bookings %>% 
  filter(hotel=="City Hotel") %>% 
  filter(market_segment=="Online TA")

View(onlineta_city_hotels_v2)

## Create a viz using ggplot2 of new filtered data frame onlineta_city_hotels_V2
ggplot(data = onlineta_city_hotels_v2) +
  geom_point(mapping = aes(x=lead_time, y=children))

## Add annotations to the chart plot to give stakeholders a better undrestanding of the data.
## Use the labs() function to add a title, subtitle, and caption to the chart plot.
ggplot(data = penguins) +
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  labs(title = "Palmer Penguins: Body Mass vs. Flipper Length", subtitle = "Sample of Three Penguin Species", caption = "Data collected by Dr. Kristen Gorman")

## Add text to the chart plot next to points on the scatterplot.
## Use the annotate() function to add text to the chart plot; choose the x and y coordinates you want to place the text label.
ggplot(data = penguins) +
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  labs(title = "Palmer Penguins: Body Mass vs. Flipper Length", subtitle = "Sample of Three Penguin Species", caption = "Data collected by Dr. Kristen Gorman") +
  annotate("text", x=220, y=3500, label="The Gentoos are the largest", color="purple", fontface="bold", size=4.5, angle=25)

## Since the code is getting pretty long, we can make the main chart plot a variable.
base_penguin_plot <- ggplot(data = penguins) +
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  labs(title = "Palmer Penguins: Body Mass vs. Flipper Length", subtitle = "Sample of Three Penguin Species", caption = "Data collected by Dr. Kristen Gorman")

## Create a variable for the annotation so you can reuse it if necessary.
penguin_annotation <- annotate("text", x=220, y=3500, label="The Gentoos are the largest", color="purple", fontface="bold", size=4.5, angle=25)

## Then add any layers to your base variable char plot p.
base_penguin_plot + penguin_annotation

head(hotel_bookings)
colnames(hotel_bookings)

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x=market_segment)) +
  facet_wrap(~hotel) + 
  labs(title = "Market Segments vs Hotel Bookings")

## Find the min and max dates for the duration of this data set.
mindate <-min(hotel_bookings$arrival_date_year)
maxdate <- max(hotel_bookings$arrival_date_year)

## Add label title, caption, y & y axis labels.
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x=market_segment)) +
  facet_wrap(~hotel) + 
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title = "Comparison of market segments by hotel type for hotel bookings", 
       caption = paste0("Data from: ", mindate, " to ", maxdate),
       x="Market Segment",
       y="Number of Bookings")

## Save the plot as a png and specify the size using the width and height of 16x8.
ggsave('hotel_booking_chart.png',
       width = 16,
       height = 8)
