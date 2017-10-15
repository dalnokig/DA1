library(data.table)
hotels <- fread('http://bit.ly/CEU-R-hotels-2017-v2')
str(hotels)

# parse - az adat egy részét kivágni - split to 2 parts...
#### not part of the exam, HW

x <- 'Budapest, Hungary'
strsplit(x, ',')
str(strsplit(x, ','))
##### this is a list of chr vecto 
##### List of 1 ---- $ : chr [1:2] "Budapest" " Hungary"

# dt[filter, R expression, b = ...]

strsplit(x, ', ')[1]
strsplit(x, ', ')[[1]][2]

hotels$country <- NULL
hotels[, country := strsplit(city, ', ')[[1]][2], by = city]
str(hotels)
hotels

## . any char
## * any number of
## .* any number of any char

sub('.*, ', '', x) #### ?? kitöröl mindent a , elõtt ? 

hotels[, country := sub('.*, ', '', city)]
hotels[, .N, by = country]


## TODO create a new column / rename : citycountry w/ city 
## TODO fix city column (by remving country)

hotels[, citycountry := city]
hotels[, city := strsplit(city, ', ')[[1]][1], by = city]
## ezt meg lehet oldani a sub-al is - mindent kitörlök a , után 
str(hotels)

hotels[country == 'Hungary', .N]
hotels[, .N, by = country]


############################# number of cities in a country 
       ############ ?????

#### #of cities with hotels in Gerany

hotels[country == 'Hungary', .N, by = city][, .N]
hotels[country == 'Germany', .N, by = city][, .N]

#### average number hotels per city 
hotels[, .N , by = city][, mean(N)]

#### count the avreage number of hotels per city per counry 
hotels_per_city <- hotels[, .N, by = list(country, city)]
hotels_per_city
hotels_per_city[, list(avg_n_hotels = mean(N), by = country)]
######
    x ########## NEM JÓ ##########

#### percent of national hotels per city

#### compute in average HUF  price in HU for hotels w rating higher than 4.5
hotels[country == 'Hungary' & rating > 4.5][, mean(price_HUF)]
hotels[country == 'Hungary' & rating > 4.5, mean(price_HUF)]

#### histogram on the above prices
library(ggplot2)
szurt <- hotels[country == 'Hungary' & rating > 4.5]
ggplot(szurt, aes(price_HUF)) + geom_histogram()

library(scales)
ggplot(hotels[country == 'Hungary' & rating > 4.5], 
       aes(price_HUF)) + 
        geom_histogram(binwidth = 25000) + 
        xlab('') + 
        ylab('') + 
        ggtitle('Number of hotels', subtitle = 'Budapest, Hungary') + 
        scale_x_continuous(labels = dollar_format(suffix = 'Ft', prefix = ''))


### JOIN data to our data

install.packages('XML')
library(XML)
? readHTMLTable


gdp <- readHTMLTable(readLines('http://bit.ly/CEU-R-gdp'), which = 3)
head(gdp)
