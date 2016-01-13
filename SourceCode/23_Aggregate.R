### aggregate formula ###
require(ggplot2)
data(diamonds)
head(diamonds)

#formula由波浪號(~)分隔成左右兩邊，左邊所放的變數將被用來做計算，
#而右邊的一個或多個變數則是對左邊變數做分群的依據

#將price依據cut做分群，第二個引數表示所要使用的資料集，
#第三個引數決定套用到每個分群群組的函數
aggregate(price ~ cut, diamonds, mean)
aggregate(price ~ cut, diamonds, sum)
aggregate(price ~ cut, diamonds, mean, na.rm = TRUE)

#以數個變數作為依據來進行分群，可在formula右邊使用加號(+)添加變數
aggregate(price ~ cut + color, diamonds, mean)

#若要同時對兩個變數進行分群計算(暫且只以cut來做分群依據)，
#該兩個變數則需在formula的左邊以cbind合併
aggregate(cbind(price, carat) ~ cut, diamonds, mean)

#同時對formula左右邊提供好幾個變數
aggregate(cbind(price, carat)  ~ cut + color, diamonds, mean)
