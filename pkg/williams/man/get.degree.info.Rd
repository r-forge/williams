\name{get.degree.info}
\alias{get.degree.info}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
get.degree.info(degreelines)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{degreelines}{
%%     ~~Describe \code{degreelines} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
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
                          regexpr("\\w", x)) \%in\% grad,
                   NA, sapply(strsplit(x, ";"), '[', 1))

    deg2 <- ifelse(substr(x, regexpr("\\w", x),
                          regexpr("\\w", x)) \%in\% grad,
                   sapply(strsplit(x, ";"), '[', 1),
                   sapply(strsplit(x, ";"), '[', 2))

    undergrad.year <- as.numeric(substr(deg1,
                                  regexpr("\\(\\d", deg1) + 1,
                                  regexpr("\\(\\d", deg1) + 4))

    grad.year <-      as.numeric(substr(deg2,
                                  regexpr("\\(\\d", deg2) + 1,
                                  regexpr("\\(\\d", deg2) + 4))

    undergrad.degree <- ifelse(regexpr("\\(\\d", deg1) == -1 &
                               substr(deg1, 1, 4) \%in\% degs,
                               substr(deg1, 1, 4),
                               substr(deg1, regexpr("\\w", deg1),
                                      regexpr("\\(\\d", deg1) - 1))

    grad.degree <- substr(deg2, regexpr("\\w", deg2),
                          regexpr("\\(\\d", deg2) - 1)

    undergrad.school <- ifelse(regexpr("\\(\\d", deg1) == -1 &
                               substr(deg1, 1, 4) \%in\% degs,
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
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
