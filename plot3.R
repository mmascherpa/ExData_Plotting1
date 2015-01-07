raw.data <- read.delim("household_power_consumption.txt",
                       sep = ";", dec=".", na.strings="?",
                       colClasses=c("character","character","numeric","numeric","numeric",
                                    "numeric","numeric","numeric","numeric"))

select.data<- raw.data[ raw.data$Date %in% c("1/2/2007","2/2/2007"),]

clean.data <- within(select.data, { DateTime=as.POSIXct(paste(Date, Time),
                                                        format="%d/%m/%Y %H:%M:%S") })

png("plot3.png",width=480,height=480)

plot(data=clean.data, Sub_metering_1 ~ DateTime,
     type="l", xlab="", ylab="Energy sub metering")
lines(data=clean.data, Sub_metering_2 ~ DateTime, col = "red")
lines(data=clean.data, Sub_metering_3 ~ DateTime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty=c(1,1),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

