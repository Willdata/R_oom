### while迴圈 ###

x <- 1

while(x <= 5){
  print(x)
  x <- x + 1
}

# 迴圈的強制處理
#有時候在一些迴圈裡我們需要跳過一些迭代過程，或者完全性的退出迴圈。
#我們可以使用next和break滿足此需求

#遇到3不顯示
for(i in 1:10){
  if(i == 3){
    next
  }
  
  print(i)
}

#遇到4就跳出迴圈
for(i in 1:10){
  if(i == 4){
    break
  }
  
  print(i)
}