# Directory that contains the downloaded dataset
setwd("/Users/krishnaprempasumarthy/Downloads/")

# Load the required data into data frame df
df <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE)
df <- subset(df,df$Date == "1/2/2007" | df$Date == "2/2/2007")

# Make the required histogram plot
hist(as.numeric(df$Global_active_power),xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power" ,ylim = c(1,1250))

# Copy this plot to 'plot1.png'
dev.copy(png,"plot1.png",width = 480, height = 480)
dev.off()