library(ggplot2)
library(tidyverse)

## Create a data frame from scratch
## Data frames are like spreadsheets and SQL tables
## Data frames are made up of columns

## First create the vectors you want to create the data frames out of.
## Each vector should be the same number of values
## Each vector should be made up of the same data type
names <- c("brennan", "richard", "steven", "frank")
age <- c(36, 67, 33, 65)

## Create a data frame of the two vectors "names, age" using the data.frame() function.
people <- data.frame(names, age)

## Use head() function to check out the first 5 rows and all columns.
head(people)

## use the structure str() function to see the structure of the data frame including the datat types.
str(people)

## Use the glimpse() function for a summary of the data frame.
glimpse(people)

## Use the column names colnames() function to just see the columns in the data frame.
colnames(people)

## Use the mututate function to create a new variable using the data from your data frame.
mutate(people, age_in_20_years = age + 20)

fruit_name <- c("strawberry", "banana", "orange", "grape", "apple")
fruit_ranking <- c(1, 3, 2, 4, 5)

fruits <- data.frame(fruit_name, fruit_ranking)

head(fruits)
str(fruits)
glimpse(fruits)

colnames(fruits)
