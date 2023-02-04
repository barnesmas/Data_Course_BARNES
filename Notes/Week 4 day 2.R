# Messing around

df <- sleep
df %>% 
ggplot(.,mapping = aes(x = extra, color = group, fill = group)) +
  geom_density(alpha = .5) +
  theme_test()
              

names(df)


df %>% group_by(group) %>% 
  
  summarise(iris, mean())
summarise_each(iris, funs(mean))

p2 <- 
p +
  labs(x = "Body Mass (g)",
       y = "Density",
       color = "Species") +
  theme(axis.text.x = element_text(angle = 90,
                                   hjust = 1,
                                   vjust = .5,
                                   face = 'italic'),
        axis.text.y = element_text(size = 20,
                                   angle = 180,
                                   face = 'bold',
                                   color = 'pink'),
        plot.background = element_rect(fill = 'Orange',
                                       color = 'blue',
                                       linewidth = 15),
        panel.grid.major.x = element_line(color = 'blue',
                                          linetype = 4,
                                          lineend = 'round',
                                          linewidth = 6),
        strip.background = element_rect(fill = 'red', color = 'brown'))
ggsave(p2, filename = './ugly.png', height = 6, width = 6)

p2 +
  scale_color_manual(values = c('black','white','yellow')) +
  scale_y_reverse() +
  #scale_y_log10()  +
  #coord_polar()
  #coord_flip()
  #coord_cartesian(ylim = c(0,.002))
  theme(strip.text = element_text(face = 'bold', size = 12),
        legend.text = element_text(face = 'italic'),
        legend.background = element_rect(fill = 'pink'),
        legend.position = 'bottom',
        axis.title = element_text(angle = 60)) +
  geom_image()

library(ggimage)
        