# Week 8

# model is a simple representation of reality

# in our case it's an equation

glm() # generalized linear model

glm(data = df, 
    formula = y ~ x) # ~ as a function of, y response, x predictor

  formula = height ~ sex)

?glm()

# estimate ( coefficient)
# p value


library(tidyverse)
mpg %>% view(method =)


# response variable: cty

names(mpg)

mpg %>% 
  ggplot(aes(x = displ, y = cty)) + geom_point() +
  geom_smooth(method = 'glm')


model <- glm(data = mpg, 
    formula = cty ~ displ)

summary(model)

df <- data.frame(displ = 1:10)
predict(model, newdata = df)


model <- glm(data = mpg, 
             formula = cty ~ displ + cyl + drv)

summary(model)

df <- data.frame(displ = 1:10, cyl = 5, drv = 'f')
predict(model, newdata = df)


mpg %>% 
  ggplot(aes(x = displ, y = cty, color = drv)) + 
  geom_point() +
  geom_smooth(method = 'glm') +
  facet_wrap(~cyl)



# y = mx + b


library(easystats)

compare_models()

compare_performance()

