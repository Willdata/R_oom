say.hello <- function(){   # 句點(.)沒有特別意義，只是普通字元
  print("Hello World!")
}

###sprintf###
#取代一個特殊輸入字元
sprintf("Hello %s", "Jared")

#取代二個特殊輸入字元
sprintf("Hello %s, today is %s", "Jared", "Sunday")

#用sprintf來建立字串，並以輸入的引數來決定顯示結果
hello.person <- function(name){
  print(sprintf("Hello %s", name))
}

hello.person("Jared")
hello.person("Bob")
hello.person("Sarah")

#兩個引數
hello.person <- function(first, last){
  print(sprintf("Hello %s %s", first, last))
}

hello.person("Jared", "Lander")
hello.person(first = "Jared", last = "Lander")

#把引數反過來
hello.person(last = "Lander", first = "Jared")

#只指定一個引數名稱
hello.person("Jared", last = "Lander")
hello.person(first = "Jared", "Lander")
hello.person(last = "Lander", "Jared")

#指輸入部分引數名稱
hello.person(fir = "Jared", l = "Lander")  # 要小心使用，不建議

###預設引數直###
#將姓氏設定預設值
hello.person <- function(first, last = "Doe"){
  print(sprintf("Hello %s %s ", first, last))
}
  
hello.person("Jared")

hello.person("Jared", "Lander")

###附加引數###
hello.person("Jared", extra = "Goodbye")   # error
hello.person("Jared", "Lander", "Goodbye")  # error

#建立hello.person,並加入...引數已接受附加引數
hello.person <- function(first, last = "Doe", ...){
  print(sprintf("Hello %s %s", first, last))
}

hello.person("Jared", "Lander", "Goodbye")
hello.person("Jared", extra = "Goodbye")

###值的回傳###
#建立函數時不使用return指令
double.num <- function(x) x *2   #若函數內容只有一行敘述，可不寫大括號{}
double.num(5)

#建立函數時使用return指令
double.num <- function(x) return(x * 2)
double.num(5)

#在return後面也放一些指令
double.num <- function(x){
  return(x * 2)
  #以下指令不會被執行，因為函數已經被退出了
  print("Hello!")
  return(17)
}
double.num(5)

### do.call ###
#do.call這個函數允許使用者使用character或者一個物件來指定函數，
#而輸入的引數須以列表(list)形式呈現
do.call("hello.person", args = list(first = "Jared", last = "Lander"))
do.call(hello.person, args = list(first = "Jared", last = "Lander"))

###
run.this <- function(x, func = mean){
  do.call(func, args = list(x))
}

#用預設的mean函數找平均值
run.this(1:10)

#指定要找平均值
run.this(1:10, mean)

#計算總和
run.this(1:10, sum)

#計算標準差
run.this(1:10, sd)
