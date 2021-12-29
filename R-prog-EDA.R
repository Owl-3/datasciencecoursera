#sorting 
install.packages("plyr")
library(plyr)
#creating a data frame
X <- data.frame("var1" = sample(1:5), 'var2' = sample(6:10), 'var3' = sample(11:15))
X
set.seed(1)
X[sample(1:5),];X$var2[c(1,2)] = NA

set.seed(1)
sort(X$var2)

set.seed(1)
cbind(sort(X$var2, na.last = TRUE))
sort(X$var2)
X
X[,W:=sample(16:20)]
X$w <- sample(16:20)
X
names(X)

library(datasets)
data("iris")
iris2 <- as.data.tab

#set.seed() for reproducibility
set.seed(1)

#creating a dataframe
dat <- data.frame('var1' = sample(1:10), 'var2' = sample(11:20), 'var3' = rnorm(10))
dat

#modifying the dataframe
dat[sample(1:10),];dat$var3[c(3, 5)] = NA
dat

#using which() with the specified conditionals. removes NAs
dat[which(dat$var3 >= -0.4 & dat$var2 < 17),]

x <- dat$var3 >= 0
which(x)

set.seed(1)
dat[order(dat$var3, dat$var1),]

#creating new variable
set.seed(2)
dat2 <- cbind(dat, "var4" = rnorm(10,20))
dat2

#introducing NAs
dat2[sample(1:10),];dat2$var3[c(2,4,5,6,8)] =  NA

#creating a table. omits the NAs
table(dat2$var3)

#using useNA arg includes the count of NAs
table(dat2$var3, useNA = 'ifany')

#making 2D table
table(dat2$var1, dat2$var4)

#checking if variable values exists in the given subset
table(dat2$var1 %in% c(1,3,5))

iris
table(iris$Species %in% c('versicolor'))
iris[iris$Species  %in% c('versicolor', 'sertosa'),] #this is like subsetting 

#creating a table
view(table(iris$Sepal.Length, iris$Species))

#just playing with functions
colMeans(is.na(iris))
colSums(is.na(iris))
apply(iris[1:4], 2)
any(!is.na(iris))
all(!is.na(iris))


#xtabs
data("UCBAdmissions")
view(as.data.frame(UCBAdmissions))
class(UCBAdmissions)
xt <- xtabs(Freq ~ Gender + Admit, data = UCBAdmissions)
xt

#viewing as a flat table
ftable(xt)

irisTabs <- xtabs(Sepal.Length ~ Species, data = iris )
irisTabs

#checking size of dataset
print(object.size(iris))


##MERGING DATASETS

#merging using the join() in plyr package
library(plyr)
set.seed(3)
df <- data.frame(id = sample(1:20), x = rnorm(20))
df1 <- data.frame(id = sample(1:20), y = rnorm(20))
arrange(join(df, df2), id)


set.seed(4)
df2 <- data.frame(id = sample(1:20), x = rnorm(20))
df3 <- data.frame(id = sample(1:20), y = rnorm(20))
arrange(join(df1, df2), id)


#merging using merge()
set.seed(3)
merge(df, df2, all = TRUE)

#merging several data frames using join_all()
listAll <-list(df, df1, df2, df3)
allData <- join_all(listAll)
allData

#arranging id column

arrange(allData, id)


#Quiz

#initializing urls
url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

#checking if directory exists, if not, create it
if (!file.exists("./data")) {dir.create("./data")}

#downloading the datasets
download.file(url1, destfile = "./data/GDP.csv")
download.file(url2, destfile = "./data/EDU.csv")

#reading the datasets
library(dplyr)
library(tidyverse)
GDP <- read.csv("GDP.csv")
EDU <- read.csv("EDU.csv")
view(EDU)

str(GDP)
summary(GDP)
view(GDP)
view(EDU)

##==============================================================================
##==============================================================================



#Base Plot Graphics

#loading libraries
library(datasets)
library(tidyverse)
View(cars)

hist(cars$speed, xlab = "Speed", main = "Histogram of cars' speed")
abline(v = median(cars$speed), col = 'red')  ## median line
rug(cars$speed)


#Base plot with annotations 
with(airquality, plot(Wind, Ozone, main = "Ozone and wind in New York City", type = "n"))

#sub-setting the month of May
with(subset(airquality, Month == 5), points(Wind, Ozone, col = 'blue')) 

with(subset(airquality, Month != 5), points(Wind, Ozone, col = 'red'))
legend("topright", pch = 1, col = c('blue', 'red'), legend = c('May', 'Other Months'))



#Base plot with Linear Regression

with(airquality, plot(Wind, Ozone, main = "Ozone and wind in Newyork City", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)



#Multi-Base Plots

par(mfrow = c(1, 3), mar = c(4, 4, 4, 2), oma = c(0, 0, 3, 0))
with(airquality, { 
    
    plot(Wind, Ozone, main = "Ozone and Wind")
    model <- lm(Ozone ~ Wind, airquality)
    abline(model, lwd = 2)
    
    plot(Solar.R, Ozone, main = "Solar.R and Ozone")
    model1 <- lm(Ozone ~ Solar.R, airquality)
    abline(model1, lwd = 2, col = 'red')
    
    plot(Temp, Ozone, main = "Temp with Ozone")
    model2 <- lm(Ozone ~ Temp, airquality)
    abline(model2, lwd = 2, col = 'blue')
    
    mtext("Ozone and weather in Newyork City", outer = TRUE, col = 'red')
    
})


#saving file in a pdf

pdf(file = 'myplot2.pdf')
par(mfcol = c(1, 3), mar = c(4, 4, 4, 2), oma = c(0, 0, 3, 0))
with(airquality, { 
    
    plot(Wind, Ozone, main = "Ozone and Wind")
    model <- lm(Ozone ~ Wind, airquality)
    abline(model, lwd = 2)
    
    plot(Solar.R, Ozone, main = "Solar.R and Ozone")
    model1 <- lm(Ozone ~ Solar.R, airquality)
    abline(model1, lwd = 2, col = 'red')
    
    plot(Temp, Ozone, main = "Temp with Ozone")
    model2 <- lm(Ozone ~ Temp, airquality)
    abline(model2, lwd = 2, col = 'blue')
    
    mtext("Ozone and weather in Newyork City", outer = TRUE, col = 'red')
    
})

dev.off() ##close the pdf file device


##Copying plots using dev.copy2pdf()

with(airquality, plot(Wind, Ozone, main = "Wind and Ozone", pch = 19, col = 'red'))
title(main = "Wind and Ozone", col = 'red')
dev.copy2pdf(file = 'plot3.pdf')  ##copying the plot to plot3.png
dev.off()    ##closing the device



##Copying plots using dev.copy2pdf()

with(airquality, plot(Wind, Ozone, main = 'Wind and Ozone'))
dev.copy(png, file = "plot4.png")
dev.off()

