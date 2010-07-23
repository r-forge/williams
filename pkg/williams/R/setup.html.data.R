setup.html.data <- function(yr){

    ## Read in the raw data for the current year in the loop

    yr1 <- yr - 1

    yrs <- paste(substr(yr1, 3, 4), substr(yr, 3, 4), sep = "")

    return(unlist(readLines(paste(yrs, "data.txt", sep = ""))))
}
