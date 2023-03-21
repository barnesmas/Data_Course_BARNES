library(tidyverse)
library(easystats)
library(modelr)
library(janitor)
library(palmerpenguins)
# tyring new models

# formula = y~ ns(x,2)
# formula = y ~ poly(x,2)

read_csv('URL')

# webscraping

library(curl)
curl('download link')

# r is really competant at bio informatics but not rhoguh CRAN

# Try BIOCONDUCTO

BiocManager::install("")



# what is a model?

# simplified mathematical relationship between variable.names(
   
 names(penguins)

 mod1 <- 
 glm(data = penguins,
     formula = body_mass_g ~ sex + species + flipper_length_mm) 

 mod1 %>% summary

 
 check_model(mod1)
 
 
 
 # classification
 # logistic regression
 
 # logical (T/F)
 
 penguins <- 
 penguins %>% 
   mutate(male = case_when(sex == 'male' ~ TRUE,
                           sex == 'female' ~ FALSE))

 
 
 mod2 <- 
   glm(data = penguins,
       formula = male ~ body_mass_g + flipper_length_mm + bill_length_mm + species,
       family = 'binomial')

 summary(mod2) 

 
 add_predictions(penguins, mod2, type = 'response') %>%
   ggplot(aes(x = body_mass_g, y = pred, color = species)) +
   geom_smooth()
 
 mod3 <- 
   glm(data = penguins,
       formula = male ~ (body_mass_g + flipper_length_mm + bill_length_mm ) * species + island + year,
       family = 'binomial')

 add_predictions(penguins, mod3, type = 'response') %>%
   ggplot(aes(x = body_mass_g, y = pred, color = species)) +
   geom_smooth()
 
 mod4 <- 
   glm(data = penguins,
       formula = male ~ (body_mass_g + flipper_length_mm + bill_length_mm ) * species + island + year,
       family = 'binomial')
 
 add_predictions(penguins, mod4, type = 'response') %>%
   ggplot(aes(x = body_mass_g, y = pred, color = species)) +
   geom_smooth()


 
 
 
 # ordinal regression
 
 
 
 