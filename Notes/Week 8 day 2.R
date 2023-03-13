Sci-Hub is your friend

machine learning models explained: mlu explained

# the ponts are reality

# we are tryingto model reality

library(tidyverse)
library(easystats)

mpg %>% names

mod1 <- glm(data = mpg, 
            formula = cty~ class)

mpg %>% 
  filter(class == 'compact') %>% 
  pluck('cty') %>% 
  mean()

summary(mod1)

mod2 <- glm(data = mpg,
            formula = cty ~ class + displ)

summary(mod2)

mod3 <- glm(data = mpg,
            formula = cty ~ class *displ)

summary(mod3)


mod4 <- glm(data = mpg,
            formula = cty~class * displ * cyl)

summary(mod4)

mod5 <- glm(data = mpg,
            formula = cty ~ class * displ * cyl * drv)

summary(mod5)
mpg$class %>% unique

rmse(mod1)
rmse(mod2)
rmse(mod3)
rmse(mod4)
rmse(mod5)

compare_performance(mod1, mod2, mod3, mod4, mod5) %>% plot


library(MASS)



step <- MASS::stepAIC(mod5)

step$formula

mod6 <- glm(data = mpg,
            formula = step$formula)

compare_performance(mod1, mod2, mod3, mod4, mod5, mod6) %>% plot




mpg %>% 
  ggplot(aes(x = displ, y = cty, color = factor(cyl))) +
           geom_smooth(method = 'glm')
check_model(mod6)
