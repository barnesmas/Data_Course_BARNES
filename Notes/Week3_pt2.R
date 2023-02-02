# notes week 3 day 2

getwd()
df <- read.csv("Data/rectangles.csv")

df$width <- as.numeric(df$width)

df$area <- df$width * df$length

write.csv(df,file = "./Data/rectangles_clean.csv")



#loading a package if it's already installed

library(tidyverse)

df <- read_csv("./Data/rectangles.csv")
glimpse(df)


# pipe operator
  # The output of the LHS becomes first argument to RHS function.
mean(df$length)
df$length %>% 
  mean() %>% 
  length() %>% 
  class()


df %>%
  names() %>% 
  nchar()

# fix width column
df$width <- df$width %>% as.numeric()
glimpse(df)



df %>% 
  ggplot(aes(x = length, y = width)) +
  geom_point() +
  geom_smooth()


iris %>% names
iris %>% str()  
iris$Species %>% unique()






iris %>% 
  ggplot(aes(x = Species, y = Petal.Length, color = Species)) +
  geom_boxplot() +
  geom_jitter(width = .1, alpha = .25)




iris %>% 
  ggplot(aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(color = "#567FA4") +
  geom_smooth(method = "lm")  + # local moving average curve
  theme_minimal()

