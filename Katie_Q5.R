# Katie Gibson
# Graph showing the distribution of species richness with color according to 
# whether or not the school holds a land grant.

ipeds_join |> 
  filter(!is.na(LANDGRNT)) |> 
  mutate(
    landgrnt_categorical = cut(
      LANDGRNT, 
      breaks = c(-Inf, 1.5, Inf), 
      labels = c("Has a land grant", "Does not have a land grant")
    )
  ) |> 
  ggplot(aes(species_richness, fill = landgrnt_categorical)) +
  geom_histogram() +
  labs(
    title = "Observations of species richness at land grant vs. non-land grant 
    institutions",
    x = "Species richness",
    y = "Count of observations",
    fill = "Land grant status"
  )
