install.packages("SimDesign")

library(SimDesign)

## Find bias of a temperature weather forcast using the bias() function with the SimDesign package.
actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
predicted_temp <- c(67.9, 69, 71.5, 70, 67, 69)
bias(actual_temp, predicted_temp)
## Answer: 0.7166667 bias - good because its close to 0 bias.

## Find bias of predicted sales and actual sales using the bias() function.
actual_sales <- c(150, 203, 137, 247, 116, 287)
predicted_sales <- c(200, 300, 150, 250, 150, 300)
bias(actual_sales, predicted_sales)
## Answer: -35 - not great because its pretty far from 0 bias.

