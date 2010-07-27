get.degree.info <- function(x){

    ## get.degree.info extracts the professor's undergraduate and
    ## graduate degree information from the data. This includes the
    ## degree name, year in which it was obtained, and the institution
    ## from which it was received. It has one input - x.

    ## x is a dataframe with one variable containing all the professor
    ## name and title lines (prof), and another variable containing
    ## the degree information lines (deglines). We will only use the
    ## deglines variable.

    stopifnot("deglines" %in% names(x))

    ## Create a variable, x, consisting of only the degree information

    x <- as.character(x$deglines)

    ## The following first letters indicate that the degree is a
    ## graduate degree. It is necessary to establish because some
    ## professors do not have an undergraduate degree listed

    grad <- c("M", "P", "D")

    ## Typically a degree would be extracted based on its position
    ## relative to the degree year. Some degrees do not have a
    ## corresponding specified year, so we identify those exceptions
    ## using the following vector.

    ## This is the second time in the code where we create this vector
    ## (setup.pdf.data is the first), so there is probably room for
    ## improving the efficiency.

    degs <- c("B.M.", "B.A.", "B.S.")

    ## Create deg1 vector which contains all undergraduate degree
    ## information by extracting all characters before the
    ## semi-colon. The exception is if the first listed degree is a
    ## graduate degree as identified by the grad vector.

    deg1 <- ifelse(substr(x, regexpr("\\w", x),
                          regexpr("\\w", x)) %in% grad,
                   NA, sapply(strsplit(x, ";"), '[', 1))

    ## Create deg1 vector which contains all graduate degree
    ## information. This is typically created by extracting all
    ## characters after the semi-colon, unless the first degree is
    ## identified by the grad vector.

    deg2 <- ifelse(substr(x, regexpr("\\w", x),
                          regexpr("\\w", x)) %in% grad,
                   sapply(strsplit(x, ";"), '[', 1),
                   sapply(strsplit(x, ";"), '[', 2))

    ## Extract the year from deg1 by obtaining 4 digits following the
    ## parentheses

    undergrad.year <- as.numeric(substr(deg1,
                                  regexpr("\\(\\d", deg1) + 1,
                                  regexpr("\\(\\d", deg1) + 4))

    ## Extract the year from deg2 by obtaining 4 digits following the
    ## parentheses

    grad.year <-      as.numeric(substr(deg2,
                                  regexpr("\\(\\d", deg2) + 1,
                                  regexpr("\\(\\d", deg2) + 4))

    ## Obtain the undergraduate degree name by extracting all
    ## characters before the paraentheses in deg1. In some occasions,
    ## no year in parentheses exists and the degree is obtained by
    ## identifying it in the vector degs.

    undergrad.degree <- ifelse(regexpr("\\(\\d", deg1) == -1 &
                               substr(deg1, 1, 4) %in% degs,
                               substr(deg1, 1, 4),
                               substr(deg1, regexpr("\\w", deg1),
                                      regexpr("\\(\\d", deg1) - 1))

    ## Obtain the graduate degree name by extracting all characters
    ## before the paraentheses in deg2.

    grad.degree <- substr(deg2, regexpr("\\w", deg2),
                          regexpr("\\(\\d", deg2) - 1)

    ## Obtain the undergraduate institution by extracting all
    ## characters after the parentheses in deg1. In some occasions, no
    ## year in parentheses exists and the institution is obtained by
    ## identifying the degree in the vector degs and extracting all
    ## characters following the degree.

    undergrad.school <- ifelse(regexpr("\\(\\d", deg1) == -1 &
                               substr(deg1, 1, 4) %in% degs,
                               substr(deg1, 6, nchar(deg1)),
                               substr(deg1, regexpr("\\)", deg1) + 1,
                                      nchar(deg1)))

    ## Obtain the graduate institution by extracting all characters
    ## after the parentheses in deg2.

    grad.school <- substr(deg2, regexpr("\\)", deg2) + 1,
                          nchar(deg2))

    ## Create a dataframe consisting of the data extracted above

    return(data.frame(undergrad.degree,
                      undergrad.school,
                      undergrad.year,
                      grad.degree,
                      grad.school,
                      grad.year))
}

