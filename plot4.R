#Read the source data 
power<-read.table("household_power_consumption.txt",sep = ";",skip = 1,colClasses = "character")

# Set column names
colnames(power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2","Sub_metering_3")

#Join date and time column for plotting
power$DT<-paste(power$Date,power$Time)

#Convert Date column to date format
power$Date<-as.Date(power$Date,format="%d/%m/%Y")

#Subset data to choose only the two required dates
final<-subset(power,Date=="2007-02-01" | Date=="2007-02-02")

#Convert date time column to time class
final$DT<-strptime(final$DT,format = "%d/%m/%Y %H:%M:%S")

#Open PNG device for plotting
png("plot4.png",width = 480, height = 480)

#Set the layout and margins to draw 4 plots
par(mar=c(5,4,0.5,0.5),mfrow=c(2,2))

#Draw plot 1
plot(final$DT,as.numeric(final$Global_active_power),type="n",xlab="",ylab="Global Active Power")
lines(final$DT,as.numeric(final$Global_active_power))

#Draw plot 2
plot(final$DT,as.numeric(final$Voltage),type="n",xlab="datetime",ylab="Voltage")
lines(final$DT,as.numeric(final$Voltage))

#Draw plot 3
plot(final$DT,as.numeric(final$Sub_metering_1),type="n",xlab="",ylab="Energy Sub metering")
lines(final$DT,as.numeric(final$Sub_metering_1))
lines(final$DT,as.numeric(final$Sub_metering_2),col="Red")
lines(final$DT,as.numeric(final$Sub_metering_3),col="Blue")
legend("topright",inset=.02,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("Black","Red","Blue"),lty=1,box.lty = 0)

#Draw plot 4
plot(final$DT,as.numeric(final$Global_reactive_power),type="n",xlab="datetime",ylab="Global_reactive_power")
lines(final$DT,as.numeric(final$Global_reactive_power))

#Close the PNG device
dev.off()
