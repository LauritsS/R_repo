library(tidyverse)
trade_2018_per_quarter <- read_csv("trade.csv")


trade_2018_per_quarter <- mutate(trade_2018_per_quarter,
                                 import = import_q1 + import_q2 + import_q3 + import_q4)


trade_2018_per_quarter <- mutate(trade_2018_per_quarter,
                                 export = export_q1 + export_q2 + export_q3 + export_q4)

trade_2018 <- select(trade_2018_per_quarter, region, export, import)

trade_2018 <- mutate(trade_2018, differential = export - import)

trade_2018 <- mutate(trade_2018, deficit = export < import)

trade_2018 <- mutate(trade_2018, deficit = ifelse(deficit,"deficit","surplus"))
trade_2018 <- group_by(trade_2018, deficit)
summarise(trade_2018, n = n(),
          mean_differential = mean(differential))

trade_2018
