get.html.data <- function(){

    ## Read in for year 2000 data (originally in HTML format)

    ## Establish trim function to remove leading and trailing blanks

    y.all.years <- data.frame()

    years <- c(1998:2000)

    for(i in 1:length(years)){

        ## The yrs vector encompasses all the years of data to be run
        ## using the html read-in function

        ## Read in the raw data for the current year in the loop

        current.year <- years[i]

        x <- setup.html.data(current.year)

        ## Create a list of departments

        department <- get.department(x)

        ## Extract professor names and titles from each department, and
        ## assign the department information to each professor

        info.html <- get.info.html(x, department, current.year)

        ## Create academic year variable

        academic.year <- rep(paste(current.year - 1,
                                   current.year, sep = "-"),
                             times = nrow(info.html))
        academic.year <- data.frame(academic.year)

        ## Create a dataframe including all fields from both the PDF and
        ## HTML data

        y <- cbind(academic.year, info.html)

        ## Append the data to the previously generated dataframe

        y.all.years <- rbind(y.all.years, y)
    }
    return(y.all.years)
}
