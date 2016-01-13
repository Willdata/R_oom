### reshape2 ###
#以reshape2套件來示範資料整理中很常見的行列資料置換(i.e. 矩陣轉置)
#從直行導向轉換成橫列導向也稱為melting data
#從橫列導向轉換成直行導向也稱為casting data

### melt ###
#查看Aid_00s這個data.frame，可看到每一年都被儲存在它專屬的直行中
#代表針對某國家的援助計畫，每一年的援助金額會被存在不同直行中
#這種表格稱為交叉列表(cross table)，是一種很容易理解資料呈現方法
#但對於使用ggplot2來畫圖或要進行一些分析的時候就會顯得不太方便
head(Aid_00s)

#將資料的每一列以"國家-援助計畫-年份"(country-program-year)的形式呈現，
#而對應的援助金額(Dollars)則被儲存在一個直行裡
require(reshape2)
melt00 <- melt(Aid_00s, id.vars = c("Country.Name", "Program.Name"),
               variable.name = "Year", value.name = "Dollars")

tail(melt00, 10)



