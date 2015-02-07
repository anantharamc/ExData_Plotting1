#
# This function plots 4 charts in 2 rows and 2 columns and saves it as plot4.png
# Input dataset: Saved in a folder called Household_Power in the working directory
#
Plot4 <- function() {
        
        data <- read.table("./Household_Power/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", 
                           skip = 66636, nrows = 2880, stringsAsFactors = FALSE, 
                           col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                        "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

        # Combine date and time columns into one
        data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
        data <- data[, c(1, 3:9)]
        
        # Open a PNG graphics device and draw 4 charts
        png(filename = "plot4.png", height = 480, width = 480)
        par(mfrow = c(2, 2))
        with (data, {
                plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

                plot(Date, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
                
                plot(Date, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
                        lines(Date, Sub_metering_1, type = "l", col = "black")
                        lines(Date, Sub_metering_2, type = "l", col = "red")
                        lines(Date, Sub_metering_3, type = "l", col = "blue")
                        legend("topright", cex = 0.9, bty = "n", yjust = 0, lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                
                plot(Date, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
                
        })

        # Close graphics device
        dev.off()
        
}


