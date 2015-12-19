# Use ggplot2 to upgrade basic plot to the advanced
require(ggplot2)

# ggplot2的教學:
# http://molecular-service-science.com/2013/11/27/r-ggplot-tutorial-1/

# histogram
# 鑽石重量(carat)的分佈圖
ggplot(data = diamonds) + geom_histogram(aes(x = carat))

# probability density 機率密度圖
ggplot(data = diamonds) + geom_density(aes(x = carat), fill = "grey50")

# scatter plot
ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

# save scatter plot as a variable g, then just use g if needing to add some color
g <- ggplot(diamonds, aes(x = carat, y = price))

# 指定鑽石顏色為外觀顏色的散佈圖
g + geom_point(aes(color = color))

# 以鑽石色澤來分層的散佈圖
g + geom_point(aes(color = color)) + facet_wrap(~color)

# 以鑽石切割(cut)和鑽石淨度(clarity)來分層的散佈圖
g + geom_point(aes(color = color)) + facet_grid(cut ~ clarity)

# 以顏色分層的直方圖
ggplot(diamonds, aes(x = carat)) + geom_histogram() + facet_wrap(~color)

# 鑽石重量的箱型圖
ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot()

# 以鑽石切割(cut)分層的鑽石重量箱型圖
ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot()

# 類似箱型圖概念的小提琴圖
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin()

# 請比較以下兩者的差異
ggplot(diamonds, aes(y = carat, x = cut)) + geom_point() + geom_violin() # 資料點在小提琴底下
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin() + geom_point() # 資料點在小提琴上面

# 線形圖
# 先檢視economics資料集
head(economics)
ggplot(economics) + geom_line(aes(x = date, y = pop))

# 以下兩種寫法均可描繪出相同的線形圖，視情況選擇較方便的寫法
ggplot(economics, aes(x = date, y = pop)) + geom_line()
ggplot(economics) + geom_line(data = economics, aes(x = date, y = pop))

# 當ggplot2不能正常畫線時的小技巧，加入group引數
ggplot(economics) + geom_line(aes(group = 1, x = date, y = pop))

# use functions of lubridate package to deal with "date" variable in economics data set
install.packages("lubridate")
require(lubridate)

# set  "year" and "month" variables
economics$year <- year(economics$date)

# label引數設為TRUE表示結果中的月份要以月份的名稱顯示，而非數字
economics$month <- month(economics$date, label = TRUE)

# get some specific data whose year must be 2000 or greater
econ2000 <- economics[which(economics$year >= 2000),]

# 載入scales套件以更好的格式化圖中的軸
require(scales)

# 建立圖的底圖
g <- ggplot(econ2000, aes(x = month, y = pop))

# 以不同顏色的線來代表不同的年份
# group外觀引數將把資料分成很多群
g <- g + geom_line(aes(color = factor(year), group = year))

# 將說明命名為"Year"
g <- g + scale_color_discrete(name = "Year")

# 格式化Y軸
g <- g + scale_y_continuous(labels = comma)

# 新增標題和x軸與y軸的標籤
g <- g + labs(title = "Population Growth", x = "Month", y = "Population")

# shows the plot
g

# 主題樣式
install.packages("ggthemes")
require(ggthemes)

# draw a pic and save it
g2 <- ggplot(diamonds, aes(x = carat, y = price)) + geom_point(aes(color = color))

# use some of these themes
g2 + theme_economist() + scale_color_economist() # economist style
g2 + theme_excel() + scale_color_excel() # excel style
g2 + theme_tufte() # tufte style
g2 + theme_wsj() # wsj style
g2 + theme_calc() # calc style
g2 + theme_hc() # hc style
g2 + theme_few() # few style
g2 + theme_map() # map style
g2 + theme_gdocs() # gdocs style
g2 + theme_solarized_2() # solarized_2 style
# there are still lots of styles available 
