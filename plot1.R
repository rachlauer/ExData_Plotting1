#Read in dataset  UC Irvine Machine Learning Repository called " Electric power consumption "
#We only need the data from 2/1/07 to 2/2/07. The dataset is very large so we're better off reading only those dates

hpc <- read.table("C:/Users/vuser/Desktop/Coursera/Exploratory Data Analysis/household_power_consumption.txt", header=FALSE,
                  col.names= c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                               "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                  colClasses=c(rep("character",2), rep("numeric",7)), na.strings="?", sep=";", nrows=2880, skip=66637, comment.char="")


#save plot1 to a png file
png(filename="C:/Users/vuser/Desktop/Coursera/Exploratory Data Analysis/plot1.png")
hist(hpc$Global_active_power, xlab="Global Active Power (Kilowatts)", main="Global Active Power", col="red")
dev.off()