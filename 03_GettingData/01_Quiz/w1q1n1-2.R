adress <- "D:/Google_Drive/!NW STUDY/!002 MOOC/DataScienceSpecialization/03_GettingData/01_Quiz/"
# q1csv <- paste(adress, "getdata_data_ss06hid.csv", sep = "")
# q1data <- read.table(q1csv, header = TRUE)

# Q1
library(data.table)
housing <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")

# VAL attribute says how much property is worth, .N is the number of rows
# VAL == 24 means more than $1,000,000
housing[VAL == 24, .N]

# Answer:
# 53

# Q3
library(xlsx)

q3xlsx <- paste(adress, "3/getdata_data_DATA.gov_NGAP.xlsx", sep = "")
dat <- read.xlsx(q3xlsx, sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)

# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
# download.file(fileUrl, destfile = paste0(getwd(), '/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'), method = "curl")
# dat <- xlsx::read.xlsx(file = "getdata%2Fdata%2FDATA.gov_NGAP.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)

sum(dat$Zip*dat$Ext,na.rm=T)

# Answer:
# 36534720


# Q4
library("XML")
fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- htmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
zipcode <- xpathSApply(doc,"//zipcode",xmlValue)
xmlZipcodeDT <- data.table::data.table(zipcode = zipcode)
xmlZipcodeDT[zipcode == "21231", .N]

# Answer: 
# 127


# Q5
DT <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")
# fastest
system.time(DT[,mean(pwgtp15),by=SEX])

# Answer:
# DT[,mean(pwgtp15),by=SEX]

