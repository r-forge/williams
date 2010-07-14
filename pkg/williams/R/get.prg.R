get.prg <-
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

