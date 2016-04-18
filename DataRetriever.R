
## Helper R script to download the file from the internet and 
## get data from dates 2007-02-01 and 2007-02-02 into R
## This R script is used by all the 4 plotting scripts

## Main method to get the plotting data
getAssignmentData <- function() {

    ## Create a directory to store the data downloaded
    ## Just a convenient directory to differentiate between the R Scripts
    ## and the data
    datadir <- "./data"
    if (! file.exists(datadir)) {
        dir.create(datadir) 
    }
    
    ## Create the data file and zip file names
    dataFile <- paste0(datadir, "/household_power_consumption.txt")
    zipFile <- paste0(datadir, "/PowerConsumption.zip")
    
    ## Download the zip file only if it does not exist
    if(!file.exists(zipFile)) {
        
        ## Download file from the url provided in the assignment
        ## to the data directory
        dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        download.file(dataURL,zipFile,method="curl")
    }
    
    ## Unzip the file in the data directory
    if(!file.exists(dataFile)) {
        
        ## Unzip and extract the text file
        unzip(zipFile, exdir = datadir)
    }
    
    
    ## Read data from dates 2007-02-01 and 2007-02-02 into R
    ## Since we are converting the data from the text file to a table
    ## add column names
    tableData <- read.table(text = grep("^[1,2]/2/2007", readLines(dataFile), value = TRUE),
                            sep = ";", stringsAsFactor = FALSE, nrows = 2880,
                            colClasses = c(rep("character", 2), rep("numeric", 7)),
                            col.names = c("Date", "Time", "GlobalActivePower",
                                          "GlobalReactivePower", "Voltage",
                                          "GlobalIntensity", "Submetering1",
                                          "Submetering2", "Submetering3"))
    
    ## Combine date and time to form the timestamp
    ## and return the resulting data
    resultData <<- with(tableData,
                 data.frame(Timestamp = strptime(paste(Date, Time),
                                                 format="%d/%m/%Y %H:%M:%S"),
                            GlobalActivePower, GlobalReactivePower, Voltage,
                            GlobalIntensity, Submetering1, Submetering2,
                            Submetering3))
}

