# Load the necessary packages
library("dplyr")
library("data.table")

# Directory that contains the downloaded dataset
setwd("/Users/krishnaprempasumarthy/Downloads/")

# Load the required data into data frame df
df <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE)
df <- subset(df,df$Date == "1/2/2007" | df$Date == "2/2/2007")

# Convert values in the first column to dates and change their format
newdate <- strptime(as.character(df$Date), "%d/%m/%Y")
df$Date <- lapply(newdate,function(x) format(x,"%Y-%m-%d"))

# Now plot the data over the two day period
newtime <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
plot(newtime, df$Global_active_power, type = "l", xlab="", ylab="Energy sub meeting")

# Copy this plot to 'plot2.png'
dev.copy(png,"plot2.png",width = 480, height = 480)
dev.off()