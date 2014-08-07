data <- read.table("household_power_consumption.txt",sep = ";", header = T,
                   na.strings = "?")
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
df <- na.omit(data[data$Date >= as.POSIXct("2007-02-01 00:00:00") &
                     data$Date < as.POSIXct("2007-02-03 00:00:00"),])
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot2 <- plot(df$Date, df$Global_active_power, type = "l",
              ylab = "Global Active Power", xlab = "")
plot <- plot(df$Date, df$Voltage, type = "l",
             ylab = "Voltage", xlab = "datetime")
plot4 <- with(df, plot(Date, Sub_metering_1, type = "l",
                       ylab = "Energy sub metering", xlab = ""))
lines(df$Date, df$Sub_metering_2, type = "l", col = "red")
lines(df$Date, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot <- plot(df$Date, df$Global_reactive_power, type = "l",
             ylab = "Global_reactive_power", xlab = "datetime")
dev.off()