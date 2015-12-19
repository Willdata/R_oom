# create a list
list(1, 2, 3)

# create a list with only one element which has three elements inside
list(c(1, 2, 3))

# create a list with two elements
(list3 <- list(c(1, 2, 3), 3:7))

# create a list which has two elements, one of both is a data.frame, and another is a vector
x <- 10:1
y <- -4:5
sport <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame(First = x, Second = y, Sport = sport)
list(theDF, 1:10)

# create a list with three elements, which are data.frame, vector and list which has two vector
(list5 <- list(theDF, 1:10, list3))

# name the elements of the list
names(list5)
names(list5) <- c("data.frame", "vector", "list")
list5

# use "key-value" method to create a list
list6 <- list(TheDataFrame = theDF, TheVector = 1:10, TheList = list3)
names(list6)
list6

# use vector() to create a null list with specific length
(emptyList <- vector(mode = "list", length = 4))

# check a single element in a list
list5[[1]] # shows content of the element only
list5[1] # shows content of the element, also with element name
list5[["data.frame"]] # same as list5[[1]]

# use nested indexing to find elements inside the elements of the list
list5[[1]]$Sport
list5[[1]][, "Second"]
list5[[1]][, "Second", drop = FALSE]

# add a new element in a list without name
length(list5)
list5[[4]] <- 2
length(list5)

# add a new element in a list with name
list5[["NewElement"]] <- 3:6
length(list5)

names(list5)
list5
