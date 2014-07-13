startDate <- strptime("2007-02-01", format="%Y-%m-%d")
endDate <- strptime("2007-02-03", format="%Y-%m-%d")
powerConsumption <- read.table("household_power_consumption.txt", sep=";",na.strings=c("?"), header=T)
powerConsumption$DateTime <- strptime(paste(powerConsumption$Date, powerConsumption$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
powerConsumption <- powerConsumption[powerConsumption$DateTime >= startDate & powerConsumption$DateTime < endDate, ]
par(mfrow = c(1,1))
with(powerConsumption, hist(Global_active_power, ylab="Frequency", xlab="Global Active Party (killowatts)", main="Global Active Power", col="red"))
dev.copy(png, file="./plot1.png", width=633)
dev.off()