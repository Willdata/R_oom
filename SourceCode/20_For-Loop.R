### for-loop in R ###
for(i in 1:10 ){  #變數i將逐一走訪序列1:10
  print(i)        #變數i每走訪序列中的元素，即印出該元素
}

#上述for-in loop在其他程式語言很常見，
#但在R裡，使用迴圈非常吃資源，效率也不比R內建的向量化運算快速

print(1:10)  #R內建的向量化運算

#建立一個含有水果名稱的vector
fruit <- c("apple", "banana", "pomegranate")

#建立一個vector變數以儲存水果名稱的長度，先存NA值作為開始
fruitLength <- rep(NA, length(fruit))
fruitLength

#替它取名
names(fruitLength) <- fruit

#再次顯示，還是NA值
fruitLength

#對fruit(水果名稱)做迭代，每次把名稱長度都存入vector裡
for(a in fruit){
  fruitLength[a] <- nchar(a)
}

#把長度顯示出來
fruitLength

#使用R的向量化運算特性來簡化上述流程
#只需呼叫nchar函數
fruitLength2 <- nchar(fruit)

#替它取名
names(fruitLength2) <- fruit

#present it
fruitLength2

#檢視兩個結果是否相同
identical(fruitLength, fruitLength2)

