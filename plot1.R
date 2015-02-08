## Reads the .txt file
original <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
original$Date <- as.Date(original$Date, format="%d/%m/%Y")

## Subsets the data
data <- subset(original, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(original)

## Converts dates
date_time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date_time)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saves to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()