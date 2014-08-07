data <- read.table("household_power_consumption.txt",sep = ";", header = T,
                 na.strings = "?")
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
df <- na.omit(data[data$Date >= as.POSIXct("2007-02-01 00:00:00") &
             data$Date < as.POSIXct("2007-02-03 00:00:00"),])
png(filename = "plot1.png", width = 480, height = 480, units = "px")
plot1 <- hist(df$Global_active_power, freq = TRUE, main = "Global Active Power",
              xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
