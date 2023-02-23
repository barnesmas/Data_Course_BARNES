library(tidyverse)
library(janitor)
library(gganimate)
#install.packages('gifski')
library(gifski)
dat <- read_csv("../../Data/BioLog_Plate_Data.csv") # you may need to modify this path to fit where this file is stored relative to your assignment 6 script


# # Your task is to Write an R script that:
# 
# 1.  Cleans this data into tidy (long) form
# 2.  Creates a new column specifying whether a sample is from soil or water
# 3.  Generates a plot that matches this one (note just plotting dilution == 0.1):
dat <- 
dat %>% clean_names()

dat_clean <- 
dat %>% pivot_longer(cols = c('hr_24','hr_48','hr_144')) %>% 
  mutate(name = str_remove(name, 'hr_')) %>% 
  mutate(time = as.numeric(name)) %>% 
  select(-name) %>% 
  mutate(absorbance = value) %>% 
  select(-value) %>% 
  mutate(sample_type = ifelse(sample_id %in% c('Clear_Creek','Waste_Water'), 'water', 'soil'))

dat_clean %>% 
  filter(dilution == .1) %>% 
  ggplot(aes(x = time, y = absorbance, color = sample_type)) +
  geom_smooth(se = FALSE) +
  facet_wrap(~substrate)

ggsave('absorbance_v_time_plot.png', width = 20, height = 10)


# 4.  Generates an animated plot that matches this one (absorbance values are mean of all 3 replicates for each group):
#   
#   This plot is just showing values for the substrate "Itaconic Acid"
p <- 
dat_clean %>% filter(substrate == 'Itaconic Acid') %>% 
  group_by(time, sample_id, dilution) %>% 
  summarize(mean_absorbance = mean(absorbance)) %>% 
  ggplot(aes(x = time, y = mean_absorbance, color = sample_id)) +
  geom_line() +
  facet_grid(~dilution) +
  transition_reveal(time)

animate(p, nframes = 100, renderer = gifski_renderer("animated_mean_absorbance_plot.gif"))
