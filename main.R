library(tidyverse)
library(here)

gss_cat

tv_hours_table <- gss_cat |> 
  group_by(marital) |> 
  summarise(tv_hrs = mean(tvhours, na.rm=TRUE))

write_csv(tv_hours_table, here("tv_hours_by_marital.csv"))
