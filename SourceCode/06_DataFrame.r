# create a data frame 
x <- 10:1
y <- -4:5
sport <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame(First = x, Second = y, Sport = sport)
theDF

# check the number of rows and columns
nrow(theDF)
ncol(theDF)
dim(theDF)  # shows nrow and ncol

# check the names of each column variable
names(theDF)
names(theDF)[3]

# check  or change the names of each row 
rownames(theDF)

rownames(theDF) <- c("One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten")
rownames(theDF)

# set the names to default index
rownames(theDF) <- NULL
rownames(theDF)

# check the first or last few rows of the data frame, default is 6 rows
head(theDF)
head(theDF, n = 5)
tail(theDF)
tail(theDF, n = 3)

# check the data type of data frame
class(theDF)

# check each column in a data frame
theDF$Sport
theDF[3]

# check row or column 
theDF[3, 2]  # theDF[row index, column index]
theDF[3, 2:3]  # row3, col2 to col3
theDF[c(3, 5), 2] #column2, row3 and row5. Because only one column, R won't show the title of the column
theDF[c(3, 5), 2:3] #row3 and row5, column2 to column3
theDF[, 3]  #all elements in column3
theDF[, 2:3] # all elements in column2 to column3
theDF[2,] # all elements in row2
theDF[2:4,] # all elements in row2 to row4
theDF[, c("First", "Sport")]  # combine the column names as a character vector 
theDF[, "Sport"]

class(theDF[, "Sport"])
class(sport)

theDF["Sport"] # shows all elements in column "Sport" only, return a data.frame with single column
class(theDF["Sport"])

theDF[["Sport"]] # shows all elements in column "Sport" only, return a factor vector
class(theDF[["Sport"]])

theDF[, "Sport", drop = FALSE] # return a data.frame with single column which is column "Sport" 
class(theDF[, "Sport", drop = FALSE])
theDF[, 3, drop = FALSE] # same as theDF[, "Sport", drop = FALSE]
class(theDF[, 3, drop = FALSE])

# check how factor is stored in data.frame 
newFactor <- factor(c("Pennsylvania", "New York", "New Jersey", "New York", "Tennessee", "Massachusetts", "Pennsylvania", "New York"))
model.matrix(~newFactor - 1)
