fileUrl <- "household_power_consumption.txt"

#read data
power_use <- read.table(fileUrl, 
                        header = TRUE, sep = ";", 
                        colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", "numeric"),
                        stringsAsFactors = FALSE,
                        na.strings = c("NA", "?")
)

# subset data for dates 1/2/2007 and 2/2/2007
power_use <- subset(power_use, Date == "1/2/2007" | Date ==  "2/2/2007")

#create Datetime column that includes date and time 
power_use$Datetime <- strptime(paste(power_use$Date, power_use$Time), format = "%d/%m/%Y %H:%M:%S")

#plot 3 
with(power_use, {
  plot(Datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  points(Datetime, Sub_metering_1, type="l", col="black")
  points(Datetime, Sub_metering_2, type="l", col="red")
  points(Datetime, Sub_metering_3, type="l", col="blue")
  legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

#copy plot into png file 
dev.copy(png, file = "plot3.png")
dev.off()
