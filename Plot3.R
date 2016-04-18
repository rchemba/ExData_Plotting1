

## R Script to create a base plot using the data from
## the UC Irvine Machine Learning Repository

## Source the helper R Script which is used to retrieve data
## from the internet.
source("DataRetriever.R")

## Retrieve the data to plot
plotData <- getAssignmentData()

## Create a directory to store the images
## Just a convenient directory to differentiate between the R Scripts
## the data and the resulting plots

imgdir <- "./img"
if (!file.exists(imgdir)) {
    dir.create(imgdir)
}

## Construct the plot and store it in Plot3.png
makePlot3(plotData, paste0(imgdir, "/Plot3.png"))

## Close all the connections that might be opened to
## get data
closeAllConnections()


## Method to create the plot
## @Input fileData : Data to be plotted
## @ Input outputFile : The name of the png file to plot the data
makePlot3 <- function(fileData, outFile) {
    
    ## Store plot data in png file
    png(filename = outFile,
        width = 480,
        height = 480)
    
    ## Create an empty plot
    plot(
        fileData$Timestamp,
        fileData$Submetering1,
        type = "n",
        xlab = "",
        ylab = "Energy sub metering"
    )
    
    ## Add the lines to the base plot
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
    
    ## Add the legend to the base plot
    legend(
        "topright",
        col = c("black", "red", "blue"),
        lty = c(1, 1, 1),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    )
    
    ## Close the device (the png)
    dev.off()
    
}
