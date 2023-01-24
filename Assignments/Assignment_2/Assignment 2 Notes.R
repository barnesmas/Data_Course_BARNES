# Assignment 2

#finding files
list.files()

# recursively
list.files(recursive = TRUE)

# with a search pattern

list.files(recursive = T,
           pattern = '.csv')

csvs <- list.files(recursive = T,
                  pattern = '.csv')


csvs[1]

# square bracket notation lets you pick elements from an object.
airlines <- csvs[1] # character vector.. 1st element

readLines(airlines) # readLines let's you read in 1 line at a time.
# it makes a character vector where each line is an element

read.csv(airlines) # pays attention to commas to split lines into columns

airlines <- read.csv(airlines)


# numeric vectors

x <- 1:10
length(x) * 2
length(5) # everything in r is vectorized, so even "5" is a vector of lenght 1

y = 2:11
x
y

x + y
x * y
x / y
x^y
(x^y)^x


letters
LETTERS

letters + LETTERS
paste0(letters, LETTERS)


# expressions (logical)

sum(x>3)
TRUE
FALSE
TRUE + FALSE
TRUE + TRUE
TRUE / FALSE

x >= 3 # greater than or equal to 
x <= 5 # less than or equal to 5

x == 5 # is equal to



wingspan <- read.csv("./Data/wingspan_vs_mass.csv")
names(wingspan) # show names of elements
names(x) # no names in this vector


wingspan$mass >= 70
sum(wingspan$mass >= 70)

wingspan$giant <- wingspan$mass >= 70



plot(x = wingspan$wingspan, y = wingspan$mass, col = wingspan$giant)










#  assignment 2

# 4.
csv_files <- list.files(path = "Data", pattern = ".csv")

# 5. 
length(csv_files)

# 6.
df <- read.csv("Data/wingspan_vs_mass.csv")

# 7.
?head
head(x = df, n = 5)

# 8.
list.files(recursive = TRUE, path = "Data",
           pattern = "^b")
# 
# list.files(recursive = TRUE, path = "Data",
#            pattern = "csv$")

# regular expressions
# ^ $ = begins with / ending


# 9.
b <- list.files(recursive = TRUE, path = "Data",
           pattern = "^b", full.names = TRUE)

# readLines(b[1], n = 1)
# readLines(b[2], n = 1)
# readLines(b[3], n = 1)

# for loops
# redo this task using for loops

for( i in 1:length(b)){
  print(readLines(con = b[i],n = 1))
}

#10. 

csv_files <- list.files(path = "Data", pattern = ".csv$", full.names = TRUE)

for( i in 1:length(csv_files)){
  print(readLines(con = csv_files[i],n = 1))
}

getwd()
list.files(full.names = F)




