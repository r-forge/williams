get.prof.info <-
function(professor){

    ## The get.name function extracts professor's first, middle and
    ## last names from the 2001-2010 faculty data. It has two inputs -
    ## s and i.

        ## s is a vector consisting of every line of the faculty data
        ## containing the professor's name information. Furthermore,
        ## the name has been isolated from the title which also
        ## appears on the same line. The i variable indicates which
        ## part of the name we are to extract, where a value of i=1
        ## indicates the last name, i=2 the middle name, and i=3 the
        ## first name.

    x <- professor

    x <- rawdata[["professor"]]

    ## Create a prefix and suffix vector to identify elements that
    ## need to be combined with another element of the name. The lists
    ## of elements were identified manually by reviewing the data.

    pref <- c("van", "Van", "de", "De", "di", "Di")
    suf <- c("II", "III", "IV", "V", "VI")

    spl <- strsplit(x, " ")

    first.name <- .trim(sapply(spl, '[',1))


    len <- sapply(spl, length)
    suf.count <- sapply(spl, '%in%', suf)
    suf.count2 <- sapply(suf.count, '[', suf.count == TRUE)


    middle.name <- .trim(ifelse(length(spl) -
                                length(spl[spl %in% suf]) -
                                length(spl[spl %in% pref]) > 2,
                                t(sapply(spl, '[',
                                         2:(length(spl) -
                                            length(spl[spl %in% suf]) -
                                            length(spl[spl %in% pref]) -
                                            2))),
                                         NA))

    ## Create a vector whose elements consist of every seperate
        ## string of characters in the professors name. For example,
        ## if the professor's name is Richard D. De Veaux, the new
        ## vector "spl" will contain four elements.

        spl <- unlist(strsplit(s, " "))


        ## If the name contains a suffix, we combine the last name
        ## with the suffix to create only one element containing both

        if(length(spl[spl %in% suf] != 0)){
            spl[length(spl) - 1] <- paste(spl[length(spl) - 1],
                                          spl[length(spl)], sep = " ")
            spl <- spl[1:(length(spl) - 1)]
        }

        ## Determine whether or not a middle name exists by counting
        ## the number of elements in the name, and accounting for any
        ## prefixes

        if(i == 2 & (length(spl) - length(spl[spl %in% pref])) < 3){
            "NA"
        } else{

            ## Extract the first name

            if(i == 3){
                tail(spl, n=length(spl))[1]
            } else{

                ## Extract all middle names in the event of no prefixes

                if(i == 2 & length(spl) > 3 &
                   length(spl[spl %in% pref]) == 0){
                    q <- tail(spl, n= length(spl) - 1)[1:(length(spl) - 2)]
                    paste(q[1:length(q)], collapse = " ")
                } else{

                    ## Extract all middle names in the case where
                    ## prefixes do exist, by extracting all elements
                    ## from after the first name through the first
                    ## prefix element

                    if(i == 2 & length(spl) > 3 &
                       length(spl[spl %in% pref])!= 0){
                        q <- tail(spl, n=length(spl) - 1)[1:(min(which(spl %in% pref)) - 2)]
                        paste(q[1:length(q)], collapse = " ")
                    } else{

                        ## Extract the last name including the prefixes

                        if(i == 1 & length(spl[spl %in% pref])!= 0){
                            q <- tail(spl, n = (length(spl) -
                                                min(which(spl %in% pref))
                                                + 1))
                            paste(q[1:length(q)], collapse = " ")
                        } else{

                            ## Extract the name established by i, in any
                            ## other situation

                            tail(spl, n = i)[1]
                        }
                    }
                }
            }
        }
    }

