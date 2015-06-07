fileUrl <- "household_power_consumption.txt"

#read data
power_use <- read.table(fileUrl, 
                        header = TRUE, sep = ";", 
                        colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", "numeric"),
                        stringsAsFactors = FALSE,
                        na.strings = c("NA", "?")
)

#subset data for dates 1/2/2007 and 2/2/2007
power_use <- subset(power_use, Date == "1/2/2007" | Date ==  "2/2/2007")

#format date to include time 
power_use$Datetime <- strptime(paste(power_use$Date, power_use$Time), format = "%d/%m/%Y %H:%M:%S")

#plot 2
with(power_use, plot(Datetime, Global_active_power, type = "l", 
                xlab = "", ylab = "Global Active Power (kilowatts)"))

#copy plot to png file 
dev.copy(png, file = "plot2.png")
dev.off()
