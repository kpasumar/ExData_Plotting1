setwd("/Users/krishnaprempasumarthy/Downloads/")
df <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE)
df <- subset(df,df$Date == "1/2/2007" | df$Date == "2/2/2007")
hist(as.numeric(df$Global_active_power),xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power" ,ylim = 1200)