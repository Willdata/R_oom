### paste ###
paste("Hello,", "Tom", "and", "Jerry") 


#字串和字串之間會自動加上空格，因為預設的分隔字元是" "
#更改分隔字元(sep)
paste("Hello,", "Tom", "and", "Jerry", sep = "+")

#paste的向量化運算
paste(c("Hello", "Hey", "Hi"), c("A-Rod", "K-Rod", "I-Rod"))

#兩個vector長度相同，裡面的元素可一對一配對
#若長度不相同，長度較短的會被循環使用
paste("Hello", c("A-Rod", "K-Rod", "I-Rod"))
paste("Hello", c("A-Rod", "K-Rod", "I-Rod"), c("batter", "pitcher"))

#利用paste的collapse引數可以將vector裡的所有文字摺疊(collapse)成單一的vector
#並以任意的分隔符號隔開每串文字
vectorOfText <- c("Hello", "Everyone", "out there", ".")
paste(vectorOfText, collapse = " ")
paste(vectorOfText, collapse = "*")

