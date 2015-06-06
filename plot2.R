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
png(filename = "plot2.png")
plot(hpc$DateTime, hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()