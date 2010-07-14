get.degree.info <-
function(degreelines){

        ## The get.year function extracts the years during which
        ## undergraduate and graduate degrees were earned years from
        ## the 2001-2010 faculty data. It has two inputs - dl and i.

        ## dl is a vector consisting of every line of the faculty data
        ## containing the degree information. The i variable indicates
        ## whether it is the undergraduate or graduate degree to be
        ## extracted, where a value of i=1 indicates the former, and
        ## i=2 the latter.


        ## Degree years can be located by their digit format within
        ## parentheses


    x <- degreelines

    ## The following first letters indicate that the degree is a
    ## graduate degree. It is necessary to establish because some
    ## professors do not have an undergraduate degree listed

    grad <- c("M", "P", "D")

    ## Typically a degree would be extracted based on its position
    ## relative to the degree year. Some degrees do not have a
    ## corresponding specified year, so we identify those exceptions
    ## using the following vector

    degs <- c("B.M.", "B.A.", "B.S.")

    deg1 <- ifelse(substr(x, regexpr("\\w", x),
                          regexpr("\\w", x)) %in% grad,
                   NA, sapply(strsplit(x, ";"), '[', 1))

    deg2 <- ifelse(substr(x, regexpr("\\w", x),
                          regexpr("\\w", x)) %in% grad,
                   sapply(strsplit(x, ";"), '[', 1),
                   sapply(strsplit(x, ";"), '[', 2))

    undergrad.year <- as.numeric(substr(deg1,
                                  regexpr("\\(\\d", deg1) + 1,
                                  regexpr("\\(\\d", deg1) + 4))

    grad.year <-      as.numeric(substr(deg2,
                                  regexpr("\\(\\d", deg2) + 1,
                                  regexpr("\\(\\d", deg2) + 4))

    undergrad.degree <- ifelse(regexpr("\\(\\d", deg1) == -1 &
                               substr(deg1, 1, 4) %in% degs,
                               substr(deg1, 1, 4),
                               substr(deg1, regexpr("\\w", deg1),
                                      regexpr("\\(\\d", deg1) - 1))

    grad.degree <- substr(deg2, regexpr("\\w", deg2),
                          regexpr("\\(\\d", deg2) - 1)

    undergrad.school <- ifelse(regexpr("\\(\\d", deg1) == -1 &
                               substr(deg1, 1, 4) %in% degs,
                               substr(deg1, 6, nchar(deg1)),
                               substr(deg1, regexpr("\\)", deg1) + 1,
                                      nchar(deg1)))

    grad.school <- substr(deg2, regexpr("\\)", deg2) + 1,
                          nchar(deg2))


    return(data.frame(undergrad.degree,
                      undergrad.school,
                      undergrad.year,
                      grad.degree,
                      grad.school,
                      grad.year))
}

