# Hannah Joseph
# Group Project

library(tidyverse)

# Reading csv documents:

setwd("C:/Users/Hannah/Desktop/Global Change Science- R coding")
getwd()

ipeds <- read_csv("IPEDS_combined_MEPANCFL_v4.csv")
ebird <- read_csv("EBbird_IPEDS_UNITID_MEPANCFL_Jan23-May23_v3.csv")

View(ipeds)
View(ebird)

# Calculating species richness:
species_richness <-
  ebird |>
  group_by(UNITID, `SAMPLING EVENT IDENTIFIER`) |> 
  mutate(species_richness = n_distinct(`SCIENTIFIC NAME`), na.rm = FALSE)

# Joining data-sets:
ipeds_join <- left_join(species_richness, ipeds, by = "UNITID")

# Evaluating the relationship between Species Richness vs. Impervious Surface:

ipeds_join |> 
  group_by(UNITID) |> 
  ggplot(aes(x = species_richness, y = mean_impervious)) +
  geom_point(aes(color = species_richness)) +
  geom_smooth() +
  labs(
    title = " The Relationship between Species richness and Impervious Surface",
    x = "Species Richness", 
    y = "Impervious Surfaces", 
    caption = "Data is from IPEDS and Ebird"
  )

# Our hypothesis is that species richness will decrease if there is an increase in impervious surfaces.
# From the plot shown, there is a correlation between Species Richness and Impervious Surfaces. 
# This shows that when there are high impervious surfaces, there is low species richness. However,
# when there are low averages for impervious surfaces, there is a high species richness. This shows that
# species richness is affected by impervious surfaces, and that our hypothesis was correct. 


# Demographics vs. Species Richness:

# Another hypothesis that we would like to test is how species richness is impacted by increased rate of enrollment. 
# We hypothesize that an increase of enrollment correlates with a decrease of species richness.

ipeds_join |> 
  group_by(species_richness, UNITID) |> 
  ggplot(
    aes(x = ENRTOT, y = species_richness) # The variables used are ENRTOT, which is the total enrollment of both males and females.
  ) +
  geom_point(aes(color = species_richness))+
  geom_smooth() + 
  labs(
    title = "The relationship between Species Richness and Total Enrollment",
    subtitle = "To investigate whether higher enrollment decreases species richness",
    x = "Total Enrollment",
    y = "Species Richness",
    color = "Species Richness",
    caption = "Data is from IPEDS and Ebird"
  )

# From the data shown, it appears that there is high species richness for low enrollment rates.
# This shows that species richness is negatively affected with high enrollment rates. 

