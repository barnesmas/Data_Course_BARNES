library(tidyverse)
library(palmerpenguins)

df = penguins
# mean body mass for each speies
df <- df[!is.na(df$body_mass_g),]

df%>% 
  group_by(species) %>%  summarise(meanmass = mean(body_mass_g, na.rm =T))


adelie <- df[df$species == 'Adelie',]                
gentoo <- df[df$species == 'Gentoo',]  
chinstrap <- df[df$species == 'Chinstrap',]  


means <- numeric()
for(i in unique(penguins$species) %>% as.character()){
  
  ss <- penguins[penguins$species == i,]
  means[i] <- 
  ss$body_mass_g %>% mean(na.rm = TRUE)
  
}
    )

#dplyr verbs:
# group_by() / summarize
# arrange()
# filter (filters rows!)

penguins$sex %>% unique()
test <- 
df%>% 
  filter(!is.na(sex)) %>% 
  group_by(species, sex) %>%  summarise(mean_body_mass = mean(body_mass_g, na.rm =T), 
                                        max_body_mass = max(body_mass_g, na.rm = T)) %>% 
  arrange(max_body_mass %>% desc())

# overwrite levels with new order

levels(test$species)
factor(test$species, levels = c('Gentoo','Chinstrap','Adelie'))

test$species = factor(test$species, levels = c('Gentoo','Chinstrap','Adelie'))

test %>% 
  ggplot(aes(x = species, y = max_body_mass, fill = sex)) +
  geom_col(position = 'dodge')


# skimr
install.packages('skimr')
library(skimr)
skim(penguins)



# filter penguins where sex is not NA and where the penguin body mass > 4000

penguins %>% 
  filter(!is.na(sex) &
         body_mass_g > 4000 &
           year == 2007) %>% 
  group_by(species,sex) %>% 
  summarize(smallest_fatty = min(body_mass_g))


