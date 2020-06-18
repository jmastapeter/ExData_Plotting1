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

plot1 <- function() {
    #Set up Plot 1 by defining values and labels
    hist(dataplot_1$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",
         main="Global Active Power")
    #Save copy of plot as a .png
    dev.copy(png, file="plot1.png", width=480, height=480)
    dev.off()
}
#Print Plot
plot1()