## Read in for year 2000 data (originally in HTML format)

for(j = 1:length(yrs)){

    ## The yrs vector encompasses all the years of data to be run using the
    ## html read-in function

    yrs <- c("9900")

    ## Read in the raw data for the current year in the loop

    rawdata <- setup.html.data(yrs,j)

    ## Extract the academic year and format it consistent with PDF data

    acyr <- get.acyear.html(rawdata[["x"]])

    ## Create a list of departments

    prg <- get.prg(rawdata[["y"]])

    ## Extract professor names and titles from each department, and
    ## assign the department information to each professor

    html.info.2000 <- get.info.2000(rawdata[["x"]],rawdata[["y"]])

    ## In order to append the HTML data to the PDF data, create blank
    ## fields containing missing values

    year <- rep(acyr, times = length(allprofs))
    first.name <- rep("N/A", times = length(allprofs))
    middle.name <- rep("N/A", times = length(allprofs))
    last.name <- rep("N/A", times = length(allprofs))
    undergrad.degree <- rep("N/A", times = length(allprofs))
    undergrad.school <- rep("N/A", times = length(allprofs))
    undergrad.year <- rep("N/A", times = length(allprofs))
    grad.degree <- rep("N/A", times = length(allprofs))
    grad.school <- rep("N/A", times = length(allprofs))
    grad.year <- rep("N/A", times = length(allprofs))
    est.age <- rep("N/A", times = length(allprofs))

    ## Create a dataframe including all fields from both the PDF and
    ## HTML data

    data <- data.frame("academic.year" = year,
                       "professor" = allprofs,
                       first.name,
                       middle.name,
                       last.name,
                       undergrad.degree,
                       undergrad.school,
                       undergrad.year,
                       grad.degree,
                       grad.school,
                       grad.year,
                       est.age,
                       "title" = alltitles,
                       "department" = alldepts)

    ## Append the data to the previously generated dataframe

    alldata <- rbind(alldata, data)

}
