get.prof.info <- function(x, year){

    ## The get.prof.info function extracts professor's name and title
    ## from the 2001-2010 faculty data. It has two inputs - x and year.

    ## x is a dataframe with one variable containing all the professor
    ## name and title lines (prof), and another variable containing
    ## the degree information lines (deglines). We will only use the
    ## prof variable.

    ## year is the current year being run in the loop

    stopifnot("prof" %in% names(x))

    ## Create a variable, x, consisting of only the professor name and
    ## title information

    x <- as.character(x$prof)

    ## In 2010, name and position information is seperated from eachother
    ## by a comma, whereas in all other years a double-space is
    ## used. As a result, to extract each component, we need to use an
    ## if statement. The professor name is extracted by obtaining all
    ## characters from the first letter to the separator described
    ## above, while the position is designated as everything after the
    ## separator.

    if(year == 2010){
        professor <- substr(x, regexpr("\\w", x),
                            regexpr("\\,", x) - 1)

        position <- substr(x, regexpr("\\,", x) + 1, nchar(x))

    } else{
        professor <- substr(x, regexpr("\\w", x),
                            regexpr("\\  ", x) - 1)

        position <- substr(x, regexpr("\\  ", x) + 1, nchar(x))
    }

    ## Remove leading and trailing blanks to clean up the name

    professor <- sub("^ +", "", professor)
    professor <- sub(" +$", "", professor)

    ## The position information extracted above is in the format
    ## "Associate Professor of Biology". The code below establishes
    ## the title as a Professor, Associate Professor, Assistant
    ## Professor, or Other.

    title <- ifelse(regexpr("Associate", position) != -1,
                    "Associate Professor",
                    ifelse(regexpr("Assistant", position) != -1,
                           "Assistant Professor",
                           ifelse(regexpr("Professor", position) != -1,
                                  "Professor",
                                  "Other")))

    ## Return a dataframe with the professor name, position including
    ## area of study and his title.

    return(data.frame(professor, position, title))

}
