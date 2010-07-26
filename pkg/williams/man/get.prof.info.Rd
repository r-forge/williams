\name{get.prof.info}
\alias{get.prof.info}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Extract professor names and positions from pdf faculty data
}
\description{
get.prof.info extracts professor names and positions from Williams
College faculty data originally in pdf format. The output is a dataframe
containing both pieces of information.
}
\usage{
get.prof.info(x, yr)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
x is a dataframe created by the setup.pdf.data function which includes
all professor and education lines of data for a given year
}
\item{yr}{
yr is the academic year of faculty data currently running through the
data extraction loop. yr must be numeric and expressed as a four-digit year
}
}
\details{
get.prof.info uses only the professor data from x. It then separates the
professor name information from the position information and creates a
variable for each. There is a minor discrepancy in the structure of the
data from 2010 than in all other years.
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
%% ~~objects to See Also as \code{\link{help}}, ~~~ } \examples{
get.prof.info(x, current.year)
## Where current.year is the year variable being generated within the
loop

get.prof.info(x, 2010)
## To run the function for only academic year 2010
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
