get.info.html <- function(x, department, current.year){

    ## The function get.info.2000 extracts the professor names and
    ## titles for each department and also assigns the department
    ## information to each professor. The function has two inputs - x and y

    ## x is the entire raw data read in from the txt file. y is a
    ## vector containing information regarding the line postion of
    ## each department within x.

    y <- grep("\\(Div.", x)

    allprofs <- character()
    alltitles <- character()
    alldepts <- character()

    for(i in 1:length(y)){

        ## The professor information can be found somewhere in the first
        ## 20 lines of each department

        z <- x[y[i]:(y[i] + 20)]

        if(current.year == 2000 & length(grep("<I>", z)) != 0){
        id <- "<I>"
        start <- max(grep("<I>", z))
        end <- max(grep("</I>", z))
        } else{
            id <- "Professor"
            if(current.year == 1999 & length(grep(id, z)) != 0){
                if(i == 31){
                    start <- 6
                    end <- 9
                } else{
                    start=grep(">",z)[3]+1
                    end=grep(">",z)[4]-1
                }
            } else{
                if(current.year == 1998 & length(grep(id, z)) != 0){
                    start=grep("JUSTIFY",z)[1]+1
                    end=grep("JUSTIFY",z)[2]-1
                }
            }
        }

        ## The faculty names are formatted in italics, so they can be
        ## extracted by locating the HTML indicators <I> and </I>

        if(length(grep(id, z)) != 0){
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

            titles <- ifelse(substr(titles,
                                   nchar(titles), nchar(titles)) == "s",
                            substr(titles, 1, nchar(titles) - 1), titles)

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

            dept <- rep(as.character(department[i,]), times = length(profs))

            ## The professor, title and department information for the
            ## current department faculty is appended to a cumulative
            ## vector for all departments

            allprofs <- .trim(c(allprofs, profs))
            alltitles <- .trim(gsub("<I>", "", c(alltitles, title)))
            alldepts <- c(alldepts, dept)
        }
    }

    return(data.frame("professor" = allprofs,
                "title" = alltitles,
                "department" = alldepts))
}
