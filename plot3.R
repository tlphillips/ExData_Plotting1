#Download and unzip file
urlfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(urlfile, "household_power_consumption.zip")
unzip("household_power_consumption.zip")

# Open file and create data subset
hpc <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc <- subset(hpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Create DateTime variable
DateTime <- paste(hpc[,1], hpc[,2])
hpc$DateTime <- as.POSIXct(DateTime)

# Open device create plot and write file.
png(filename = "plot3.png")
plot(hpc$DateTime, hpc[,7], type = "l", ylab = "Energy sub Metering", xlab = "")
points(hpc$DateTime, hpc[,8], col = "Red", type = "l")
points(hpc$DateTime, hpc[,9], col = "Blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"), lty = 1)
dev.off()