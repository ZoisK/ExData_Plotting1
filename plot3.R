#
# File: plot3.R
# R code required to create plot3.png
# 

#
# plot3()
# function to create the required plot in a png file 
# Input: data - the data subset required for plotting
# Returns: - 
#
plot3 <- function(data) {
    
    # output plot in file 
    # use default parameters: width = 480, height = 480, units = "px"
    plotfile <- "plot3.png"
    png( plotfile) 
    
    
    # create x-axis values combining date and time 
    # these are then automatically generating the needed labels with name of day
    datetime <- strptime(paste( data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
    
    plot( datetime, data$Sub_metering_1, type = "l", 
          ylab = "Energy sub metering", xlab = "")
    lines( datetime, data$Sub_metering_2, type = "l", col = "red")
    lines( datetime, data$Sub_metering_3, type = "l", col = "blue")
    legend( "topright", lty = 1, col = c("black", "red", "blue"), 
            legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    
    dev.off()    # close png device & complete plot
}
