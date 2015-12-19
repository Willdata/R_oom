require(ggplot2)
data(diamonds) # load diamonds data 
head(diamonds)

# histogram
# carat(克拉),鑽石重量的直方圖
# main is plot title, xlab is name of x-axis
hist(diamonds$carat, main = "Carat Histogram", xlab = "Carat") 

# scatter plot
# price(價格) 和 carat(重量)的關係散佈圖
# price ~ carat == y ~ x, price是y軸，carat是x軸
plot(price ~ carat, data = diamonds)

# same as plot(price ~ carat, data = diamonds)
plot(diamonds$carat, diamonds$price)

# boxplot
boxplot(diamonds$carat)
