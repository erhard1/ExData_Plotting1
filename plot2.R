## Exploratory Data Analysis Course Project 1 - plot2.R
library(tidyverse)
library(lubridate)

dataset_url <- paste0("https://d396qusza40orc.cloudfront.net/",
                      "exdata%2Fdata%2Fhousehold_power_consumption.zip")
downloaded_zipfile <- "./household_power_consumption.zip"
if (!file.exists(downloaded_zipfile)) {
        download.file(dataset_url, destfile = downloaded_zipfile, 
                      method = "curl", mode = "wb")
}
unzipped_file_folder <- "./household_power_consumption.txt"

if (!file.exists(unzipped_file_folder)) {
        unzip(downloaded_zipfile, unzip = "internal")
}
consumption_data <- read_delim('household_power_consumption.txt', delim = ";", 
                               na = c("?", "NA"), show_col_types = FALSE)
my_subset <- filter(consumption_data, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- dmy_hms(paste(my_subset$Date, my_subset$Time, sep = " "))

png(file="plot2.png",
    width=480, 
    height=480, 
    pointsize=12)

with(my_subset, plot(datetime, Global_active_power, type = "l", 
                     ylab = "Global Active Power (kilowatts)", xlab = ''))

dev.off()