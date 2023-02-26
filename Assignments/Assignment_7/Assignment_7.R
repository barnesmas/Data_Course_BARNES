library(tidyverse)
library(janitor)

df <- read_csv('./Utah_Religions_by_County.csv')
df_clean <- 
df %>% pivot_longer(cols = !c('County', 'Pop_2010', 'Religious'), names_to = c('Religion'), values_to = 'Proportion') %>% 
  clean_names() %>% 
  rename(total_religious = religious) %>% 
  mutate(religion = religion %>% as.factor(), county = county %>% as.factor())


# Explore the cleaned data set with a series of figures (I want to see you exploring the data set)

religions = df_clean$religion %>% unique() # finding unique religions

# “Does population of a county correlate with the proportion of any specific religious group in that county?”

df_clean %>% 
  ggplot( aes(y= pop_2010, x = proportion, color = religion)) +
  facet_wrap(~religion) +
  geom_point() +
  geom_smooth(se = TRUE, method = 'lm')

# this graph is not promising, any linear relationship the graphs have appear to be mostly coincidental than anything.

# lets manually calculate the correlation. 

cor = numeric() # creating an empty vector to store correlation values for every loop
for( i in religions){ 

filtered <- 
df_clean %>% filter(religion == i) # filtering out observations not belonging to that unique religion

cor[i] <- 
cor(x = filtered$pop_2010, y = filtered$proportion) #finding correlation and storing it in the vector.

}

cor.df <- data.frame(religion = names(cor), correlation = unname(cor)) %>% 
  arrange(abs(correlation)) %>% print()


muslim_proportion <- 
  df_clean %>% filter(religion == 'Muslim') %>% arrange(desc(pop_2010))

# it appears population is most highly correlated with the proportion of Muslims with a correlation of0.7592.  however, in context, this makes sense because proportion of Muslims are only non zero in  4 of the 6 most populous counties in Utah. 


# “Does proportion of any specific religion in a given county correlate with the proportion of non-religious people?”

# to answer this question  I think I want to do another for loop, and correlate religious proportion with non religious proportion (which is just 1 - total_religious)


cor = numeric() # creating an empty vector to store correlation values for every loop
for( i in religions){ 
  
  filtered <- 
    df_clean %>% filter(religion == i)  %>% # filtering out observations not belonging to that unique religion
    mutate(non_religious_prop = 1 - total_religious)
  cor[i] <- 
    cor(x = filtered$proportion, y = filtered$non_religious_prop) #finding correlation and storing it in the vector.
  
}
non_religious_cor <-
  data.frame(religion = names(cor), correlation = unname(cor)) %>% 
  arrange(abs(correlation)) %>% print()

# it appears that proportion LDS is highly negatively correlated with proportion non religious, but this makes sense, as in many of the counties, these are the two primary religious groups. It seems the majority of the counties' population is either LDS or Non-Religious as shown by this graph here:

df_clean  %>%  mutate(religion_reduced = case_when(religion == 'LDS' ~ 'LDS', religion == 'Non-Religious' ~ 'Non-Religious', TRUE ~ 'Other')) %>% 
ggplot(aes(x = TRUE, fill = religion_reduced, y = proportion))  +
  geom_bar(stat = 'identity', width = .5) +
  facet_wrap(~county)


# 
# Add comment lines that show your thought processes _____________
df_clean %>% 
ggplot( aes(y= pop_2010, x = proportion)) +
  facet_wrap(~religion) +
  geom_point() +
  geom_smooth(se = TRUE, method = 'lm')


