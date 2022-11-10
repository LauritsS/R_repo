library(tidyverse)

trade_2018_per_quarter <- read_csv("trade.csv") |>
  mutate(import = import_q1 + import_q2 + import_q3 + import_q4) |>
  mutate(export = export_q1 + export_q2 + export_q3 + export_q4)
                                 
trade_2018 <- trade_2018_per_quarter |>
                select(region, export, import) |>
                mutate(differential = export - import) |>
                mutate(deficit = export < import) |>
                mutate(deficit = ifelse(deficit,"deficit","surplus")) |>
                group_by(deficit)

summarise(trade_2018, n = n(),
          mean_differential = mean(differential))

