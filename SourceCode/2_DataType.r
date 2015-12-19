#numeric data
x <- 2
class(x)

is.numeric(x)

#指派整數
i <- 5L
i ; class(i)
is.integer(i)
is.numeric(i)


class(4L)
class(2.8)
class(4L * 2.8)

class(5L)  ; class(2L)
class(5L / 2L)

#character data
x <- "data"
x

y <- factor("data")
y

nchar(x)
nchar("hello")
nchar(3)
nchar(452)

#nchar function does not apply to "factor" data
nchar(y)  # error

#Date and POSIXct data
date.1 <- as.Date("2015-12-16")
date.1
class(date.1)
as.numeric(date.1)  # couunt total days from 1970/1/1 to 2015/12/16

date.2 <- as.POSIXct("2015-12-16 10:15")
date.2
class(date.2)
as.numeric(date.2)  # count total seconds from 1970/1/1 00:00 to 2015/12/16 10:15

class(date.1)
class(as.numeric(date.1))

#logical data
#TRUE == 1 ; FALSE == 0
TRUE * 5
FALSE * 5
k <- TRUE
class(k)
is.logical(k)

2 == 3
2 != 3
2 < 3
2 <= 3
2 > 3
2 >= 3
"data" == "stats"
"data" < "stats" # alphabetical comparision
"c++"  < "banana"
"banana"  < "C++"

FALSE > TRUE
FALSE > TRUE-2 # because TRUE == 1 and FALSE == 0, 0 > (1-2)


