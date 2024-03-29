get.faculty <- function(output = FALSE){

    ## The purpose of the get.faculty function is to
    ## read in Williams College faculty data for academic years 1965,
    ## 1975, 1985, 1995, and 1998-2010.
    ##
    ## The data was obtained in three different formats. From
    ## 2001-2010, the original data was downloaded as a pdf and
    ## converted into a txt file. From 1998-2000, the data was
    ## extracted from the HTML code and also converted to a txt
    ## file. For 1965, 1975, 1985 and 1995, the data was manually
    ## enetered from hard copies of course catalogs.
    ##
    ## The content and structure between the three formats differs
    ## significantly, and therefore the different functions are
    ## required for each. The get.faculty.data function calls all
    ## other functions in the williams package to generate a dataset
    ## containing all Williams College faculty data for academic years
    ## 1965, 1975, 1985, 1995, and 1998-2010.

    ## get.pdf.data reads in Williams College faculty data from .txt
    ## files that were generated from pdf files downloaded for
    ## academic years 2001-2010.

    ## Note that there are currently 31 warnings when running
    ## get.pdf.data. They are mostly recurring, but should be
    ## researched an fixed.

    pdf.data <- get.pdf.data()

    ## get.html.data reads in Williams College faculty data from .txt
    ## files that were generated from html files downloaded for
    ## academic years 1998-2000.

    ## Note that the html data includes many more faculty members than
    ## in the pdf and manual data. This could be due to more types of
    ## faculty being included in the data, or duplicates across
    ## departments or other reasons. This should be researched and
    ## fixed in the future such that it is consistent across sources.

    html.data <- get.html.data()

    ## get.manual.data reads in Williams College faculty data from a
    ## csv file that were generated by manually entering data from
    ## hard copies of Williams College course catalogs for academic
    ## years 1965, 1975, 1985, and 1995.

    manual.data <- get.manual.data()

    ## combine.all.data appends the Williams College faculty
    ## dataframes generated by all three original sources of data -
    ## pdf, html, and manual data. combine.all.data returns a
    ## dataframe containing faculty data across all available academic
    ## years - 1965, 1975, 1985, 1995, and 1998-2010.

    faculty <- combine.all.data(pdf.data, html.data, manual.data)

    if(output == TRUE){

    ## Save the final dataframe to an RData file so it can be loaded
    ## by the user. "Data" in RData must be capitalized for the
    ## dataset to load in R.

    save(faculty, file = "faculty.RData")

    ## Create a csv so that the data can be easily viewed by the user

    write.csv(faculty, file = "faculty.csv")
}

    return(faculty)
}
