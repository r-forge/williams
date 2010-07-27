setup.html.data <- function(year){

    ## setup.html.data reads in the data such that the professor
    ## information can be easily extracted by other functions. It has
    ## one input - year.

    ## year is the current year being run in the loop

    require(williams)

    ## Format the year to match the format in the txt filenames

    yr1 <- year - 1

    yrs <- paste(substr(yr1, 3, 4), substr(year, 3, 4), sep = "")

    ## Establish the path and filename for the year's txt file

    filename <- system.file("faculty",
                            "html data",
                            paste(yrs, "data.txt", sep = ""),
                            package = "williams")

    ## Read in the raw data file and return it as a vector

    return(unlist(readLines(filename)))
}
