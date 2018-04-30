#Read the source data 
power<-read.table("household_power_consumption.txt",sep = ";",skip = 1,colClasses = "character")

# Set column names
colnames(power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1", "Sub_metering_2","Sub_metering_3")

#Convert Date column to date format
power$Date<-as.Date(power$Date,format="%d/%m/%Y")

#Subset data to choose only the two required dates
final<-subset(power,Date=="2007-02-01" | Date=="2007-02-02")

#Open PNG device for plotting
png("plot1.png",width = 480, height = 480)

#Draw the required histogram
hist(as.numeric(final$Global_active_power),col="Red",xlab = "Global Active Power(kilowatts)",main="Global Acive Power")

#Close the PNG device
dev.off()
