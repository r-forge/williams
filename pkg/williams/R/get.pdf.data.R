get.pdf.data <- function(years = c(2001:2010)){

    ## Create an empty dataframe which will be filled with each
    ## concurrent year running through the loop.

    y.all.years <- data.frame()

    ## The following loop runs through one year of data at a time for
    ## as many years as are specified in the years vector

    for(i in 1:length(years)){

        ## Isolate the current year running through the loop

        current.year <- years[i]

        ## setup.pdf.data reads in and structures the data such that
        ## the professor information can be more easily extracted by
        ## other functions

        x <- setup.pdf.data(current.year)

        ## get.prof.info extracts the professor name and title
        ## information from the data

        prof.info <- get.prof.info(x, current.year)

        ## get.degree.info extracts the professor's undergraduate and
        ## graduate degree information from the data. This includes
        ## the degree name, year in which it was obtained, and the
        ## institution from which it was received.

        degree.info <- get.degree.info(x)

        ## From the current.year, create an academic.year variable in
        ## the format YYYY-YYYY

        academic.year <- rep(paste(current.year - 1,
                                   current.year, sep = "-"),
                             times = nrow(prof.info))
        academic.year <- data.frame(academic.year)

        ## Combine all the extracted data into one dataframe

        y <- cbind(academic.year, prof.info, degree.info)

        ## Append current year's data with all other years already
        ## passed through the loop

        y.all.years <- rbind(y.all.years, y)
    }
    return(y.all.years)
}
