\name{get.prg}
\alias{get.prg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
get.prg(pos)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pos}{
%%     ~~Describe \code{pos} here~~
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
function(pos){

## The purpose of the get.prg function is to extract the department
## names from the faculty data originally formatted in HTML. This
## encompasses academic years 1998 through 2000. It has only one input
## - pos

## pos is a previously created character vector which consists of
## extracts from the raw faculty data, where a "(Div" string
## exists. This string identifies all lines in which a department name
## exists


    ## One department name is too long and thus the division
    ## information appears on the next line

    prg.embed <- function(pos){

        if(.trim(x[pos]) == "(Div. II)"){
            .trim(substr(x[pos - 1], 1, regexpr("<", x[pos - 1]) - 1))
        } else{
            .trim(substr(x[pos], 1, regexpr("\\(", x[pos]) - 1))
        }
    }

    return(sapply(pos, FUN = prg.embed))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
