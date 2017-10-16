electric <- read.table("//wbad.group/DFS_WB/10_Home/uwbbenoelf/DATA/Desktop/GIT Folder/coursera/data/household_power_consumption.txt", header =TRUE, dec = '.',sep =';')

# Transform the 
electric$Date <- strptime(paste(electric$Date, electric$Time), format = "%d/%m/%Y %H:%M:%S")
electric$Global_active_power <- as.numeric(as.character(electric$Global_active_power))
electric$Sub_metering_1 <- as.numeric(as.character(electric$Sub_metering_1))
electric$Sub_metering_2 <- as.numeric(as.character(electric$Sub_metering_2))
electric$Voltage <- as.numeric(as.character(electric$Voltage))
electric$Global_reactive_power <- as.numeric(as.character(electric$Global_reactive_power))

# Define the range to be plotted
date1 <- strptime("01/02/2007",  format = "%d/%m/%Y")
date2 <- strptime("03/02/2007",  format = "%d/%m/%Y")

# subset it
sample <- subset(electric, Date >= date1 & Date <= date2)

par(mfrow=c(1,1))

# Plot 1
hist(sample$Global_active_power, main = "Global Active Power"
                                              , xlab = "Global Active Power (kilowatts)"    
                                              , col = "Red"
                                                , breaks = 11 
                                                , ylim = c(0,1200)                                         
                                                , xlim = c(0,6)
                                        , xaxt="n")
axis(1, xaxp=c(0, 6, 3), las=1)


#Plot 2
plot (sample$Date,sample$Global_active_power, ylim = c(0,8), type="n", yaxt="n", xlab="", ylab = "Global Active Power (kilowatts)")
axis(2, at=seq(0, 6, 2), las=3)
lines(sample$Date, sample$Global_active_power)

#Plot 3
plot (sample$Date,as.numeric(sample$Sub_metering_1), ylim = c(0,40), type="n", yaxt="n", xlab="", ylab = "Energy submetering")
axis(2, at=seq(0, 30, 10), las=3)
lines(sample$Date, as.numeric(as.character(sample$Sub_metering_1)), col = "Green")
lines(sample$Date, as.numeric(as.character(sample$Sub_metering_2)), col = "Red")
lines(sample$Date, as.numeric(sample$Sub_metering_3), col = "Blue")
legend('topright', c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3") , 
       lty=1, col=c('green','red', 'blue'),cex=1)


#Plot 4
par(mfrow=c(2,2))
par(mar=c(5,4,2,2))
plot (sample$Date,sample$Global_active_power, ylim = c(0,8), type="n", yaxt="n", xlab="", ylab = "Global Active Power (kilowatts)")
axis(2, at=seq(0, 6, 2), las=3)
lines(sample$Date, sample$Global_active_power)

plot (sample$Date,sample$Voltage, type="n", ylab = "Voltage", yaxt="n", xlab="datetime")
axis(2, at=seq(234, 246, 4), las=3)
lines(sample$Date, sample$Voltage)

plot (sample$Date,sample$Sub_metering_1, ylim = c(0,40), type="n", yaxt="n", xlab="", ylab = "Energy submetering")
axis(2, at=seq(0, 30, 10), las=3)
lines(sample$Date, as.numeric(as.character(sample$Sub_metering_1)), col = "Green")
lines(sample$Date, as.numeric(as.character(sample$Sub_metering_2)), col = "Red")
lines(sample$Date, as.numeric(sample$Sub_metering_3), col = "Blue")
legend('topright', c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3") , 
       lty=1, col=c('green','red', 'blue'),cex=1)

plot (sample$Date,sample$Global_reactive_power, type="n", ylab = "Global_reactive_power", yaxt="n", xlab="datetime")
points(sample$Date, sample$Global_reactive_power)
segments(as.numeric(sample$Date), sample$Global_reactive_power, as.numeric(sample$Date), 0, cex = 0.5)
axis(2, at=seq(0, 0.5, 0.1), las=3)