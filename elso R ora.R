1+3
pi
'pi'
"pi"
str(pi)
str('pi')
letters
str(letters)
str(LETTERS)
LETTERS
letters[1]
letters[10]
letters[99]
letters[c(1,10)]
## comment on its own
letters[10] # inline comment
str
?str
?pi

## variables
x <- 2 # good
x
x=4   # bad
x


##todo comppute squre root x

sqrt(x)
x ^0.5

runif (1) 

set.seed(42) ## sets the ligal base for a randon number generation (same will be always)
runif(1)

round(runif(5))
round(runif(5), 2)
round(runif(5), digits = 2)
round(digits = 2, runif(5))

## TODO gen 1000 randon numbers between 0 and 10,
##      digits = 2 => visualise


runif(1000, min =0, max=10)
round(runif(1000, min =0, max=10), digits = 2)
plot(round(runif(1000, min =0, max=10), digits = 2))
hist(round(runif(1000, min =0, max=10), digits = 2))

x <- runif(1000) * 10
round(x, 2)
plot(x)

f <- function(x) {
  2 * x + 1
}

f(5)
f(pi)
f(1:5)

plot(x, f(x), type = 'l')    ## lowcase l




x-< seq(1,5*pi, by = 0.1)   ##############  ez mit csinál ?????
plot(x, f(x))    ## lowcase l


## TODO 1 period of sine


x <- seq(0, pi*2, by = 0.1)
plot(x, sin(x), type = "l")

? seq



### random walk example

x <- round((runif(25)) * 2 -1)
cumsum(x)
plot(cumsum(x))
plot(cumsum(x), type = "s")



### data frame

h<-c(174, 170, 160)
w<-c(90,80,70)
plot(h, w, xlab = "Height")
plot(h, w, xlab = "Height", ylab = "Weight")

cor(h, w)

lm(w ~ h)  # linear model          formula notation 

fit <- lm(w ~ h)   
summary(fit)

abline(fit)  ## visualse linear regression 

abline(fit, col = "red") 

predict(fit, list(h = c(165, 174)))

predict(fit, list(h = 56))   ### predicts negative wieght 
#### how to solve
#### use qudratic instead of linera
#### need more data
#### restrict model to a range
#### exclude outliers
#### 
