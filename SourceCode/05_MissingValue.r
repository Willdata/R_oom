#NA, exists, means Not Available 
z <- c(1, 2, NA, 8, 3, NA, 3)
z
is.na(z)

zChar <- c("Hockey", NA, "Lacrosse")
zChar
is.na(zChar)

#NULL, doesn't exist
z <- c(1, NULL, 3)
z
length(z)

d <- NULL
is.null(d)

is.null(7)
