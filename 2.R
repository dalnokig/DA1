h<-c(174, 170, 160)
w<-c(90,80,70)

cor(h, w)
plot(h,w)

df <- data.frame(weight=w, height=h)
df

str(df)
## refering to any points of the data frame
##
  #df[rows, cols]
  df[1,1]
  df[2,2
     ]
  df[ ,1]
###
###
  df$weight
  df$height[2]
##
###
  #data frame 
  #define vector - c()
  #define data frame - data.frama
  #refer to any point of the data frame 
  #[] – to index the vectors
  
  
  cor(df)
  plot(df
       )
  
  
### TODO BMI = weight / height(in meters) ^ 2
  
df$bmi <- df$weight / (df$height/100) ^2
df$bmi
df
str(df    )

summary(df$bmi)


df <- read.csv('http://bit.ly/CEU-R-heights')
str(df)

df$heightCm <- df$heightIn*2.54
df$weightKg <- df$weightLb*0.45359237
df$heightCm
df$weightKg
df

df$bmi <- df$weightKg / (df$heightCm / 100) ^2
df

head(df)   #### shos the first few rows 
  ## ypu can check the top of the table
head(df, 3)   ####


## TODO - Analyse bmi

plot(df$heightCm, df$b, type="h")
? plot
summary(df$bmi)
min(df$bmi)
max(df$bmi)
range(df$bmi)
diff(range(df$bmi)) ##
length(df$bmi)      ##
dim(df$bmi)         ##
nrow(df$bmi)
ncol(df$bmi)


#### delete row or column or variabl
  ## <- NULL


## dataviz
hist(df$bmi)
abline(v = c(18, 25), col='red' ) ###draw linear trendline
summary(df$ageYear)

plot(density(df$bmi))                   ##### ezmi???

boxplot(df$bmi)
boxplot(bmi ~ sex, df)

## median - midle value
## 50% in the box
## outliers the circles
## 

install.packages("beanplot")  ## install new package 
library (beanplot)            ## load  new package to the memory


beanplot(bmi ~ sex, df)
?beanplot


### VIOLIN PLOT

## other 

pie(table(df$sex))
barplot(table(df$sex))
dotchart(table(df$sex))
dotchart(table(df$sex), xlim = c(0,150))        ## xlim !!!
? dotchart


pairs(df)

install.packages("GGally")
library(GGally)

ggpairs(df)

install.packages('pairsD3')
library(pairsD3)

pairsD3(df)       ##  interactive 



#### intro to stats => t-test

t.test(heightCm ~ sex, data = df)
t.test(weightKg ~ sex, data = df)
t.test(bmi ~ sex, data = df)

aov(weightKg ~ sex, data = df)
summary(aov(weightKg ~ sex, data = df))


### SWITCH  TO HOTEL DATA SET 

hotels <- read.csv('http://bit.ly/CEU-R-hotels-2017', stringsAsFactors = FALSE)


str(df)

plot(df$price_HUF)
plot(df$price_HUF, df$stars)
summary(df$stars)
pie(table(df$stars))

hotels <- df

hist(hotels$price_HUF
     )
summary(hotels$price_HUF
        )
table(cut(hotels$price_HUF, breaks =10))
plot(table(cut(hotels$price_HUF, breaks =10))
)
pie(table(cut(hotels$price_HUF, breaks =10))
)

dotchart(table(cut(hotels$price_HUF, 
                   breaks =20, 
                   dig.lab = 8)))

which.max(hotels$price_HUF)
hotels[1374, ]
hotels[which.max(hotels$price_HUF), 'hotel_name']
 
       ####
 
hotels[which.max(hotels$price_HUF)
       , 'hotel_name']                      ######## ???? megkérdezni? 

hotel_name
hotels$hotel_name[1374]

str(hotels)


hotels <- read.csv('http://bit.ly/CEU-R-hotels-2017')

hotels[which(hotels$price_HUF > 100000 & hotels$rating < 3), ]    #### kell a vesszõ, mert ezzel jelölöm, hogy ez minden oszlopra igaz

nrow(hotels[which(hotels$price_HUF > 100000 & hotels$rating < 3), ]    )

install.packages("data.table")
library(data.table)

hotels <- data.table(hotels)
str(hotels)


#### dt[1]  <->   df[1, ]

hotels[1]
hotels[price_HUF > 100000]
hotels[price_HUF > 100000 & rating < 3]


## TODO hotels: price < 10000 & rating > 4 
## listthe cities of these

hotels[price_HUF < 10000 & rating > 4, city]
hotels[price_HUF < 10000 & rating > 4, length(city)]
hotels[price_HUF < 10000 & rating > 4, length(unique(city))]
hotels[price_HUF < 10000 & rating > 4, .N]
length(hotels$city)

hotels[price_HUF >250000, median(stars, na.rm = TRUE)]
hotels[price_HUF >250000, table(stars)]



###dt[i, j, by = ...]

hotels[price_HUF > 250000,
       mean(stars, na.rm = TRUE),
       by = city]



### TODO compute
### average price / number of stars on all cases

hotels[, 
       mean(price_HUF),
       by = stars
       ]

hotels[, 
       list(avg_price = mean(price_HUF)),
       by = stars
       ]

hotels[, 
       .(avg_price = mean(price_HUF)),
       by = stars
       ]


### order
price_per_stars <- hotels[, list(avg_price = mean(price_HUF)), by = stars]
setorder(price_per_stars, -stars)
price_per_stars


hotels[, 
       list(
         avg_price = mean(price_HUF),
         avg_stars = mean(stars, na.rm = TRUE)
       ),
       by = city
       ]

hotels[, 
       list(
         avg_price = mean(price_HUF),
         avg_stars = mean(stars, na.rm = TRUE),
         .N
       ),
       by = city
       ]

hotels[, 
       list(
         avg_price = mean(price_HUF),                ####  oszlop nnév = számítás
         avg_stars = mean(stars, na.rm = TRUE),
         .N,                                         #### . = list   .N = hány elem van
         with5stars = sum(stars == 5)                ####   sum - mennyi igaz
       ),                                            ####   == valami egyenló, vmivel - mennyi igaz a vectorból
       by = city
       ]
