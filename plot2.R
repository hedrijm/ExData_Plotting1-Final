data <- read.table("household_power_consumption.txt",sep = ";", header = T,
                   na.strings = "?")
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
df <- na.omit(data[data$Date >= as.POSIXct("2007-02-01 00:00:00") &
                     data$Date < as.POSIXct("2007-02-03 00:00:00"),])
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot2 <- plot(df$Date, df$Global_active_power, type = "l",
              ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
