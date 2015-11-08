
library(dplyr)

###################################################################################################
# Loading data from 1/2/2007 to 2/2/2007 (the data should be in your working directory)

names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
           "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
my_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";"
                      , skip = 66636, nrows = 2880)
my_data <- setNames(my_data, names)

###################################################################################################
# plotting plot2 (Global Active Power from thursday until Saturday)

my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
both_date_time <- paste(as.Date(my_data$Date), my_data$Time)
my_data$Date_and_Time <- as.POSIXct(both_date_time)

plot(my_data$Global_active_power ~ my_data$Date_and_Time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


###################################################################################################
# saving plot as a png file in your working directory

dev.copy(png, file="./plot2.png", width=480, height=480)
dev.off()