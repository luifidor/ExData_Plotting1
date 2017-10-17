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

# Plot 1
par(mfrow=c(1,1))
hist(sample$Global_active_power, main = "Global Active Power"
                                              , xlab = "Global Active Power (kilowatts)"    
                                              , col = "Red"
                                                , breaks = 11 
                                                , ylim = c(0,1200)                                         
                                                , xlim = c(0,6)
                                        , xaxt="n")
axis(1, xaxp=c(0, 6, 3), las=1)

#copy to a file
dev.copy(png, filename="//wbad.group/DFS_WB/10_Home/uwbbenoelf/DATA/Desktop/GIT Folder/course2/ExData_Plotting1/plot1.png", width=480, height=480)
dev.off()