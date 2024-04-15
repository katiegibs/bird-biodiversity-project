# Typed by Katie but this is Constanca's graph!

ipeds_join |> 
  ggplot(aes(species_richness, color = `STATE CODE`, fill = `STATE CODE`)) +
  geom_density(aes(alpha = 0.1))
