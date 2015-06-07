fileUrl <- "household_power_consumption.txt"

# read data
power_use <- read.table(fileUrl, 
                        header = TRUE, sep = ";", 
                        colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", "numeric"),
                        stringsAsFactors = FALSE,
                        na.strings = c("NA", "?")
)

# subset data for dates 1/2/2007 and 2/2/2007
power_use <- subset(power_use, Date == "1/2/2007" | Date ==  "2/2/2007")

# histogram for plot 1
hist(power_use$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# copy plot to png file 
dev.copy(png, file = "plot1.png")
dev.off()
