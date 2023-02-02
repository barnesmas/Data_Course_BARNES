### playing with

library(tidyverse)
# install.packages("palmerpenguins") # get a new data set
library(palmerpenguins)
#install.packages('GGally')
library(GGally)

penguins %>% names()

#find your outcome variables
      #flipper_lenth_mm


# what predictor variables?

# island, # species, sex, year


penguins$year %>% unique()

ggpairs(penguins)

?ggplot


penguins %>%# data to use
  ggplot(aes(y = flipper_length_mm, x = island, fill = species )) + # set 'global' mapping # which variables to which aspects of the plot
    geom_violin()



p <- 
penguins[!is.na(penguins$sex),] %>%# data to use
  ggplot(aes(x = flipper_length_mm, fill = species)) + 
  geom_density(alpha = .5) +
  facet_wrap(~sex * island)

# data
# how to map variables to # of a plot
# what to draw
# facets
# scales
# customize them

class(p)

p + theme_bw()
names(penguins)


# make a plot of body mass g with some x axis


penguins[!is.na(penguins$sex),] %>% 
ggplot(mapping = aes(x = bill_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  facet_wrap(~year*sex) +
  theme_update() +
  geom_smooth(method = 'lm', se = FALSE)
  

p <- 
penguins %>% 
  ggplot(aes(x = bill_length_mm, y = body_mass_g, #size = bill_depth_mm,
             color = species)) +
  geom_point(alpha = .25) +
 #geom_line(size = 1, aes(linetype = sex), color = 'black')
  geom_smooth(method = 'lm', se = FALSE)
#?geom_smooth() 

p +
  theme_minimal() +
  theme(axis.title = element_text(face = 'bold')) +
  labs(x = 'Bill Length (mm)', 
       y = 'Body Mass (g)', 
       color = 'Species', title = 'Penguin body mass',
       subtitle = 'whatever',
       caption = 'Data from palmerpenguins R package') +
  scale_color_manual(values = c('#fc0dbc','#cb9129', 'red'))

