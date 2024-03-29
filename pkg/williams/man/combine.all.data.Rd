\name{combine.all.data}
\alias{combine.all.data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Appends all of the Williams College Faculty Dataframes
}
\description{
combine.all.data appends the Williams College faculty dataframes
generated by all three original sources of data - pdf, html, and manual
data. Since the dataframes do not contain the exactly the same data, new
columns with missing values are first added to the dataframes such that
an rbind can be executed. combine.all.data returns a dataframe
containing faculty data across all available academic years - 1965,
1975, 1985, 1995, and 1998-2010.
}
\usage{
combine.all.data(pdf.data, html.data, manual.data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pdf.data}{
    Dataframe containing data extracted from course catalogs
    downloaded as pdf files
  }
  \item{html.data}{
    Dataframe containing data extracted from course catalogs
    downloaded as html files
  }
  \item{manual.data}{
    Dataframe containing data extracted from course catalogs
    that were manually entered
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
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
