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
# plot 2
png(file="plot2.png")
with(epc_subset, plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()
