#
# File: plot1.R
# R code required to create plot1.png
# 

#
# function to download data and read into table 
#
get_data <- function() {


data <- read.csv( unzip( "PA_04.01/exdata_Fdata_Fhousehold_power_consumption.zip"), sep=";", na.strings="?")


}

# alternative without unzip
plot1 <- function() {

}

mydata <- subset(data, (as.Date(Date, "%d/%m/%Y") == "2007-02-02") | (as.Date(Date, "%d/%m/%Y") == "2007-02-01") )
 
hist(mydata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

png("plot1.png")
hist(mydata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
