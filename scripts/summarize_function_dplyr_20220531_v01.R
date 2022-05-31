install.packages('Tmisc')
library(Tmisc)
library(tidyr)
library(dplyr)
library(ggplot2)
data(quartet)
View(quartet)

quartet %>% 
  group_by(set) %>% 
  summarize(mean(x), sd(x), mean(y), cor(x,y))

ggplot(quartet, aes(x, y)) + geom_point() + geom_smooth(method=lm, se=FALSE) + facet_wrap(~set)
