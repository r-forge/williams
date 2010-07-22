## Read in for year 2000 data (originally in HTML format)

setwd("c:/Users/Andrew/Desktop/R stuff/faculty project/raw data")

## Establish trim function to remove leading and trailing blanks

.trim <- function(str){
    names(str) <- c()
    str <- sub("^ +", "", str)
    str <- sub(" +$", "", str)
}


alldata <- data.frame()

years <- c(1998:2000)


for(j in 1:length(years)){

    ## The yrs vector encompasses all the years of data to be run using the
    ## html read-in function

    ## Read in the raw data for the current year in the loop

    current.year <- years[j]

    x <- setup.html.data(current.year)

    ## Create a list of departments

    department <- get.department(x)

    ## Extract professor names and titles from each department, and
    ## assign the department information to each professor

    info.html <- get.info.html(x, department, current.year)

    ## Create academic year variable

    acyr <- paste(current.year - 1, current.year, sep = "-")

    ## In order to append the HTML data to the PDF data, create blank
    ## fields containing missing values

    academic.year <- rep(acyr, times = nrow(info.html))
    first.name <- rep(NA, times = nrow(info.html))
    middle.name <- rep(NA, times = nrow(info.html))
    last.name <- rep(NA, times = nrow(info.html))
    undergrad.degree <- rep(NA, times = nrow(info.html))
    undergrad.school <- rep(NA, times = nrow(info.html))
    undergrad.year <- rep(NA, times = nrow(info.html))
    grad.degree <- rep(NA, times = nrow(info.html))
    grad.school <- rep(NA, times = nrow(info.html))
    grad.year <- rep(NA, times = nrow(info.html))

    ## Create a dataframe including all fields from both the PDF and
    ## HTML data

    y <- data.frame(academic.year,
                    first.name,
                    middle.name,
                    last.name,
                    undergrad.degree,
                    undergrad.school,
                    undergrad.year,
                    grad.degree,
                    grad.school,
                    grad.year,
                    est.age)

    ## Append the data to the previously generated dataframe

    z <- cbind(info.html, y)

    alldata <- rbind(alldata, z)

}
