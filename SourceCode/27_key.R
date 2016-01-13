### key ###
#顯示已存入在記憶體中的data.table
tables()

#tables()顯示每個在記憶體裡的data.table，所顯示的訊息包括
#data.table名稱、列數、資料量(已megabytes, MB為單位)、直行名稱和關鍵詞
#關鍵詞是對data.table的索引，它能加快對資料進行搜尋的速度

### setkey ###
#對theDT增添關鍵詞
#使用直行D作為theDT的索引
#setkey的首個引數為data.table的名稱，
#第二個引數則是要做為索引或關鍵詞的直行名稱(不需要加上引號)
setkey(theDT, D)
theDT  #資料已依據直行D按照字母順序重新排序了

#確認關鍵詞已被設定完成
key(theDT)
tables()

#挑選或查看data.table橫列
theDT["One",]
theDT[c("One", "Two"),]


#設定數個直行為關鍵詞
setkey(diamondsDT, cut, color)

#若要同時根據兩個關鍵詞來篩選列，可以使用J函數
#可輸入好幾個引數進此函數，每個引數為所要搜尋的關鍵詞之vector

#查看一些列
diamondsDT[J("Ideal", "E"),]

diamondsDT[J("Ideal", c("E", "D")),]

#索引最主要的好處是可以更快速地進行資料分群計算。
#雖然aggregate和不同的d*ply函數仍可被用在data.table，
#但運算速度會比data.table本身內建的相關函數來得慢

#使用aggregate
aggregate(price ~ cut, diamonds, mean)

#使用data.table取得同樣的結果
diamondsDT[, mean(price), by = cut]

#顯示直行欄位名稱
diamondsDT[, list(price = mean(price)), by = cut]

#依據好幾個直行進行資料分群，可以用list()來指定
diamondsDT[, mean(price), by = list(cut, color)]

#若要對好幾個引數做分群計算，可以把他們都指定在一個list裡
#data.table對於個欄位間的計算是獨立或可以被分開指定的，
#而aggregate對於欄位間的計算必須是相同的
diamondsDT[, list(price = mean(price), carat = mean(carat)) , by = cut]
diamondsDT[, list(price = mean(price), carat = mean(carat), caratSum = sum(carat)), by = cut]

#用很多變數作為依據進行資料分群，同時對每一群好幾個變數進行不同的計算
diamondsDT[, list(price = mean(price), carat = mean(carat), caratSum = sum(carat)), by = list(cut, color)]
