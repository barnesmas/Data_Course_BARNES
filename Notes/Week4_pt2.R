library(tidyverse)
library(palmerpenguins)

penguins %>% names()

penguins %>% 
  ggplot(aes(x=sex, y = body_mass_g)) +
  geom_boxplot()
ggsave('./my_penguin_plot.png', width = 12, height = 2, dpi = 150)


p <-
penguins %>% 
  ggplot(aes(x = body_mass_g, color = species)) +
  geom_density() +
  facet_wrap(~sex)

ggsave('./my_penguin_plot2.png', width = 12, height = 2, dpi = 150)

p
