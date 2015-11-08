
library(dplyr)

###################################################################################################
# Loading data from 1/2/2007 to 2/2/2007 (the data should be in your working directory)

names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
           "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
my_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";"
                      , skip = 66636, nrows = 2880)
my_data <- setNames(my_data, names)

###################################################################################################
# plotting plot3 (Energy sub metering from thursday until Saturday for different sub_metering)

my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
both_date_time <- paste(as.Date(my_data$Date), my_data$Time)
my_data$Date_and_Time <- as.POSIXct(both_date_time)

par(mfrow = c(2,2))

plot(my_data$Global_active_power ~ my_data$Date_and_Time, type="l",
     ylab="Global Active Power", xlab="")

plot(my_data$Voltage ~ my_data$Date_and_Time, type="l",
     ylab="Voltage", xlab="DateTime")

legend_names = c("Sub_Metering_1                            ", "Sub_Metering_2", "Sub_Metering_3")

with(my_data, {plot(my_data$Sub_metering_1 ~ my_data$Date_and_Time, type="l",
                    ylab="Energy sub metering", xlab="")
        lines(my_data$Sub_metering_2 ~ my_data$Date_and_Time, col = "red")
        lines(my_data$Sub_metering_3 ~ my_data$Date_and_Time, col = "blue")
        legend("topright", col = c("black", "red", "blue"), legend = legend_names, lty = 1,  bty="n", cex = 0.7)})

plot(my_data$Global_reactive_power ~ my_data$Date_and_Time, type="l",
     ylab="Global Reactive Power", xlab="DateTime")

###################################################################################################
# saving plot as a png file in your working directory

dev.copy(png, file="./plot4.png", width=480, height=480)
dev.off()