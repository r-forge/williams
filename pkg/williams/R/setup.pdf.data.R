setup.pdf.data <- function(year){

    ## The setup.pdfdata function creates a dataframe from the raw txt
    ## files that enable subsequent functions to more easily extract
    ## the desired information. Specifically, the lines containing
    ## names and titles are seperated from those with information
    ## regarding professor's degrees. The function has one input - year.

    ## year is the current year being run in the loop

    require(williams)

    ## Format the year to match the format in the txt filenames

    year <- paste(substr(year - 1, 3, 4), substr(year, 3, 4), sep = "")

    ## Establish the path and filename for the year's txt file

    filename <- system.file("faculty",
                            "pdf data",
                            paste("catalog", year, "-sub.txt", sep = ""),
                            package = "williams")

    ## Read in the raw data file

    x <- readLines(filename)

    ## Handle the difference in the data between 2010 and all other
    ## years for isolating all the professor rows in the data. In 2010
    ## a comma separates the professor names and titles, whereas in
    ## all other years a double-space is used.

    if(year == 2010){
        prof <- x[regexpr("\\,", x) != -1 & regexpr("\\(\\d", x) == -1]
    } else{
        prof <- x[regexpr("\\w  ", x) !=-1 & regexpr("\\(\\d", x) == -1]
    }

    ## Create empty vectors to assign to the degree information. The
    ## size of the vectors should match the number of professors.

    z <- numeric(length(prof))
    deglines <- character(length(prof))
    dl <- character(length(prof))

    ## Isolate the degree rows in the data by finding the line after a
    ## professor row

    for(i in 1:length(prof)){
        z[i] <- which(x == prof[i])

        dl[i] <- x[(z[i] + 1)]

        degs <- c("B.M.", "B.A.", "B.S.")

        deglines[i] <- if(regexpr("\\(\\d", dl[i]) == -1 &
                          regexpr("\\w  ", dl[i]) == -1 &
                          !(substr(dl[i], 1, 4) %in% degs)){
            x[(z[i] + 2)]
        } else{
            dl[i]
        }

        ## Convert a comma seperator to a semi-colon in one line of
        ## data to make it consistent. Semi-colons are used in the
        ## degree lines to distinguish between the person's
        ## undergraduate and graduate degrees

        if(i == 195 & year == 2010){
            deglines[i] <- gsub("\\,", ";", deglines[i])
        }

        ## Insert NAs for degree lines that do not contain any degree
        ## information. These are identified by missing a parentheses
        ## and the line not starting with one of the degrees in the
        ## list degs.

        if(regexpr("\\(\\d", deglines[i]) == -1 &
           !(substr(deglines[i], 1, 4) %in% degs)){
            deglines[i] <- NA
        }
    }

    ## A dataframe is returned containing two variables - prof and
    ## deglines. Prof Contains all lines of data with professor names
    ## and titles, whereas deglines includes all lines of data with
    ## degree information.

    return(data.frame(prof, deglines))
 }

