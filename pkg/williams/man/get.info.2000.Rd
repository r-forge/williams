\name{get.info.2000}
\alias{get.info.2000}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
get.info.2000(x, y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
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
function(x, y){

    ## The function get.info.2000 extracts the professor names and
    ## titles for each department and also assigns the department
    ## information to each professor. The function has two inputs - x and y

    ## x is the entire raw data read in from the txt file. y is a
    ## vector containing information regarding the line postion of
    ## each department within x.

    allprofs <- character()
    alltitles <- character()
    alldepts <- character()

    for(i in 1:length(y)){

        ## The professor information can be found somewhere in the first
        ## 20 lines of each department

        z <- x[y[i]:(y[i] + 20)]

        ## The faculty names are formatted in italics, so they can be
        ## extracted by locating the HTML indicators <I> and </I>

        if(length(grep("<I>", z)) != 0){
            start <- max(grep("<I>", z))
            end <- max(grep("</I>", z))
            q <- z[start:end]

            ## Because the line breaks are inconsistent, the following
            ## code converts the entire subset of the data into one
            ## element in a vector

            r <- paste(q[1:length(q)], collapse = " ")

            ## Each different position/title within the department is
            ## seperated by a colon. Therefore, we can split each
            ## position grouping of professors by the colons.

            a <- unlist(strsplit(r, ":"))

            ## Each grouping now consists of a list of professors and
            ## a title. In order to seperate the two, we can use a "."
            ## to identify the end of a list of professors and the
            ## title. However, some professor names consist of a first
            ## initial followed by a period, hence we first need to
            ## eliminate the periods after initials

            b <- gsub(" (\\w)\\.", " \\1", a)
            c <- gsub("^(\\w)\\.", " \\1", b)

            ## Some names also contain symbols that in HTML are
            ## recognized as a weird string of characters. As such, we
            ## remove all extraneous characters.

            d <- gsub("\\*", "", c)
            d <- gsub("&#167;", "", d)

            ## Now, we split the listing of professors from the titles
            ## using the period seperator descibed above.

            e <- unlist(strsplit(d, "\\."))

            ## Within each list of professors, each individual
            ## professor is seperated by a comma. The comma is used to
            ## create an individual element for each professor

            full <- unlist(strsplit(e, ","))
            full <- full[-length(full)]

            ## The positions of the titles are determined by locating
            ## the elements that contain lower case letters, as the
            ## professor names are in all upper case.

            titlepos <- grep("[:lower:]", full)
            titles <- full[titlepos]

            ## All elements that aren't a title are a professor

            profs <- full[-titlepos]

            ## To assign a title to each professor, the position of
            ## the professor within the list is determined, and the
            ## title directly preceding that position is assigned

            title <- character(length(profs))

            for(k in 1:length(profs)){
                f <- max(which(full == profs[k]))
                title[k] <- titles[max(which(titlepos < f))]
            }

            ## The department name is assigned to each professor

            dept <- rep(prg[i], times = length(profs))

            ## The professor, title and department information for the
            ## current department faculty is appended to a cumulative
            ## vector for all departments

            allprofs <- .trim(c(allprofs, profs))
            alltitles <- .trim(gsub("<I>", "", c(alltitles, title)))
            alldepts <- c(alldepts, dept)
        }
    }

    return(list(allprofs = allprofs,
                alltitles = alltitles,
                alldepts = alldepts))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
