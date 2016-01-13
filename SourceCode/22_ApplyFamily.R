### apply ###
#apply函數的限制性高，只能被用在matrix中，意味著所有的元素必須是同一類別
#若用在其他結構的物件，如data.frame，它就會先被轉換成matrix

#apply的第一個引數為所要操作的物件或資料
#第二個引數決定函數要怎麼被應用在該物件，1表示對每一列應用函數，2表示對每一行應用函數
#第三個引數為所要套用的函數

#建立Matrix
(theMatrix <- matrix(1:9, nrow = 3) )# default filling elements by column

#每一列的總和
apply(theMatrix, 1, sum)

#每一行的總和
apply(theMatrix, 2, sum)

#使用內建的rowSums和colSums函數
rowSums(theMatrix)
colSums(theMatrix)

#把theMatrix的其中一個元素設為NA，看看na.rm如何處理遺失值
(theMatrix[2, 1] <- NA)
apply(theMatrix, 1, sum)
apply(theMatrix, 1, sum, na.rm = TRUE)

rowSums(theMatrix)
rowSums(theMatrix, na.rm = TRUE)

### lapply ###
#lapply的功用是對list(列表)中的每個元素套用函數，回傳的結果也會是以list呈現
(theList <- list(A = matrix(1:9, 3), B = 1:5, C = matrix(1:4, 2), D = 2) )
lapply(theList, sum)

### sapply ###
#若要讓lapply的結果已vector的形式回傳的話，可以使用sapply
#使用方法跟lapply一模一樣
sapply(theList, sum)

#由於vector也算是list的一種，因此lapply和sapply也可以用vector作為引數
(theNames <- c("Jared", "Deb", "Paul") )
lapply(theNames, nchar)
sapply(theNames, nchar)

### mapply ###
#可以對好幾個list中的每個元素套用所指定的函數

#建立兩個list
(firstList <- list(A = matrix(1:16, 4), B = matrix(1:16, 2), C = 1:5) )
(secondList <- list(A = matrix(1:16, 4), B = matrix(1:16, 8), C = 15:1))

#元素對元素檢測，看他們是否相同
mapply(identical, firstList, secondList)

#建立一個簡單的函數把個元素的列的數量(長度)加起來
simpleFunc <- function(x, y){
  NROW(x) + NROW(y)
}

#把函數應用到那兩個list
mapply(simpleFunc, firstList, secondList)
