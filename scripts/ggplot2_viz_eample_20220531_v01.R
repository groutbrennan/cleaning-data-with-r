library(ggplot2)
library(palmerpenguins)
library(tidyverse)

hotel_bookings <- read_csv("hotel_bookings.csv")
head(hotel_bookings)

ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x=stays_in_weekend_nights, y=children))

## Viz penguin data.
## Use shape, color, size aesthetics.
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, shape=species, color=species, size=species))

## If you want to keep it black and white, use the alpha aesthetic which gives each point a different shade of dark.
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, alpha=species))

## Change the aesthetic points all to purple by placing the color aesthetic outside of the aes function.
## If we want to change the appearance of our overall plot without regard to specific variables, we write code outside of the aes function.
ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g), color="purple")

## Use the geom_smooth() to turn the viz to a smooth line instead of scatter points.
ggplot(data = penguins)+
  geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g))

## Show a scatter plot with a smooth line going through to see trajectory of data.
ggplot(data = penguins)+
  geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g))

## geom_jitter helps make a scatter plot easier to read by not overlapping the points as much.
ggplot(data = penguins)+
  geom_jitter(mapping=aes(x=flipper_length_mm, y=body_mass_g))
  
## Create a bar chart to compare diamond cuts from the diamond data set.
ggplot(data=diamonds) +
  geom_bar(mapping = aes(x=cut))

## Create a colorful stacked bar chart comparing cut and clarity using the color and fill aesthetics.
ggplot(data=diamonds) +
  geom_bar(mapping = aes(x=cut, color=cut, fill=clarity))

## Can use facet_wrap() function to break out individual subsets into smaller groups..
ggplot(data = penguins) +
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  facet_wrap(~species)

## Can use facet_grid() function to break out subsets into smaller groups into grids.
ggplot(data = penguins) +
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  facet_grid(sex~species)

## Can use facet_grid() function to break out the subset smaller groups into grids.
ggplot(data = penguins) +
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  facet_grid(~sex)

## Figure out the top distribution_channel and the number of bookings for each distribution type.
head(hotel_bookings)
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x=distribution_channel, fill=deposit_type))

## Create separate charts for each deposit type and market segment to help understand the differences. 
## Use the facet_wrap() function to break out subsets of groups into their own charts.
## Change the angle of the x axis text to 45 degrees using the theme(axis.text.x()) functions.
head(hotel_bookings)
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x=distribution_channel)) +
  facet_wrap(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

## facet_grid() function does the same as facet_wrap but will include plots even if they are empty.
head(hotel_bookings)
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x=distribution_channel)) +
  facet_grid(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

## Put all of this into one chart and explore the differences by deposit type and market segment.
head(hotel_bookings)
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x=distribution_channel)) +
  facet_wrap(~deposit_type~market_segment) +
  theme(axis.text.x = element_text(angle = 45))