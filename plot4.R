#
# File: plot4.R
# R code required to create plot4.png
# 

#
# plot4()
# function to create the required plot in a png file 
# Input: data - the data subset required for plotting
# Returns: - 
#
plot4 <- function(data) {
    
    # output plot in file 
    # use default parameters: width = 480, height = 480, units = "px"
    plotfile <- "plot4.png"
    png( plotfile) 
    
    # required changes in global par() 
    save <- par()$mfcol # save setting to restore
    # 2x2 plots in one frame
    par(mfcol = c(2,2))
    
    # create x-axis values combining date and time 
    # these are then automatically generating the needed labels with name of day
    datetime <- strptime(paste( data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
    
    
    
    # plot 2
    plot( datetime, data$Global_active_power, type = "l", 
          ylab = "Global Active Power (kilowatts)", xlab = "")
    
    # redo plot 3
    plot( datetime, data$Sub_metering_1, type = "l", 
          ylab = "Energy sub metering", xlab = "")
    lines( datetime, data$Sub_metering_2, type = "l", col = "red")
    lines( datetime, data$Sub_metering_3, type = "l", col = "blue")
    legend( "topright", lty = 1, col = c("black", "red", "blue"), 
            legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # Voltage plot
    plot( datetime, data$Voltage, type = "l", 
          ylab = "Voltage", xlab = "datetime")
    
    # Global reactive power plot
    plot( datetime, data$Global_reactive_power, type = "l", 
          ylab = "Global_reactive_power", xlab = "datetime")
    
    
    par(mfcol = save)
    dev.off()    # close png device & complete plot
}



