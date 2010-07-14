setup.html.data <-
function(yrs, j){

    ## Read in the raw data for the current year in the loop

    x <- readLines(paste(yrs[j], "data.txt", sep = ""))

    ## Extract the lines containing department names

    y <- grep("\\(Div.", x)

    return(list(x = x, y = y))
}

