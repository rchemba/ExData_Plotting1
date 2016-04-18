
## R Script to create a plot using the data from
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

## Construct the plot and store it in Plot2.png
makePlot2(plotData, paste0(imgdir, "/Plot2.png"))

## Close all the connections that might be opened to
## get data
closeAllConnections()


## Method to create the plot
## @Input fileData : Data to be plotted
## @ Input outputFile : The name of the png file to plot the data
makePlot2 <- function(fileData, outFile) {
    ## Store plot data in png file
    png(filename = outFile,
        width = 480,
        height = 480)
    
    ## Make a plot(with type = l for lines) with the given data
    plot(
        fileData$Timestamp,
        fileData$GlobalActivePower,
        type = "l",
        xlab = "",
        ylab = "Global Active Power (kilowatts)"
    )
    
    ## Close the device (the png)
    dev.off()
    
}
