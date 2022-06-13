## Analyze data
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)

## Import data frames used for analysis.
steps_sleep_df <- read_csv("joined_steps_days_20220603_v03.csv")
head(steps_sleep_df)
colnames(steps_sleep_df)

mindate <- min(steps_sleep_df$date)
maxdate <- max(steps_sleep_df$date)

ggplot(data = steps_sleep_df) +
  geom_smooth(mapping = aes(x=step_total, y=total_minutes_asleep)) +
  geom_point(mapping = aes(x=step_total, y=total_minutes_asleep)) +
  labs(title = "Tracked Steps vs Tracked Sleep",
       subtitle = "Comparison of people who tracked their daily steps and  their nightly sleep times.",
       caption = paste0("Data from: ", mindate, " to ", maxdate),
       x="Total Steps",
       y="Total Sleeping Minutes"
       )
