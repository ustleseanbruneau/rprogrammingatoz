
?read.csv()

#Method 1:  Select the File Manually
stats <- read.csv(file.choose())
stats

# Method 2: Set WD and Read Data
getwd()
#Windows
setwd("C:\\Users\\username\\something.txt")

#Linux
setwd("/home/hogy/rclass/data")
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")
stats

#-------------------------------------------- Exploring Data
stats
nrow(stats)
ncol(stats)
# Top six rows with column names
head(stats)
# Top 15 rows with column names
head(stats, n=15)
# Bottom six rows with column naems
tail(stats)

#str - in R - structure
str(stats)

#runif
# R unif - R type of distribution
# rnorm - R normal distribution

summary(stats)


#-------------------------------------------- Using the $ sign
stats
head(stats)
stats[3,3]
stats[3, "Birth.rate"]

# Following two lines produce same result
stats$Internet.users
stats[,"Internet.users"]


stats$Internet.users[2]

levels(stats$Income.Group)


#-------------------------------------------- Basic Operations with a DF

#subsetting
#first 10 rows and all columns
stats[1:10,]
stats[3:9,]
# get rows 4 and 100 keeping row number
stats[c(4,100),]

# if you select one row in DF, structure is kept as DF
is.data.frame(stats[1,])

#converts to vector
stats[,1]
is.data.frame(stats[,1])

# to keep as DF
stats[,1,drop=F]
is.data.frame(stats[,1,drop=F])

head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#add column to DF
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

#test of knowledge
# add xyz column with a number 1 to 5, recycle numbers
stats$xyz <- 1:5
head(stats, n=12)

# remove a column
head(stats)
stats$MyCalc <- NULL
stats$xyz <- NULL



#-------------------------------------------- Filtering a Data Frame
head(stats)
stats$Internet.users < 2
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate < 40,]
stats[stats$Birth.rate < 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)

stats[stats$Country.Name == "Malta",]


#-------------------------------------------- Introduction to qplot()

#install.packages("ggplot2")
library(ggplot2)
?qplot

qplot(data=stats, x=Internet.users)

qplot(data=stats, x=Income.Group, y=Birth.rate)

# I is size of dots on diagram
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(10))

qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), color=I("blue"))

qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), geom="boxplot")


#-------------------------------------------- Visualizing what we need
qplot(data=stats, x=Internet.users, y=Birth.rate)

qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4))

qplot(data=stats, x=Internet.users, y=Birth.rate, color=I("red"), size=I(4))

qplot(data=stats, x=Internet.users, y=Birth.rate, color=Income.Group, size=I(5))

head(stats)

#--------------------------------------------  Creating a Data Frame

mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)

# Rename column names
colnames(mydf) <- c("Country", "Code", "Region")
head(mydf)

rm(mydf)

# Create Data Frame with column names
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, 
                   Region=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)

#--------------------------------------------  Merging Data Frames
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")

head(merged)

# remove duplicate column Country
merged$Country <- NULL
str(merged)


#--------------------------------------------  Visualizing with new Split
qplot(data=merged, x=Internet.users, y=Birth.rate)

qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region)

# R shapes in Google search - shape=I(NUMBER);  NUMBER between 1 and 25

# 1. Shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region, 
      size=I(5), shape=I(17))

qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region, 
      size=I(5), shape=I(23))

# Transparent ->  0=Fully Transparent; 1=No Transparent
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region, 
      size=I(5), shape=I(19), alpha=I(0.6))

# Add a title
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region, 
      size=I(5), shape=I(19), alpha=I(0.6), 
      main="Birth Rate vs Internet Users")











