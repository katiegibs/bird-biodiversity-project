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

# Try this code to see if this answers the question about exploring the relationship between species richness and impervious surfaces. - Hannah
# Not sure if it does tbh:
ipeds_join |> 
  ggplot(aes(x = species_richness, y = mean_impervious)) +
  geom_point(aes(color = UNITID)) +
  labs(
    title = " The Relationship between Species richness and  Impervious Surface",
    x = "Mean of Impervious Surfaces", 
    y = "Species Richness"
  )
