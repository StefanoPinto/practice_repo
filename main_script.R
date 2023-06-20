library(tidyverse)
library(palmerpenguins)
library(janitor)


# Cleaning
penguins_clean <- penguins %>% 
  clean_names() %>% 
  na.omit() %>% 
  map_at(.at = c("species", "island"), .f = ~tolower(.x)) %>% 
  as_tibble()

# Visuals  
penguins_clean %>% 
  select(species, island, body_mass_g) %>% 
  group_by(species, island) %>% 
  summarize(mean_mass = mean(body_mass_g)) %>% 
  ggplot(aes(species, island, fill = mean_mass)) +
  geom_tile(col = "white") +
  theme_bw(base_size = 14) +
  theme(legend.position = "bottom")


# Created a "cleaning" branch and cleaned the data. Guess this branch
# can be deleted now