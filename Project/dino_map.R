library(tidyverse)
library(ggmap)
library(ggimage)
library(png)

df <- read_csv('./Project/fossil_north_america.csv', skip = 18)  # removes info rows
names(df) <- df[1,] # assigns column names as first column
df <- df[-1,] # removes title column
df <- df[,!duplicated(names(df))] # removes repeat Country column
df$lat <-  df$lat %>% as.numeric()
df$lng <-  df$lng %>% as.numeric()
df$state

df[c('min', 'max','average')] <- sapply(df[c('min', 'max','average')],as.numeric) # converting some character columns to numeric


dinosaur <- df[df$class %in% c('Ornithischia','Saurischia'),] # filters out non dinosaurs

dinosaur %>% 
ggplot(mapping = aes(x = lat, y = lng)) +
  get_map()

# getting verification
ggmap::register_google(key = "AIzaSyD1AUh8M6mxnL3OLCmYvqjbpD2I9OXbBz0", write = TRUE)

dinosaur$is.Trex <- dinosaur$identified_name == "Tyrannosaurus rex" 

dinosaur$image <- ifelse(dinosaur$identified_name == "Tyrannosaurus rex", './Media/t-rex-skull.png', 
                         ifelse( dinosaur$identified_name %>% startsWith('Triceratops'), './Media/tric skull.png', NA))



# loading the google map to write uponhttp://127.0.0.1:30899/graphics/plot_zoom_png?width=1504&height=955
map <- get_googlemap(center = c(-106, 48), zoom =4, maptype = 'hybrid')

select(dinosaur, identified_name) %>% unique()


map %>% ggmap() +
  geom_point(data = dinosaur, aes(x = lng, y = lat, color = family, size = 1000, shape = )) +
  geom_image(data = dinosaur[!is.na(dinosaur$image),], aes(image = image, x = lng, y = lat), size = .25)  +
  ggtitle(label = 'DINOSAUR FOSSIL LOCATOR', subtitle = 'Where Can I find a TREX?') + 
  xlab('LONGITUDE') +
  ylab('LATITUDE') +
  theme(title = element_text(color = 'grey'),
        axis.title.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = .5,
                                   face = 'italic'),

        axis.text.y = element_text(size = 40,
                                   angle = 220,
                                   face = 'bold',
                                   color = 'purple'),
        axis.text.x= element_text(size = 40,
                                   angle = 100,
                                   face = 'bold',
                                   color = 'pink'),
        plot.background = element_rect(fill = 'green',
                                       color = 'cyan',
                                       linewidth = 15),
        panel.grid.major.x = element_line(color = 'cyan',
                                          linetype = 4,
                                          lineend = 'round',
                                          linewidth = 6),
        strip.background = element_rect(fill = 'red', color = 'brown'),
        legend.background = element_rect(fill = 'brown', linewidth = 40, color = 'orange'),
        legend.text = element_text(color = 'magenta', angle = 120))
ggsave('ugly_dino_map.png', height = 8, width = 10)
