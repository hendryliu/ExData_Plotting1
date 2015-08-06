rm(list=ls())
epc <- read.table("household_power_consumption.txt",header=TRUE, sep =";", na.strings="?", stringsAsFactors = FALSE)
DateTime <- paste(epc$Date, epc$Time)
epc$DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
epc$Date <- NULL
epc$Time <- NULL
epc_subset <- subset(epc, DateTime >= strptime("2007-02-01", "%Y-%m-%d") & DateTime < strptime("2007-02-03", "%Y-%m-%d"))
save(epc_subset, file="epc_0102Feb2007.rda")
rm(epc)
png(file="plot1.png")
with(epc_subset, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))
dev.off()
