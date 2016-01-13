### llply ###
#用lapply找出list中每個元素的總和
theList <- list(A = matrix(1:9, 3), B = 1:5, C = matrix(1:4, 2), D = 2)
lapply(theList, sum)

#亦可用llply完成，所產出的結果是一樣的
llply(theList, sum)

identical(lapply(theList, sum), llply(theList, sum))

#若要以vector的形式回傳結果，可以使用和sapply相似的laply函數
sapply(theList, sum)

laply(theList, sum)

#plyr涵蓋許多有用的輔助函數，如each函數。
#它可將多個函數的功能套用到某個函數中(如aggregate)
aggregate(price ~ cut, diamonds, each(mean, median))

#idata.frame
#參考"plyr函數參考.xlsx"
system.time(dlply(baseball, "id", nrow))

iBaseball <- idata.frame(baseball)
system.time(dlply(iBaseball, "id", nrow))
