# Week 5 Day 2

# making ugly plots

library(tidyverse)
install.packages('ggimage')
library(ggimage)
library(palmerpenguins)
install.packages('gganimate')
library(gganimate)
install.packages('plotly')
library(plotly)

url <-  'https://th.bing.com/th/id/R.98e45f703d2cff56af9083a53c1c4206?rik=Af6ycBh3yVw4lA&riu=http%3a%2f%2f3.bp.blogspot.com%2f-zL2WDo90vQQ%2fTv296iDAPFI%2fAAAAAAAAEFQ%2f0OIGsDjHqj4%2fs1600%2fEmperor-Penguin-07.jpg&ehk=zmes%2fFECng4OivReghNKpTRi5MJlb%2f08Lk21PoL7DGk%3d&risl=&pid=ImgRaw&r=0'
penguins %>% ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_image(aes(image = url))

p <- 
penguins %>% 
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_col()

penguins %>% names

p +
  transition_time(year) +
  labs(title = 'Year: {frame_time}')



ggplotly(p)
