library(ribiosIO)
vals <- list(Condition1=rt(6, df=3)+3,
             Condition2=rt(6, df=5)+2.5,
             Condition3=rt(6, df=2)+2,
             Condition4=rt(6, df=5)+3.5)
valsTb <- data.frame(lapply(vals, function(x) round(10^x)))
writeMatrix(valsTb, "values.txt")
