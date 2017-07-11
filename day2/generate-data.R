library(ribiosIO)
set.seed(10)
X <- sort(runif(25)*10+2)
Y <- 2.85*X+1.24+rnorm(25)
Y[3] <- Y[3]-6
Y[2] <- Y[2]-4
Y[1] <- Y[2]-2
Y[24] <- Y[24]+9
Y[25] <- Y[24]+10
y <- round(2^Y)
x <- log10(X)*10

plot(x, y, log="y")

res <- data.frame(ToxConc=x, CaspaseSignal=y)
res <- res[sample(1:nrow(res)),]
writeMatrix(res, "values.txt")
