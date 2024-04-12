# Hannah Joseph
# Group Project

library(tidyverse)
library(leaflet)

# reading csv documents:

setwd("C:/Users/Hannah/Desktop/Global Change Science- R coding")
getwd()

ipeds <- read_csv("IPEDS_combined_MEPANCFL_v4.csv")
ebird <- read_csv("EBbird_IPEDS_UNITID_MEPANCFL_Jan23-May23_v3.csv")

View(ipeds)
View(ebird)

# Calculating species richness:
species_richness <-
  ebird |>
  group_by(UNITID) |> 
  mutate(species_richness = n_distinct(`SAMPLING EVENT IDENTIFIER`))

# Joining datasets:
ipeds_join <- left_join(species_richness, ipeds, by = "UNITID")

View(ipeds_join)


# Plots:

# Species Richness vs. Impervious Surface (Group)

ipeds_join |> 
  ggplot(aes(x = mean_impervious, y = species_richness)) +
  geom_point(aes(color = UNITID)) +
  labs(
    title = " The Relationship between Species richness and Impervious Surface",
    x = "Mean of Impervious Surfaces", 
    y = "Species Richness"
  )

# There is no correlation between Species Richness and Impervious Surfaces. 

# Demographics vs. Species Richness:

# Another hypothesis that we would like to test is how demographics correlate with
# species richness. We hypothesize that an increase of admittance correlates with 
# an increase of species richness.

ipeds_join |> 
  select(species_richness, DVADM01, DVADM02, UNITID) |> 
  ggplot(
    aes(x = DVADM01, y = DVADM02, color = species_richness) # The variables used are DVADM01 which is the percent admitted for males, DVADM02 for percent admitted for females, and Species richness
  ) +
  geom_point() +
  labs(
    title = "Species Richness across Percent Admittance for Males and Females",
    x = "Percent Admitted for Males",
    y = "Percent Admitted for Females",
    color = "Species Richness"
  )

# From the plot above, there is a negative correlation between species richness for the amount of admittance in males and females. 
# There is higher species richness for lower (0%) of admission in both males and females. 