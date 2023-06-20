library(tidyverse)
library(palmerpenguins)
library(janitor)

penguins_clean <- penguins %>% 
  clean_names() %>% 
  na.omit() %>% 
  map_at(.at = c("species", "island"), .f = ~tolower(.x)) %>% 
  as_tibble()
