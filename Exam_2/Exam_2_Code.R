library(tidyverse)
library(janitor)
library(easystats)
library(readxl)
library(MASS)

df <- read_csv('./unicef-u5mr.csv') %>%  janitor::clean_names()
view(df)

# to clean this data we are going to want to have the columns, country name, year, death rate, continent, and region
# we are going to need to pivot longer to accomplish this.

names(df) <- 
names(df) %>% str_remove('u5mr_')

df_clean <- 
df %>% pivot_longer(cols = -c(country_name, continent, region), names_to = 'year', values_to = 'rate') %>% 
  mutate(rate = rate %>% as.numeric,
         year = as.numeric(year),
         country = factor(country_name),
         continent = factor(continent), 
         region = factor(region)) %>% select(continent, region, country, year, rate)


# plotting 
p <- 
df_clean %>% 
  ggplot(aes(x = year, y = rate, color = country)) +
  geom_line(show.legend = FALSE) +
  facet_wrap(~continent)

p2 <- 
p +
  labs(title = 'Under Five Mortality Rate by Country',
       subtitle = "Faceted by Continent",
       y = 'U5MR',
       x = 'Year') +
  theme_bw() + scale_color_manual(values =  rep('black', nlevels(df_clean$country)))



# 4. Save this plot as LASTNAME_Plot_1.png (5 pts)
ggsave('Barnes_Plot_1.png', plot = p2)

# 5. Create another plot that shows the mean U5MR for all the countries within a given continent at each year (20 pts)

p3 <- 
df_clean %>% group_by(year,continent) %>% summarize(mean_rate = mean(rate, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = mean_rate, color = continent)) +
  geom_line(size = 2)


p4 <- 
  p3 +
  labs(title = 'Mean Under 5 Mortality Rate by Continent',
       y = 'Mean U5MR', 
       x = 'Year', color = 'Continent')
  #6. Save that plot as LASTNAME_Plot_2.png (5 pts) 

ggsave('Barnes_Plot_2.png', plot = p4)




# 7. Create three models of U5MR (20 pts)

# - mod1 should account for only Year

mod1 <- 
  glm(data = df_clean, formula = rate ~ year)
summary(mod1)

# - mod2 should account for Year and Continent

mod2 <- 
  glm(data = df_clean, formula = rate ~ year + continent)
summary(mod2)

# - mod3 should account for Year, Continent, and their interaction term

mod3 <- 
  glm(data = df_clean, formula = rate ~ year * continent)
summary(mod3)

# 8. Compare the three models with respect to their performance
# 
# - Your code should do the comparing
# - Include a comment line explaining which of these three models you think is best

compare_performance(mod1, mod2, mod3)


# model 3 has the largest R^2 value of .640, which means it explains the largest amount of variation.
# model 3 also has the lowest Root mean square error. 



# 9. Plot the 3 models’ predictions like so: (10 pts)

df_modeled <- 
df_clean %>% 
  mutate(fit1 = predict(mod1, newdata = df_clean[]), 
         fit2 = predict(mod2, newdata = df_clean[]), 
         fit3 = predict(mod3, newdata = df_clean[]), 
         actual = rate) %>% 
  select(continent, region, country, year, actual, fit1, fit2, fit3) %>% 
  pivot_longer(cols = c(fit1, fit2, fit3), names_to = "model", values_to = "fitted") %>% 
  mutate(model = as.factor(model))

p5 <- 
df_modeled %>% 
    ggplot(aes(color = continent)) +
    facet_wrap(~model) +
    # geom_point(aes(x = year, y = actual), alpha = .3) + #), color = 'black') +
    geom_line(aes(x = year, y = fitted), size = 1.5) +
    theme_bw()


ggsave('Barnes_Plot_3.png', plot = p5)


# 10. BONUS - Using your preferred model, predict what the U5MR would be for Ecuador in the year 2020. The real value for Ecuador for 2020 was 13 under-5 deaths per 1000 live births. How far off was your model prediction???

# Looking at models and ecuador

df_modeled %>% 
  ggplot(aes(color = continent)) +
  facet_wrap(~model) +
  geom_point(data = df_modeled %>% filter(country == 'Ecuador'),
             aes(x = year, y = actual)) +
  geom_line(aes(x = year, y = fitted, color = continent), size = 1.5) +
  theme_bw()

predict(mod1, newdata = data.frame(continent = 'Americas', region = 'South America', conuntry = 'Ecuador', year = 2020))

filter(df_clean,  country == 'Ecuador') %>% arrange(year, )

check_model(mod3)

## None of these models are good. They are linear models, and the data for ecuador looks to be decreasing in a non linear fashion. Which means all the models will be wrong near the ends. The model that looks least wrong for Ecuador in years approaching 2020 is mod 1, giving a predicted rate of 11.44224. This is off by 1.55776.


# Even though mod3 has a lower RMSE over all, the prediction for Ecuador in 2020 is -10.58018 which doesn't even make sense. and is off by 22.
predict(mod3, newdata = data.frame(continent = 'Americas', region = 'South America', country = 'Ecuador', year = 2020))



       