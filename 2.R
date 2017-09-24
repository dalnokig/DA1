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
