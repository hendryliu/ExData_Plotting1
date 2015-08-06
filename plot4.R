rm(list=ls())
# read file and subset
epc <- read.table("household_power_consumption.txt",header=TRUE, sep =";", na.strings="?", stringsAsFactors = FALSE)
DateTime <- paste(epc$Date, epc$Time)
epc$DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
epc$Date <- NULL
epc$Time <- NULL
epc_subset <- subset(epc, DateTime >= strptime("2007-02-01", "%Y-%m-%d") & DateTime < strptime("2007-02-03", "%Y-%m-%d"))
rm(epc)
# load("epc_0102Feb2007.rda")
# plot 4
png(file="plot4.png")
par(mfrow=c(2,2)) # multi-plot
with(epc_subset, {
  plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l") # plot at topleft
  plot(DateTime, Voltage, type="l", xlab="datetime") # plot at topright
  # plot at bottomleft
  plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), legend=names(epc_subset)[5:7], lty=c(1,1,1))
  # plot at bottom right
  plot(DateTime, Global_reactive_power, type="l", xlab="datetime") # plot at topright
})
dev.off()
