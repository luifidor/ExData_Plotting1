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

#Plot 2
par(mfrow=c(1,1))
plot (sample$Date,sample$Global_active_power, ylim = c(0,8), type="n", yaxt="n", xlab="", ylab = "Global Active Power (kilowatts)")
axis(2, at=seq(0, 6, 2), las=3)
lines(sample$Date, sample$Global_active_power)


#copy to a file
dev.copy(png, filename="//wbad.group/DFS_WB/10_Home/uwbbenoelf/DATA/Desktop/GIT Folder/course2/ExData_Plotting1/plot2.png", width=480, height=480)
dev.off()