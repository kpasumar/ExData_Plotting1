library("graphics")

# Directory that contains the downloaded dataset
setwd("/Users/krishnaprempasumarthy/Downloads/")

# Load the required data into data frame df
df <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE)
df <- subset(df,df$Date == "1/2/2007" | df$Date == "2/2/2007")

# Convert values in the first column to dates and change their format
newdate <- strptime(as.character(df$Date), "%d/%m/%Y")
df$Date <- lapply(newdate,function(x) format(x,"%Y-%m-%d"))

# Now superimpose plots over the two day period
newtime <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2))
plot(newtime, df$Global_active_power, type = "l", xlab="", ylab ="Gloabal Active Power")

plot(newtime, df$Voltage, type = "l", ylab ="Voltage",xlab = "datetime")

plot(newtime, df$Sub_metering_1, type = "l", xlab="", ylab ="Energy sub meeting",ylim = c(1,40))
par(new=TRUE)
plot(newtime, df$Sub_metering_2, type = "l", ylab ="Energy sub meeting",xlab="",col = "red",ylim = c(1,40))
par(new=TRUE)
plot(newtime, df$Sub_metering_3, type = "l", ylab ="Energy sub meeting", xlab="",col = "blue",ylim = c(1,40))

plot(newtime, df$Global_reactive_power, type = "l", ylab = "Global_reactive_power",xlab = "datetime")

# Copy this plot to 'plot4.png'
dev.copy(png,"plot4.png",width = 480, height = 480)
dev.off()
