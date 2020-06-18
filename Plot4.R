#Set Working Directory for R Code and PNGs
setwd("C:/Users/mastapeterj/Documents/Coursera_DataScience/PlottingAssignment1")
#Manipulate the zip file into a table
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", comment.char = "%", stringsAsFactors = FALSE, na.strings = "?")
#Check the dimensions of the table
dim(df)
#Extract the data necessary to the assignment, the rows between 1/2/2007 and 2/2/2007
dataplot_1<- subset(df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
#Extract Time values for future use in plotting data
datetime <- strptime(paste(dataplot_1$Date, dataplot_1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Configure format of plots
par(mfrow = c(2,2))
plot4 <- function(){
    #Define values and labels of first plot in series
    plot(datetime, dataplot_1$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")
    #Define values and labels of second plot in series
    plot(datetime, dataplot_1$Voltage, ylab = "Voltage", type = "l")
    #Define values and labels of third plot in series
    plot(datetime, dataplot_1$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    #Define plot attributes
    lines(datetime, dataplot_1$Sub_metering_1, col = "black")
    lines(datetime, dataplot_1$Sub_metering_2, col = "red")
    lines(datetime, dataplot_1$Sub_metering_3, col = "blue")
    legend("topright", lty = 1, lwd = 3,col = c("black","red","blue"), legend = c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"))
    #Define values and labels of fourth plot in series
    plot(datetime, dataplot_1$Global_reactive_power, type = "l", ylab = "Global_reactive_power")
    dev.copy(png,file = "plot4.png", width = 480, height = 480)
    dev.off()
}
#Print plot
plot4()