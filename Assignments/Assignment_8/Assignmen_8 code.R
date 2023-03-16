library(tidyverse)
library(easystats)
library(modelr)


# At last, your assignment!
#   Make a new Rproj and Rscript in your personal Assignment_8 directory and work from there.
# Write a script that:
#   loads the “/Data/mushroom_growth.csv” data set

df <- read_csv('../../Data/mushroom_growth.csv')
names(df)
# creates several plots exploring relationships between the response and predictors


# plot 0
ggplot(data = df, aes(x = Nitrogen, y = GrowthRate)) +
  geom_point()


# plot 1
  ggplot(data = df, aes(x = Species, y = GrowthRate)) +
    geom_point()
  
# plot 2 
  ggplot(data = df, aes(col = Species, x = Temperature,  y = GrowthRate)) +
    geom_point() +
    geom_smooth(se = F)
  
# plot 3
  ggplot(data = df, aes(x = Nitrogen,  y = GrowthRate, color = Humidity)) +
    geom_point() +
    geom_smooth(se = F) + 
    facet_grid(~Temperature)
  
  # plot 4
  ggplot(data = df, aes(x = Nitrogen,  y = GrowthRate, color = Humidity)) +
    geom_point() +
    geom_smooth(se = F) + 
    facet_wrap(~Temperature * Light)
  
  # plot 5
  ggplot(data = df, aes(x = Nitrogen,  y = GrowthRate, color = Humidity)) +
    geom_point() +
    geom_smooth(se = F) + 
    facet_wrap(~Temperature * Light * Species)
  
  
  
# defines at least 4 models that explain the dependent variable “GrowthRate”
# calculates the mean sq. error of each model
# selects the best model you tried
# adds predictions based on new hypothetical values for the independent variables used in your model
  
  RMSE_mod <- c()
  mod1 <-
    glm(data = df, GrowthRate ~ Temperature * Light * Species + Nitrogen + Humidity)
  
  RMSE_mod['mod1'] <- performance(mod1)$RMSE
  df_new <- mutate(df, mod1_pred = add_predictions(df, mod1)$pred)
  summary(mod1)
  
  check_model(mod1)
  
  
  mod2 <- 
    glm(data = df, GrowthRate ~ Temperature * Light * Species * Nitrogen * Humidity)
  RMSE_mod['mod2'] <- performance(mod2)$RMSE
  df_new <- mutate(df_new, mod2_pred = add_predictions(df, mod2)$pred)
  summary(mod2)
  
  check_model(mod2)
  
  mod3 <- 
    glm(data = df, GrowthRate ~ Temperature * Light * Species * I(Nitrogen^2)* Humidity)
  RMSE_mod['mod3'] <- performance(mod3)$RMSE
  df_new <- mutate(df_new, mod3_pred = add_predictions(df, mod3)$pred)
  summary(mod3)
  
  check_model(mod3)
    
  
unique(df$Species)
unique(df$Light)
unique(df$Nitrogen)
unique(df$Humidity)
unique(df$Temperature)






# plots these predictions alongside the real data


df_new %>% pivot_longer(cols = c('GrowthRate','mod1_pred', 'mod2_pred', 'mod3_pred'), names_to = 'model') %>% filter(model != 'GrowthRate') %>% 
ggplot( aes(x = Nitrogen,  y = value, color = model, shape = Humidity)) +
  geom_point(data = df, aes(y = GrowthRate, shape = Humidity, x = Nitrogen), color = 'black') +
  geom_smooth(se = F) + 
  facet_wrap(~Temperature * Light * Species)


# the black dots are the actual observations, while the green blue and red are the models predictions. 

# Upload responses to the following as a numbered plaintext document to Canvas:
#   Are any of your predicted response values from your best model scientifically meaningless? Explain.
# In your plots, did you find any non-linear relationships? Do a bit of research online and give a link to at least one resource explaining how to deal with modeling non-linear relationships in R.
# Write the code you would use to model the data found in “/Data/non_linear_relationship.csv” with a linear model (there are a few ways of doing this)


