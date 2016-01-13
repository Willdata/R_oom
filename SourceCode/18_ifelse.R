### ifelse ###
#R裡的if就像其他傳統程式語言的if敘述，ifelse則比較像Excel的if函數用法，
#ie. R的ifelse就類似其他傳統程式語言的三元運算子，e.g.( ? : ) in Java
# ifelse(檢測項目, 檢測結果為TRUE的引數, 檢測結果為FALSE的引數)

#檢測是否1 == 1
ifelse(1 == 1, "Yes", "No")

#檢測是否1 == 0
ifelse(1 == 0, "Yes", "No")

toTest <- c(1, 1, 0, 1, 0, 1)
ifelse(toTest == 1, "Yes", "No")
ifelse(toTest == 1, toTest * 3, toTest)
ifelse(toTest == 1, toTest * 3, "Zero")  # 檢測結果必須為同一資料型態

toTest[2] <- NA
ifelse(toTest == 1, "Yes", "No")
ifelse(toTest == 1, toTest * 3, toTest)
ifelse(toTest == 1, toTest * 3, "Zero")
