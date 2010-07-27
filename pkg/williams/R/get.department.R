get.department <- function(x){

    ## The purpose of the get.department function is to extract the
    ## department names from the faculty data originally structureed as
    ## html. This encompasses academic years 1998 through 2000. It has
    ## only one input - x.

    ## x is a vector consisting of every line read from the raw data

    ## Establish a function trim to easily remove leading and trailing
    ## blanks from character strings

    trim <- function(str){
        str <- sub("^ +", "", str)
        str <- sub(" +$", "", str)
    }

    ## Identify all rows of x where a department name exists by
    ## identifying the division information.

    y <- grep("\\(Div.", x)

    ## For the African and Middle-Eastern Studies department, the
    ## division information appears isolated on the next line due to its
    ## lengthy name. As a result, the line before it must be
    ## extracted.

    z <- which(trim(x[y]) == "(Div. II)")

    y[z] <- y[z] - 1

    ## Artificially insert a parentheses to make the data point
    ## consistent with the rest of the data for easy extraction

    x[y[z]] <- sub("<", " \\(", x[y[z]])

    ## Obtain the department by extracting all characters before the
    ## parenthees

    department <- trim(substr(x[y], 1, regexpr("\\(", x[y]) - 1))

    ## Return a dataframe containing the department listing

    return(data.frame(department))
}


