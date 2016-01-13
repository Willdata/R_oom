#用來進行資料連結最常見的函數為R內建的merge函數，
#plyr套件的join函數和data.table的合併功能

#先設定資料夾位置
getwd()  # "C:/Users/will.kuan/Documents"
setwd("C:\\Users\\will.kuan\\Desktop\\Rcode")

#下載&解壓縮
download.file(url = "http://jaredlander.com/data/US_Foreign_Aid.zip",
              destfile = "ForeignAid.zip")

unzip("ForeignAid.zip", exdir = "Data_For_Merging_Exercise")

#總共有8個檔案，將在這些檔案間做出資料連結
#先將檔案載入R

require(stringr)
theFiles <- dir("Data_For_Merging_Exercise", pattern = "\\.csv") #取得檔案列表
for(data in theFiles){  # 對這些檔案進行迭代
  #建立適合的名稱已指派到資料群
  nameToUse <- str_sub(string = data, start = 12, end = 18)
  
  #用read.table讀取csv檔
  #用file.path來指定資料夾和檔名很方便
  temp <- read.table(file = file.path("Data_For_Merging_Exercise", data),
                     header = TRUE, sep = ",",
                     stringsAsFactors = FALSE)
  
  #把他們指派到工作空間
  assign(x = nameToUse, value = temp)
}

### merge ###
# R內建的merge函數可以用來合併兩個data.frame
Aid90s00s <- merge(x = Aid_90s, y = Aid_00s,
                   by.x = c("Country.Name", "Program.Name"),
                   by.y = c("Country.Name", "Program.Name"))

head(Aid90s00s)

#使用plyr join 合併data.frame
#plyr套件的join函數跟merge一樣，但運行速度較快
#最大缺點是所要連結的每個列表中，關鍵字的欄位名稱必須是一樣的

require(plyr)
Aid90s00sJoin <- join(x = Aid_90s, y = Aid_00s, 
                      by = c("Country.Name", "Program.Name"))
head(Aid90s00sJoin)

#目的:將8個data.frame的國際援助相關資料合併成1個data.frame
#條件:不想要逐一對他們手動指定連結
#解法:把所有data.frame放進一個list，然後用Reduce陸續做連結

#先找出data.frame的名稱
frameNames <- str_sub(string = theFiles, start = 12, end = 18)

#建立一空list
frameList <- vector("list", length(frameNames))
names(frameList) <- frameNames

#把每個data.frame放入list裡
for(data in frameNames){
  #data.frame的名字皆為字元，而 <- 運算子需要的是一個變數，不是字元
  #因此解析(parse)該字元，使其轉換為變數
  frameList[[data]] <- eval(parse(text = data))
}

head(frameList[[1]])
head(frameList[["Aid_00s"]])
head(frameList[[5]])
head(frameList[["Aid_60s"]])

#現在已經把所有data.frame置入一個list裡，接下來我們可以對該list的元素進行迭代，
#把所有元素連結在一起(或者對每個元素迭代任一函數)
#比起迴圈，Reduce函數的運行速度較佳

allAid <- Reduce(function(...){
  join(..., by= c("Country.Name", "Program.Name"))
}, frameList)

dim(allAid)

#install.packages("useful")
require(useful)
corner(allAid, c = 15)
bottomleft(allAid, c = 15)

#data.table中的資料合併
require(data.table)
#用data.table來對資料做連結也需要比較不一樣的指令，甚至需要一些不一樣的想法
#首先把其中兩組資料從data.frame轉換成data.table
dt90 <- data.table(Aid_90s, key = c("Country.Name", "Program.Name"))
dt00 <- data.table(Aid_00s, key = c("Country.Name", "Program.Name"))
dt0090 <- dt90[dt00]
