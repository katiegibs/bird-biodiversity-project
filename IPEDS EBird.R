# Hannah Joseph
# Group Project

library(tidyverse)

setwd("C:/Users/Hannah/Desktop/Global Change Science- R coding")
getwd()

ipeds <- read_csv("IPEDS_combined_MEPANCFL_v4.csv")
ebird <- read_csv("EBbird_IPEDS_UNITID_MEPANCFL_Jan23-May23_v3.csv")

View(ipeds)
View(ebird)

ipeds_join <- left_join(ebird, ipeds, by = "UNITID")

View(ipeds_join)

species_richness <-
  ipeds_join |>
  group_by(`SAMPLING EVENT IDENTIFIER`, UNITID) |> 
  mutate(species_richness = n_distinct(`SCIENTIFIC NAME`))

View(species_richness)

