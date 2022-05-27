data("ToothGrowth")
View(ToothGrowth)
install.packages('dplyr')
library(dplyr)

filtered_tg <- filter(ToothGrowth, dose==0.5)
View(filtered_tg)

arrange(filtered_tg, len)

arrange(filter(ToothGrowth, dose==0.5), len)

## Use pipes %>%  to call different functions.
## Think of pipes %>%  as "and then" do this
## Easy way to query data just like SQL but using pipes %>% 
## Hit "ctrl + shift + m" for a keyboard shortcut

filtered_toothgrowth <- ToothGrowth %>% ## "and then"
  filter(dose==0.5) %>% ## "and then"
  group_by(supp) %>% ## "and then"
  summarize(mean_len = mean(len,na.rm = T),.group="drop")

filter_teeth <- ToothGrowth %>% ## "and then"
  filter(dose==1.0) %>% ## "and then"
  group_by(supp) %>% ## "and then"
  arrange(desc(len))

View(filter_teeth)
