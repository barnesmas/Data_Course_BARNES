# class notes from Jan 17, 2023

# hashtag means everything to right on that line is for humans, won't be read as r code

# remember tab can autocomplete
# ctrl + shift + C for automatically comment highlighted
# ctrl + alt + B will run everything "before" cursor
# Alt - will create an assign operator for you

#data frame: 2-dimensional, has rows and columns
# vector 1-dimensions, a bunch of numbers, kind of like a list

# Week 2 - File paths etc.


getwd()
list.files(path = "Data", 
           pattern = ".csv",
           recursive = TRUE, # digs into the files
           full.names = TRUE) # shows full path

# Give me the full path to the wingspan file.

path <- 
  list.files(path = "Data",
           recursive = TRUE,
           pattern = 'wingspan',
           full.names = T, 
           ignore.case = TRUE)


wingspan <- read.csv(path)

m <- wingspan$mass
v <- wingspan$velocity
s <- wingspan$variety


max(m)
min(m)
mean(m)
summary(m)
cumsum(m)
plot(cumsum(m))
plot(m)
plot(sort(m))


plot(x = wingspan$wingspan,y = wingspan$mass)

cor(x = wingspan$wingspan,y = wingspan$mass)
