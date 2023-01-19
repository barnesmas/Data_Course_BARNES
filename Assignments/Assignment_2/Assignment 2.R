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






