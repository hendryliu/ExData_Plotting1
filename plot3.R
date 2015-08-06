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
# plot 3
png(file="plot3.png")
with(epc_subset, {
  plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  })
legend("topright", col=c("black", "red", "blue"), legend=names(epc_subset)[5:7], lty=c(1,1,1))
dev.off()
