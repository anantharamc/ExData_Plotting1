#
# This function plots Global active power over two day period as line chart and saves it as Plot2.png
# Input dataset: Saved in a folder called Household_Power in the working directory
#
plot2 <- function() {
        
        data <- read.table("./Household_Power/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", 
                           skip = 66636, nrows = 2880, stringsAsFactors = FALSE, 
                           col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                        "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

        # Combine date and time columns into one
        data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
        data <- data[, c(1, 3:9)]
        
        # Open a PNG graphics device and draw line chart for Global Active Power for two day period
        png(filename = "plot2.png", height = 480, width = 480)
        
        plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

        # Close graphics device
        dev.off()
        
}


