\name{get.degree.info}
\alias{get.degree.info}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Extract professor education information from pdf faculty data
}
\description{
get.degree.info extracts education information from Williams
College faculty data originally in pdf format. The output is a dataframe
containing undergraduate degree, year and institution as well as
graduate degree, year and institution.
}
\usage{
get.degree.info(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
x is a dataframe created by the setup.pdf.data function which includes
all professor and education lines of data for a given year
}
}
\details{
get.degree.info uses only the education information in x.
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
get.degree.info(x)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
