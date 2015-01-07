raw.data <- read.delim("household_power_consumption.txt",
                    sep = ";", dec=".", na.strings="?",
                    colClasses=c("character","character","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric"))

select.data<- raw.data[ raw.data$Date %in% c("1/2/2007","2/2/2007"),]

clean.data <- within(select.data, { DateTime=as.POSIXct(paste(Date, Time),
                          format="%d/%m/%Y %H:%M:%S") })

png("plot1.png",width=480,height=480)

hist(clean.data$Global_active_power, col="red",
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
