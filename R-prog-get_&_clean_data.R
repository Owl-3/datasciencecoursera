
#Downloading datasets from the websites
url <- "https://data.baltimorecity.gov/datasets/baltimore-city-employee-salaries"

#download.file() has destfile arg that takes the directory/folder to store the 
#downloaded file followed by name! use method = "curl" if using mac

download.file(url, destfile = "./testdir/cameras.csv", method = "curl")
download.file(url = url, destfile = "./testdir/cameras.xls")
download.file(url, destfile = "./testdir/cameras.xlsx")
list.files("./testdir")

#keeping the date data is downloaded in case of dataset updates
dateDownloaded <- date()
dateDownloaded

#using read.tables() to read data
cameraData <- read.table("./testdir/cameras.csv", sep = ",", header = TRUE)
#or
read.csv("./testdir/cameras.csv")
cameraData

View(cameraData)

#reading data as xlsx
install.packages('xlsx')
library(readxl)
excel <- read_xlsx("./testdir/cameras.xls")


#READING XML data

#loading the json library
library(jsonlite)

#converting the iris dataset to json
iris_to_json <- toJSON(iris, pretty = TRUE)
cat(iris_to_json)

#converting from json
iris_from_json <- fromJSON(iris_to_json)
names(iris_from_json) #shows the column variables
head(iris_from_json)


#USING data.table
library(data.table)
DF <- data.frame(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
DF
head(DF)

DT2 <- data.table(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
DT2


#Accessing values and variables in a dataset
DF[DF$y == "a",]


#you can pass methods to a data.table() data but not data.frame(generates error)

DT2[, list(mean(x), mean(z))]

DT2[, table(y)]
DT2[, table(x)]

library(datasets)
data(iris)
DT <- data.table(iris)
DT[, table("Species")]
DT[, list(mean("Sepal.Length"), mean("Sepal.Width"))]

sum1 <- sum((!is.na(iris$Sepal.Length)))
sum1




#Adding new columns to the data table
DT2[, w:= z^3]
DT2


#Fast reading with data tables

#ASSIGNMENT
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile = "./testdir/housing_data.csv")
dateDownloaded <- date()
dateDownloaded

houseData <- read.csv("housing_data.csv")
head(houseData)

head(houseData$VAL)
install.packages("dplyr")
library(dplyr)
colnames(houseData)
str(houseData)
summary(houseData)
View(houseData)

#How many properties are worth $1,000,000 or more?
#properties worth >= 1,000,000 are represented by 24


class(houseData)
DT <- data.table(houseData)
class(DT)
DT[, .N, by = VAL == "24"] #.N is used to count the number of occurrence 

DT[, .N, by = VAL == "15"]




#WEEK 3

if (!file.exists(",/testdir")) {dir.create("./testdir")}

#Create a logical vector that identifies the households on greater than 10 acres
#who sold more than $10,000 worth of agriculture products. Assign that logical 
#vector to the variable agricultureLogical. Apply the which() function like this
#to identify the rows of the data frame where the logical vector is TRUE. 

#the dataset had already been downloaded and named houseData

agricultureLogical <- houseData[which(houseData$ACR == 3 & houseData$AGS == 6), ]
View(agricultureLogical)

logic <- houseData$ACR == 3 & houseData$AGS == 6
which(logic)


#Using the jpeg package read in the following picture of your instructor into R
#Use the parameter native=TRUE. What are the 30th and 80th quantiles of the 
#resulting data? (some Linux systems may produce an answer 638 different for the
#30th quantile)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

#loading jpg library
install.packages("jpeg")

library(jpeg)


download.file(url = url, destfile = "jpegdata.jpg")
data <- readJPEG("jpegdata.jpg", native = TRUE)




#WORKING WITH DATES

d1 <- date()
d1
class(d1) 

class(d2)

format(d2, "%a %b %d %Y")
# %a = weekday, %b = month, %d = day, %y = year (2 digit)
#uppercases are unabbreviated

#converting dates to different formats
x = c("1jan1990", "2jan1980", "4jan1978"); z = as.Date(x, "%d%b%Y")
z

#checking time difference
z[1] - z[2]

#checking the weekday of the date
weekdays(z[1])

#checking julian(date since origin/1970)
julian(z[1])

