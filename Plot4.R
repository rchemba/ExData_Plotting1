## R Script to plot the 4 panels using data obtained from
## from the UC Irvine Machine Learning Repository

## Source the helper R Script which is used to retrieve data
## from the internet.
source("DataRetriever.R")
plotData <- getAssignmentData()

## Create a directory to store the images
## Just a convenient directory to differentiate between the R Scripts
## the data and the resulting plots

imgdir <- "./img"
if (!file.exists(imgdir)) {
    dir.create(imgdir)
}

## Construct the plot and store it in Plot4.png
makePlot4(plotData, paste0(imgdir, "/Plot4.png"))

## Close all the connections that might be opened to
## get data.
closeAllConnections()

## Method to create the plot
## @Input fileData : Data to be plotted
## @ Input outputFile : The name of the png file to plot the data
makePlot4 <- function(fileData, outputFile) {
    
    ## Store plot data in png file
    png(filename = outputFile,
        width = 480,
        height = 480)
    
    ## Set plot panel to a (2,2) matrix
    par(mfcol = c(2, 2))
    
    ## First plot is a repeat of the Plot done using Plot2.R
    
    plot(
        fileData$Timestamp,
        fileData$GlobalActivePower,
        type = "l",
        xlab = "",
        ylab = "Global Active Power"
    )
    
    ## Second plot is a repeat of the Plot done using Plot3.R
    
    plot(
        fileData$Timestamp,
        fileData$Submetering1,
        type = "n",
        xlab = "",
        ylab = "Energy sub metering"
    )
    
    points(fileData$Timestamp,
           fileData$Submetering1,
           type = "l",
           col = "black")
    
    points(fileData$Timestamp,
           fileData$Submetering2,
           type = "l",
           col = "red")
    
    points(fileData$Timestamp,
           fileData$Submetering3,
           type = "l",
           col = "blue")
    
    legend(
        "topright",
        col = c("black", "red", "blue"),
        lty = c(1, 1, 1),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    )
    
    ## The third plot is a plot of Voltage against the timestamp
    plot(
        fileData$Timestamp,
        fileData$Voltage,
        type = "l",
        xlab = "datetime",
        ylab = "Voltage"
    )
    
    ## The fourth plot is a  plot o reactive power against the timestamp
    plot(
        fileData$Timestamp,
        fileData$GlobalReactivePower,
        type = "l",
        xlab = "datetime",
        ylab = "Global_reactive_power"
    )
    
    ## Close the device (the png)
    dev.off()
    
}
