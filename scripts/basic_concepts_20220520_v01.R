install.packages("tidyverse")
library(lubridate)
library(tidyverse)

head(diamonds)
str(diamonds)
glimpse(diamonds)

colnames(diamonds)

rename(diamonds, carat_new = carat)
colnames(diamonds)

rename(diamonds, carat_new = carat, cut_new = cut)

summarize(diamonds, mean_carat = mean(carat))

ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + 
  geom_point() + 
  facet_wrap(~cut)
