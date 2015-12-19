x <- c(1,2,3,4,5,6,7,8,9,10)
x

x * 3
x + 3
x - 3
x/4
x^2
sqrt(x)  # sqrt(x) == x^0.5

1:10
10:1
-2:3
5:7

#create two vectors with same length
x <- 1:10
y <- -5:4
x + y
x - y
x * y
x/y
x^y
length(x); length(y)
length(x + y)

x + c(1, 2)
x + c(1, 2, 3) # error, long vector length must be a multiple of short vector length

x <= 5
x > y
x < y

x <- 10:1
y <- -4:5
any(x < y)
all(x < y)

sport <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
nchar(sport)
nchar(y)  # negative mark is also a character

x[1]
x[1:2]
x[c(1, 5)]

#use "key-value" method to name the line of values
c(One = "a", Two = "i", Three = "r")

#declare a ector
w <- 1:3

#name the elements of the vector
names(w) <- c("a", "b", "c")
w

#Factor Vector
sport.2 <- c(sport, "Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Baseball")
sport.2.factor <- as.factor(sport.2)
sport.2.factor
as.numeric(sport.2.factor)

#factor with order
factor(x = c("High School", "College", "Master", "Doctorate"),
       levels = c("High School", "College", "Master", "Doctorate"),
       ordered = TRUE)