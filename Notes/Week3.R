# character class
letters
class(letters)
length(letters # number of elements in a vector
rep(letters, 2)
length(class(rep(letters, each = 2)))
rep(letters, each = 2)
rep(letters, each = 2)[20:25]

x <- "1"
x+1
as.numeric(x) + 1
as.character(123) + 1


 y <- c(1:10,"one") # vectors can only be one type.
as.numeric(y)

#numeric class
10
class(10)
class(10L)
length(10)
rep(10,30)
rep(10:15, each = 30)
seq(1,10, length.out = 3)

#factor class
x <- factor(letters)
class(x)
length(x)
levels(x)

z <-  rep(x, each = 50)
length(z)

levels(z)
z # if levels at the bottom, it's a factor

z[1300]

c(z[1300],"A")

as.character(z)
as.numeric(z)




# practicing with dataset
mtcars$mpg
length(mtcars$mpg)

dim(mtcars) # num rows, num columns

mtcars[1,]

mtcars[1:3,1:3]

mtcars[c(1,3),c(1,3)]

head(mtcars)




mtcars$mpg > 21

mtcars[mtcars$mpg > 21,]

mtcars$name <- row.names(mtcars)

dim(mtcars)
 
mtcars[33,] <- as.character(1:13) #adding a new row




1:10


for(i in 1:10){
  
  i + 5
  print(i+5)
  
}


for(i in letters){
  print(paste("your dad = ", i))
  
}


myfiles = list.files("Data", pattern = ".csv", full.names = TRUE)


for(i in myfiles){
  print(readLines(i,n=1))
}
# Paul Bybee Biology department




