get.department <- function(x){

    ## The purpose of the get.prg function is to extract the
    ## department names from the faculty data originally formatted in
    ## HTML. This encompasses academic years 1998 through 2000. It has
    ## only one input - pos

    ## pos is a previously created character vector which consists of
    ## extracts from the raw faculty data, where a "(Div" string
    ## exists. This string identifies all lines in which a department
    ## name exists

    y <- grep("\\(Div.", x)

    ## One department name is too long and thus the division
    ## information appears on the next line

    z <- which(.trim(x[y]) == "(Div. II)")

    y[z] <- y[z] - 1

    x[y[z]] <- sub("<", " \\(", x[y[z]])

    department <- .trim(substr(x[y], 1, regexpr("\\(", x[y]) - 1))

    return(data.frame(department))
}


