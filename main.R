library(tidyverse)
library(forcats)
library(here)

### Objective: Use gss_cat data to compare TV hours watched by marital status

gss_cat   ## sample data from GSS

tv_hours_table <- gss_cat |> 
  group_by(marital) |> 
  summarise(tv_hrs = mean(tvhours, na.rm=TRUE))

## combine No answer and Never married into a new level called Other

class(tv_hours_table$marital)

dat2 <- gss_cat |> 
  mutate(marital = fct_recode(
    marital,
    Other = "No answer",
    Other = "Never married"
  )) |> 
  group_by(marital) |> 
  summarise(tv_hrs = mean(tvhours, na.rm = TRUE))

dat2

write_csv(tv_hours_table, here("tv_hours_by_marital.csv"))
write_csv(dat2, here("tv_hours_by_marital_2.csv"))

