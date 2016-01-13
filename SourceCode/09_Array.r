# Array is a multi-dimension vector, so MUST contains identical data type elements
# imagine Array is a building which has a lot of levels, dimension means level
# nrow means length of a level, and ncol means width of a level

theArray <- array(1:12, dim = c(2, 3, 2)) # dim = c(nrow, ncol, number of dimension)
theArray

# get the first row of each level
theArray[1, , ]

# get the first row of first level 
theArray[1, , 1]

# get first level
theArray[, , 1]

