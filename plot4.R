raw.data <- read.delim("household_power_consumption.txt",
                       sep = ";", dec=".", na.strings="?",
                       colClasses=c("character","character","numeric","numeric","numeric",
                                    "numeric","numeric","numeric","numeric"))

select.data<- raw.data[ raw.data$Date %in% c("1/2/2007","2/2/2007"),]

clean.data <- within(select.data, { DateTime=as.POSIXct(paste(Date, Time),
                                                        format="%d/%m/%Y %H:%M:%S") })

png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))
with(clean.data, {
  plot(Global_active_power ~ DateTime, type="l", xlab="", ylab="Global Active Power")
  plot(Voltage ~ DateTime, type="l", xlab="datetime", ylab="Voltage")
  plot(Sub_metering_1 ~ DateTime, type="l", xlab="", ylab="Energy sub metering")
  lines(Sub_metering_2 ~ DateTime, col = "red")
  lines(Sub_metering_3 ~ DateTime, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty=c(1,1),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ DateTime, type="l", xlab="datetime")
})

dev.off()


