#Read in dataset  UC Irvine Machine Learning Repository called " Electric power consumption "
#We only need the data from 2/1/07 to 2/2/07. The dataset is very large so we're better off reading only those dates

hpc <- read.table("C:/Users/vuser/Desktop/Coursera/Exploratory Data Analysis/household_power_consumption.txt", header=FALSE,
                  col.names= c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                               "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                  colClasses=c(rep("character",2), rep("numeric",7)), na.strings="?", sep=";", nrows=2880, skip=66637, comment.char="")

#combine date and time to the date/time class POSIXlt
hpc$date_time <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

#save plot4 to a png file
png(filename="C:/Users/vuser/Desktop/Coursera/Exploratory Data Analysis/plot4.png")
par(mfrow=c(2,2))
plot(hpc$date_time,hpc$Global_active_power, xlab = "" , ylab="Global Active Power", type="l")
plot(hpc$date_time,hpc$Voltage, xlab = "datetime" , ylab="Voltage", type="l")
plot(hpc$date_time, hpc$Sub_metering_1, xlab = "" , ylab="Energy sub metering", type="l")
lines(hpc$date_time, hpc$Sub_metering_2, col="red", type="l")
lines(hpc$date_time, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")
plot(hpc$date_time,hpc$Global_reactive_power, xlab = "datetime" , ylab="Global_reactive_power", type="l")
dev.off()