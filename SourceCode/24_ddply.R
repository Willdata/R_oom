### plyr package ###
#R最好用的套件之一為Hadley Wickham所創建的plyr套件，
#的使用正好符合資料操作中"拆開-套用-整合"的程序
#核心函數包括ddply、llply和ldply，這些用來修整資料的函數名稱都由5個字母組成，
#名稱的後三個字母皆為ply，第一個和第二個字母分別代表輸入和輸出的資料結構
#d:data.frame, l:list, a:array/ vector/ matrix
#參考"plyr函數參考.xlsx"

#安裝plyr套件，並套用
#install.packages("plyr")
#require(plyr)

### ddply ###
#使用plyr套件裡的baseball資料
head(baseball)

#參照sabermetrics.pptx
#用[]來抽取資料比用ifelse來得快
baseball$sf[baseball$year < 1954] <- 0

#檢查是否成功
any(is.na(baseball$sf))

#把HBP的NA設為0
baseball$hbp[is.na(baseball$hbp)] <- 0

#檢查是否成功
any(is.na(baseball$hbp))

#只保留一季裡AB(打數)至少為50的選手
baseball <- baseball[baseball$ab >= 50,]

### with ###
# with函數讓我們只需指定data.frame(或資料)的名稱一次，
# 就能任意的直接使用該data.frame裡的直行，因此不用重複性地輸入資料名稱

#計算HBP
baseball$OBP <- with(baseball, (h + bb + hbp)/(ab + bb + hbp + sf))
tail(baseball)

#計算選手生涯OBP
#參照sabermetrics.pptx
obp <- function(data){
  c(OBP = with(data, sum(h + bb + hbp)/sum(ab + bb + hbp + sf)))
}

#使用ddply對每個選手計算其整個職棒生涯的OBP
careerOBP <- ddply(baseball, .variables = "id", .fun = obp)

#依據OBP對結果做出排序
careerOBP <- careerOBP[order(careerOBP$OBP, decreasing = TRUE),]

#查看結果
head(careerOBP, 10)

