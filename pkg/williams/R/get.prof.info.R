get.prof.info <- function(x, yr){

    ## The get.name function extracts professor's first, middle and
    ## last names from the 2001-2010 faculty data. It has two inputs -
    ## s and i.

        ## s is a vector consisting of every line of the faculty data
        ## containing the professor's name information. Furthermore,
        ## the name has been isolated from the title which also
        ## appears on the same line. The i variable indicates which
        ## part of the name we are to extract, where a value of i=1
        ## indicates the last name, i=2 the middle name, and i=3 the
        ## first name.

    x <- x$prof

    if(yr == 2010){
        professor <- substr(x, regexpr("\\w", x),
                            regexpr("\\,", x) - 1)
    } else{
        professor <- substr(x, regexpr("\\w", x),
                            regexpr("\\  ", x) - 1)
    }

    professor <- .trim(professor)

    return(data.frame(professor))

}
