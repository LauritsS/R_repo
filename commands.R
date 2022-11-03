#Load the tidyverse this session:
library(tidyverse)


#Exercise 9 - Load the dataset:
trade_2018_per_quarter <- read_csv("trade.csv")


#Exercise 10 - Explore the dataframe:
dim(trade_2018_per_quarter)
names(trade_2018_per_quarter)
head(trade_2018_per_quarter)
glimpse(trade_2018_per_quarter)
summary(trade_2018_per_quarter)


#Exercise 11 - Total import:
trade_2018_per_quarter <- mutate(trade_2018_per_quarter,
                                 import = import_q1 + import_q2 + import_q3 + import_q4)


#Exercise 12 - Total export:
trade_2018_per_quarter <- mutate(trade_2018_per_quarter,
                                 export = export_q1 + export_q2 + export_q3 + export_q4)


#Exercise 13 - Select relevant columns:
trade_2018 <- select(trade_2018_per_quarter, region, export, import)


#Exercise 14 - Caclulate trade differentials:
trade_2018 <- mutate(trade_2018, differential = export - import)


#Exercise 15 - Summarise trade differentials:
summarise(trade_2018, mean_differential = mean(differential))


#Exercise 16 - label trade deficits:
trade_2018 <- mutate(trade_2018, deficit = export < import)


#Exercise 17 - group by deficits:
trade_2018 <- group_by(trade_2018, deficit)


#Exercise 18 - resummarise:
summarise(trade_2018, mean_differential = mean(differential))


#Exercise 19 - Count the deficits:
summarise(trade_2018, n = n())


#Exercise 20 - Combine summaries:
summarise(trade_2018, n = n(),
                      mean_differential = mean(differential))


#Exercise 21 - Relabel deficits:
trade_2018 <- ungroup(trade_2018)
trade_2018 <- mutate(trade_2018, deficit = ifelse(deficit,"deficit","surplus"))
trade_2018 <- group_by(trade_2018, deficit)
summarise(trade_2018, n = n(),
          mean_differential = mean(differential))
