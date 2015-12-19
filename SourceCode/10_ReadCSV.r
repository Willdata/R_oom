# highly recommand read.table() to read outer data
url <- "http://www.jaredlander.com/data/Tomato%20First.csv"
# set sep = ",", then read.table() equals read.csv(). If set other separator, then we can read other format data
tomato <- read.table(file = url, header = TRUE, sep = ",") 
head(tomato)

# stringAsFactors
x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame(First = x, Second = y, Sport = q, stringsAsFactors = FALSE)
theDF$Sport
