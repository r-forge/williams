get.html.data <- function(years = c(1998:2000)){

    ## Create an empty dataframe which will be filled with each
    ## concurrent year running through the loop.

    y.all.years <- data.frame()

    ## The following loop runs through one year of data at a time for
    ## as many years as are specified in the years vector

    for(i in 1:length(years)){

        ## Isolate the current year running through the loop

        current.year <- years[i]

        ## setup.html.data reads in the data such that the professor
        ## information can be easily extracted by other functions

        x <- setup.html.data(current.year)

        ## Create a list of departments in the html data

        department <- get.department(x)

        ## Extract professor names and titles from each department, and
        ## assign the department information to each professor

        info.html <- get.info.html(x, department, current.year)

        ## From the current.year, create an academic.year variable in
        ## the format YYYY-YYYY

        academic.year <- rep(paste(current.year - 1,
                                   current.year, sep = "-"),
                             times = nrow(info.html))
        academic.year <- data.frame(academic.year)

        ## Combine all the extracted data into one dataframe

        y <- cbind(academic.year, info.html)

        ## Append current year's data with all other years already
        ## passed through the loop

        y.all.years <- rbind(y.all.years, y)
    }
    return(y.all.years)
}
