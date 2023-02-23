# Week 7 Day 1


library(tidyverse)
# install.packages("janitor")
library(janitor)

df <- read_csv('./Data/Bird_Measurements.csv') %>%
  clean_names() %>% # from janitor package
  select(-ends_with('_n'))

male <- 
df %>%
  select(starts_with('m_'),
         species_number,
         species_name,
         english_name,
         clutch_size,
         egg_mass,
         mating_system, family) %>% 
  mutate(sex = 'male')

female <- 
  df %>%
  select(starts_with('f_'),
         species_number,
         species_name,
         english_name,
         clutch_size,
         egg_mass,
         mating_system, family) %>% 
  mutate(sex = 'female')

unsexed <- 
  df %>%
  select(starts_with('unsexed_'),
         species_number,
         species_name,
         english_name,
         clutch_size,
         egg_mass,
         mating_system, family) %>% 
  mutate(sex = 'unsexed')

#clean up names
names(male) <- 
names(male) %>% 
str_remove('^m_')

names(female) <- 
  names(female) %>% 
  str_remove('^f_')

names(unsexed) <- 
  names(unsexed) %>% 
  str_remove('^unsexed_')


# join them back together
clean <- 
male %>% 
full_join(female) %>% 
  full_join(unsexed) %>% 
  mutate(family = as.factor(family),
         mating_system = as.factor(mating_system),
         species_number = as.factor(species_number))
  

clean %>% 
  filter(!is.na(mating_system)) %>% 
  ggplot(aes(x=mating_system, y = bill)) +
  geom_boxplot()


library(skimr)

complete_enough
skim(clean) %>% 


  df %>% 
  filter(complete_rate > .75) %>% 
  names()




# plot salary (not comp) by rank and tier
df <- 
read_csv('./Data/FacultySalaries_1995.csv') %>% 
clean_names() %>% select(-contains('comp')) %>% 
  select(-contains('all'))



df %>% pivot_longer(cols = c(avg_full_prof_salary, 'avg_assoc_prof_salary', 'avg_full_prof_sallary'))



df %>% 
  ggplot(aes(x = ))


