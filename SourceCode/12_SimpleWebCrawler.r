# if data is stored in the table on web page, it's efficiently to get the data by using readHTMLTable() from XML package
# if having no XML package, please install it first
# install.packages("XML")
require(XML)

theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"

# set "which  = 1" if wanting to get data of first table
# set "header = FALSE" if there is no header in the table 
bowlPool <- readHTMLTable(theURL, which = 1, header = FALSE, stringAsFactor = FALSE)

bowlPool # shows data 
