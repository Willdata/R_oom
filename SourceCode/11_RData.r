# Check where we are
getwd()

# get data
tomato <- read.table(file = "http://www.jaredlander.com/data/Tomato%20First.csv", header = TRUE, sep = ",") 
head(tomato)

# save data.frame "tomato" into the drive where R is currently locating 
save(tomato, file = "tomato.rdata")  # also we can use this filename extension "tomato.RData"

# remove data from memory
rm(tomato)

# check if data exists in the memory of R currently
head(tomato)  # basically, we will see the error message

# read data from rdata file
load("tomato.rdata")

# check whether it is existing or not
head(tomato)

# save several objects into a RData file
# create some objects
n <- 20
r <- 1:10
w <- data.frame(n, r)

# check it out
n
r
w

# save objects into desktop
save(n, r, w, file = "/Users/user/Desktop/multiple.rdata") # now we will see a RData file on the desktop

# remove objects
rm(n, r, w)

# check it out
n
r
w

# read them from RData file
load("/Users/user/Desktop/multiple.rdata")

# check 
n
r
w

# use data() to load diamonda data set which is from ggplot2 package
require(ggplot2)
data(diamonds)
head(diamonds)

