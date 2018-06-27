#
# File: plot1.R
# R code required to create plot1.png

# get_data()
# function to download data and read into table 
# Input: - 
# Returns: the data subset used in the plots 
#
get_data <- function() {
    
    # dataset URL - zip file
    dataset_url <-
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
    dataset_zip <- "Downloaded_Dataset.zip"
    
    #download data file        
    download.file(dataset_url, destfile = dataset_zip)
    # read data in 
    data <- read.csv( unzip( dataset_zip), sep=";", na.strings="?")
    
    # checks 
    print( paste( "Read dataset with ", 
                  dim(data)[1], "rows", 
                  dim(data)[2], "columns"))
    
    # data subset from the dates 2007-02-01 and 2007-02-02
    # dataset uses format %d/%m/%Y e.g. 17/12/2006, thus conversion is needed
    mydata <- subset(data, 
                     (as.Date(Date, "%d/%m/%Y") == "2007-02-02") | 
                         (as.Date(Date, "%d/%m/%Y") == "2007-02-01") )
    
    # checks 
    print( paste( "Working subset with ", 
                  dim(mydata)[1], "rows", 
                  dim(mydata)[2], "columns"))
    
    
    # return the subset needed for the plot(s)
    mydata 
}

#
# plot1()
# function to create the required plot in a png file 
# Input: data - the data subset required for plotting
# Returns: - 
plot1 <- function(data) {
    
    # output plot in file "plot1.png"
    # use default parameters: width = 480, height = 480, units = "px"
    plotfile <- "plot1.png"
    png( plotfile) 
         
    # histogram of the Global active power 
    hist(data$Global_active_power, col = "red", 
         main = "Global Active Power", 
           xlab = "Global Active Power (kilowatts)")
    
    dev.off()    # close png device & complete plot
}
