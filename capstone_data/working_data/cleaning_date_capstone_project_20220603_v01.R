library(tidyverse)
library(readr)
library(lubridate)
library(dplyr)

## Clean and verify data is cleaned using the tidyverse library and dplyr.
## Load the data frames and bind it to a variable data frame.
daily_steps_df <- read_csv("dailySteps_merged.csv")

## Familiarize yourself with the data set by viewing the column names and structure. 
## Check for structural errors (column names are normalized, data types are correct, mislabeled variables, string inconsistencies)
head(daily_steps_df)
colnames(daily_steps_df)
str(daily_steps_df)
typeof(daily_steps_df$date)

## Check unique values and for missing values.
unique(daily_steps_df$id)
unique(daily_steps_df$date)
unique(daily_steps_df$step_total)

## Load the sleepDay csv data frame then bind it to a new data frame variable.
sleep_day_df <- read_csv("sleepDay_merged.csv")

head(sleep_day_df)
str(sleep_day_df)
typeof(sleep_day_df$date)

## Check unique values and for missing values.
unique(sleep_day_df$id)
unique(sleep_day_df$date)
unique(sleep_day_df$total_sleep_records)
unique(sleep_day_df$total_minutes_asleep)
unique(sleep_day_df$total_time_in_bed)

## Check for data irregularities (invalid values, outliers)
summarize_steps <- daily_steps_df %>% 
  summarize(
    min_steps = min(step_total),
    max_steps = max(step_total),
    avg_steps = mean(step_total)
  )
summarize_steps

summarize_sleep <- sleep_day_df %>% 
  summarize(
    min_sleep = min(total_minutes_asleep),
    max_sleep = max(total_minutes_asleep),
    avg_sleep = mean(total_minutes_asleep)
  )
summarize_sleep