use.switch <- function(x){
  switch(x,
         "a" = "first",
         "b" = "second",
         "z" = "last",
         "c" = "third",
         "other") # set as default
}

use.switch("a")
use.switch("b")
use.switch("c")
use.switch("d")
use.switch("e")
use.switch("z")

#如果給函數的引數為數值的話，代表要對應到第幾個引數，
#這時候這些引數的名稱會完全被忽略。
#若這數值比引數的數量還大的話，將會回傳NULL
use.switch(1)
use.switch(2)
use.switch(3)
use.switch(4)
use.switch(5)
use.switch(6)
is.null(use.switch(6))
