#若對運行速度有要求的人可以嘗試使用data.table套件，
#此套件事對data.frame功能的延伸和強化
#指令與data.frame有一點不一樣
#data.table的快速源自於它能像資料庫那樣使用索引，
#這對資料的搜尋、分群和合併的速度變得更快

#建立data.table如同建立data.frame，方法幾乎一樣
#安裝data.table套件: install.packages("data.table")
require(data.table)
#建立一般的data.frame
theDF <- data.frame(A = 1:10,
                    B = letters[1:10],
                    C = LETTERS[11:20],
                    D = rep(c("One", "Two", "Three"), length.out = 10))

#建立一個data.table
theDT <- data.table(A = 1:10,
                    B = letters[1:10],
                    C = LETTERS[11:20],
                    D = rep(c("One", "Two", "Three"), length.out = 10))

#顯示並比較
theDF; theDT

#data.frame預設設定會把character資料轉換成factor，而data.table不會
class(theDF$B)
class(theDT$B)

#從已建立好的data.frame建立出data.table
require(ggplot2)
diamondsDT <- data.table(diamonds)
diamondsDT

#以往想顯示diamonds資料時，data.frame會盡量把全部資料都顯示出來，
#但data.table會巧妙地只把前5列和後5列顯示出來

#使用data.table來查看某列資料的方式如同使用data.frame查看一樣
theDT[1:2,]
theDT[theDT$A >= 7,]

#data.frame指定查看幾個直行的話，噓要把該直行名稱以character vector(字元向量)的形式指定。
#在data.table裡，則須以list(列表)的方式指定值行，而list中所放的是直行的真正名稱，
#而非character(及無須加上引號)
#data.frame
theDF[, c("A", "C")]

#data.table
theDT[,list(A, C)]

#只有一個直行
theDT[,B]

#仍是data.table架構的單一直行
theDT[, list(B)]

#若非得使用character來指定直行名稱(也許它們是被傳遞到某函數的引數)，可以把with引數設為FALSE
theDT[, "B", with = FALSE]
theDT[, c("A", "C"), with = FALSE]
