## fossil data

library(tidyverse)

df <- read_csv('./Project/fossil_north_america.csv', skip = 18)  # removes info rows
names(df) <- df[1,] # assigns column names as first column
df <- df[-1,] # removes title column
df <- df[,!duplicated(names(df))] # removes repeat Country column

df[c('min', 'max','average')] <- sapply(df[c('min', 'max','average')],as.numeric) # converting some character columns to


dinosaur <- df[df$class %in% c('Ornithischia','Saurischia'),] # filters out non dinosaurs

 numeric
sapply(df, class) # checking the clas of the new columns




dinosaur$family == "Ceratopsidae"
Ceratopsid = dinosaur[dinosaur$family == "Ceratopsidae",]

length(unique(Ceratopsid$specimen_no))
length(unique(Ceratopsid$accepted_name))

filter(dinosaur, genus == 'Allosaurus')$family

dinosaur <- 
  dinosaur %>% 
mutate(family = ifelse(genus == 'Allosaurus', 'Allosaurid',family))  # putting the allosaurus  speciesinto Allosaurid family

filter(dinosaur, family == "NO_FAMILY_SPECIFIED")$genus %>% unique()http://127.0.0.1:29127/graphics/plot_zoom_png?width=1504&height=932
dinosaur$identified_


unique(dinosaur$family)

filter(dinosaur, specimen_part %in% c('femur', 'tibia'), 
       measurement_type == 'length', 
       family %in% c('Tyrannosauridae','Allosaurid', "Coelophysidae", "Dromaeosauridae"  )) %>% 
  ggplot(aes(x = reorder(accepted_name, average), y = average, color = accepted_name)) +
  geom_boxplot() +
  ylab(label = "Length (mm)") +
  xlab(label = "Species") + 
  ggtitle(label = 'Leg bone measures of North American Therapods') +
  facet_wrap(~specimen_part*measurement_type) + 
  theme(axis.title.y = element_text(), 
        axis.text.x = element_text(face = 'italic',
                                   angle = 90, 
                                   vjust = .25,
                                   hjust = 1),
        legend.position = 'none',
        axis.title = element_text(size = 16)) 

ggsave('leg_bone.png',path = './Assignments/Assignment_4/',width = 10, height = 5)

  
  


