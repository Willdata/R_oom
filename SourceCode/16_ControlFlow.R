#建立一個含有1的變數
toCheck <- 1

#若toCheck等於1，顯示hello
if(toCheck == 1){
  print("hello")
}

#如果toCheck等於0，顯示hello
#因為toCheck等於1，不等於0，所以沒有顯示任何東西
if(toCheck == 0){
  print("hello")
}

###
check.bool <- function(x){
  if(x == 1){
    #若輸入值為1，則顯示hello
    print("hello")
  }else{              # "else"和if敘述的結束大括號"}"需在同一行，否則不能正常運行
    #否則顯示goodbye
    print("goodbye")
  }
}

check.bool(1)   
check.bool(0)
check.bool('k')   
check.bool(TRUE)  #TRUE在數值上等同1
check.bool(FALSE)
check.bool(" ")
check.bool("")

###
check.bool <- function(x){
  if(x == 1){
    print("hello")
  }else if(x == 0){
    print("goodbye")
  }else{
    print("confused")
  }
}

check.bool(1)
check.bool(0)
check.bool(2)
check.bool(TRUE)
check.bool(FALSE)
check.bool("k")

