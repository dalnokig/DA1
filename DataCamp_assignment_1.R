## specify a seed for the random number generator
set.seed(42)

## generate 15 random numbers between 0 and 5, then assign to x

x <- runif(15, min=0, max=5)
str(x)
x

mean(x)

hist(x,title ="Histogram of 15 random numbers")
? his

x <- seq(0, 4*pi, by = 0.1)
? seq

plot(x)

y <- cos(x)
? plot
plot(x,y, type="l")

?curve

curve(cos, 0, 4*pi, type='l', col='red')

library(data.table)
mtd <- data.table(mtcars)

? data.table
mtd
mtd[,.N, by=gear]

mtd[gear == 5]



mtdgear <- data.table(mtd[, .N, by = gear], mtd[, mean(hp), by = gear])
mtdgear$gear <- NULL
setnames(mtdgear, 1,"cars")
setnames(mtdgear, 3,"avg_hp")
mtdgear




