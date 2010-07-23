get.pdf.data <- function(){

####################################################################
####################################################################
## Name: faculty_allyrs.R
##
## Author: Andrew Leeser
##
## Purpose:
## The purpose of the faculty_allyrs code is to read in
## Williams College faculty data from 2001 through 2010, downloaded
## from course catalogs online.
##
## The data was obtained in two different formats. From 2001-2010, the
## original data was downloaded as a PDF and converted into a txt
## file. From 1998-2000, the data was extracted from the HTML code and
## also converted to a txt file. The content and structure between the
## two formats differs significantly, and therefore the function below is
## only designed to read in the PDF formatted data.
####################################################################
####################################################################

    setwd("c:/Users/Andrew/Desktop/R stuff/faculty project/raw data")

    ## Establish trim function to remove leading and trailing blanks

    .trim <- function(str){
        names(str) <- c()
        str <- sub("^ +", "", str)
        str <- sub(" +$", "", str)
    }

    y.all.years <- data.frame()

    ## Read in data originally in PDF format

    ## The yrs vector encompasses all the years of data to be run using the
    ## PDF data read-in function

    years <- c(2001:2010)

    ## The following loop runs through one year of data at a time

    for(i in 1:length(years)){

        ## Read in and structure the data such that the information can be
        ## more easily extracted

        current.year <- years[i]

        x <- setup.pdf.data(current.year)

        prof.info <- get.prof.info(x, current.year)

        degree.info <- get.degree.info(x)

        ## Department information is included in HTML format, therefore a
        ## blank field must be created to later append the data

        academic.year <- rep(paste(current.year - 1,
                                   current.year, sep = "-"),
                             times = nrow(prof.info))
        academic.year <- data.frame(academic.year)

        ## Combine all the data for the year in a dataframe

        y <- cbind(academic.year, prof.info, degree.info)

        ## Append current year's data with all other years in the loop

        y.all.years <- rbind(y.all.years, y)
    }
save(y.all.years, file = "pdf.data.Rdata")
return(y.all.years)
}
