#
# File: plot2.R
# R code required to create plot2.png
# 
# The function get_data() to download the dataset 
# and read the data into R is available in file plot1.R
#
# Usage:
# 1) if the data are not already loaded then 
# - source plot1.R to load the get_data() function
# - call get_data() to download and read data in R: 
# > data <- get_data()
# 2) call plot2 on the data to create the plot in the png file 
# > plot2( data)
#

#
# plot2()
# function to create the required plot in a png file 
# Input: data - the data subset required for plotting
# Returns: - 
#
plot2 <- function(data) {
    
    # output plot in file "plot1.png"
    # use default parameters: width = 480, height = 480, units = "px"
    plotfile <- "plot2.png"
    png( plotfile) 
    
    
    # create x-axis values combining date and time 
    # these are then automatically generating the needed labels with name of day
    datetime <- strptime(paste( data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
    
    # plot Global Active Power vs time of day
    # use no x-axis label
    plot( datetime, data$Global_active_power, type = "l", 
            ylab = "Global Active Power (kilowatts)", xlab = "")
    
    
    dev.off()    # close png device & complete plot
}
