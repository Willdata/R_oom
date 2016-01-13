### cbind ###
#建立兩個vector，把他們當作data.frame裡的欄位合併起來
sport <- c("Hockey", "Baseball", "Football")
league <- c("NHL", "MLB", "NFL")
trophy <- c("Stanley Cup", "Commissioner's Trophy", "Vince Lombardi Trophy")
trophies1 <- cbind(sport, league, trophy)

#利用data.frame()建立另一個data.frame
trophies2 <- data.frame(sport = c("Basketball", "Golf"),
                        league = c("NBA", "PGA"),
                        trophy = c("Larry O'Brien Championship Trophy",
                                   "Wanamaker Trophy"),
                        stringsAsFactors = FALSE)

#用rbind把它們整合成一個data.frame
trophies <- rbind(trophies1, trophies2)

#用cbind來對直行指派名稱
cbind(Sport = sport, Association = league, Prize = trophy)
