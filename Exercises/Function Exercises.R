# Function Exercises

prefix_check <- function(string, prefix) {
  substr(string, 1, nchar(prefix)) == prefix
}
vector_snip <- function(x) {
  if (length(x) <= 1) return(NULL)
  x[-length(x)]
}
fill_over_length_x <- function(x, y) {
  rep(y, length.out = length(x))
}
f1('Hello', 'He')

substr()

x = c(1,2,4,4,1,1,1,1)

f2(x)

y = c(1,2,3)
f3(x,y)


# || or
# && and
# any() for any
# all() for all.

