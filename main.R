electric <- read.table("D:/Desktop/coursera/household_power_consumption.txt", header =TRUE, sep =';')

# Transform the 
electric$Date <- strptime(paste(electric$Date, electric$Time), format = "%d/%m/%Y %H:%M:%S")
electric$Global_active_power <- as.numeric(electric$Global_active_power)

# Define the range to be plotted
date1 <- strptime("01/02/2007",  format = "%d/%m/%Y")
date2 <- strptime("03/02/2007",  format = "%d/%m/%Y")

# subset it
sample <- subset(electric, Date >= date1 & Date <= date2)


# Plot 1
hist(sample$Global_active_power / 1000, main = "Global Active Power"
                                              , xlab = "Global Active Power (kilowatts)"    
                                              , col = "Red"
                                              , breaks = seq(0,6,0.25)
                                              , ylim = c(0,1200)                                         
                                              , xlim = c(0,6)
                                              , xaxt="n")
axis(1, xaxp=c(0, 6, 3), las=1)


#Plot 2
plot (sample$Date,sample$Global_active_power / 1000, ylim = c(0,6), type="n", yaxt="n", xlab="", ylab = "Global Active Power (kilowatts)")
axis(2, at=seq(0, 6, 2), las=3)
lines(sample$Date, sample$Global_active_power / 1000)

#Plot 3
plot (sample$Date,as.numeric(sample$Sub_metering_1), ylim = c(0,30), type="n", yaxt="n", xlab="", ylab = "Energy submetering")
axis(2, at=seq(0, 30, 10), las=3)
lines(sample$Date, as.numeric(sample$Sub_metering_1), col = "Green")
lines(sample$Date, as.numeric(sample$Sub_metering_2), col = "Red")
lines(sample$Date, as.numeric(sample$Sub_metering_3), col = "Blue")

#Plot 4
plot (sample$Date,sample$Voltage, type="n", ylab = "Voltage", yaxt="n", xlab="datetime")
axis(2, at=seq(234, 246, 4), las=3)
lines(sample$Date, sample$Voltage)
