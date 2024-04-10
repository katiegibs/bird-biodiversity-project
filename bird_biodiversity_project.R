# Katie Gibson
# Question 2

library(tidyverse)

setwd("/Users/katiegibson/bird_biodiversity_project")
getwd()

ipeds <- read_csv("ipeds_data.csv")
ebird <- read_csv("ebird_data.csv")

View(ipeds)
View(ebird)

ipeds_join <- left_join(ebird, ipeds, by = "UNITID")

View(ipeds_join)

species_richness <- 
  ebird |> 
  group_by(UNITID) |> 
  mutate(species_richness = n_distinct(`SAMPLING EVENT IDENTIFIER`))

view(species_richness)

