setup.pdf.data <-
function(yrs, j){

    ## The setup.pdfdata function creates vectors from the raw data
    ## that enable subsequent functions to more easily extract the
    ## desired information. Specifically, the lines containing names
    ## and titles are seperated from those with information regarding
    ## professor's degrees. The function has two inputs - yrs and j.

    ## yrs is a vector containing all the years of data which are to
    ## be included in the final dataframe. j is a variable which loops
    ## through each year in yrs.

    ## Read in the raw data file

    year <- paste(substr(yrs[j] - 1, 3, 4), substr(yrs[j], 3, 4), sep = "")

    x <- readLines(paste("catalog", year, "-sub.txt", sep = ""))

    ## Handle the difference in the data between 2010 and all other years
    ## for isolating all the professor rows in the data

    if(yrs[j] == 2010){
        prof <- x[regexpr("\\,", x) != -1 & regexpr("\\(\\d", x) == -1]
    } else{
        prof <- x[regexpr("\\w  ", x) !=-1 & regexpr("\\(\\d", x) == -1]
    }

    prof <- .trim(prof)

    z <- numeric(length(prof))
    deglines <- character(length(prof))

    ## Isolate the degree rows in the data by finding the line after a
    ## professor row

    for(i in 1:length(prof)){
        z[i] <- which(x == prof[i])
        deglines[i] <- x[(z[i] + 1)]

        ## Convert a comma seperator to a semi-colon in one line of
        ## data to make it consistent. Semi-colons are used in the
        ## degree lines to distinguish between the person's
        ## undergraduate and graduate degrees

        if(i == 195 & yrs[j] == 2010){
            deglines[i] <- gsub("\\,", ";", deglines[i])
        }

        ## Insert NAs for degree lines that do not contain any degree
        ## information. These are identified by missing a parentheses
        ## and the line not starting with one of the degrees in the
        ## list degs.

        degs <- c("B.M.", "B.A.", "B.S.")

        if(regexpr("\\(\\d", deglines[i]) == -1 &
           !(substr(deglines[i], 1, 4) %in% degs)){
               NA
           }
    }

    ## Isolate the professor's name from his title by using a comma
    ## seperator in 2010 and two spaces in all other years

    if(yrs[j] == 2010){
        professor <- substr(prof, regexpr("\\w", prof),
                            regexpr("\\,", prof) - 1)
    } else{
        professor <- substr(prof, regexpr("\\w", prof),
                            regexpr("\\  ", prof) - 1)
    }

    professor <- .trim(professor)

    return(list(prof = prof,
                    deglines = deglines, professor = professor))
 }

