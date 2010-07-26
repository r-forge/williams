\name{get.info.html}
\alias{get.info.html}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Extract profesor information from HTML data
}
\description{
get.info.html extracts professor names and titles from Williams
College faculty data originally in html format. The function then
assigns the department information to each professor and returns a
dataframe containing professor names, their title and the department.
}
\usage{
get.info.html(x, department, current.year)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
x is a character vector containing each line of the txt file sourced
from one year of html data currently running in the loop.
}
  \item{department}{
department is a dataframe with a listing of all the departments for the
given academic year running through the loop.
}
  \item{current.year}{
current.year is the academic year of faculty data currently running
through the data extraction loop. current.year must be numeric and
expressed as a four-digit year
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
Andrew Leeser
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
get.info.html(x, department, current.year)
## To run the function on the current year in the loop

get.info.html(x, department, 2000)
## To run the function on the academic year 2000
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
