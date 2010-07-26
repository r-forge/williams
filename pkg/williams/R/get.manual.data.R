get.manual.data <- function(){

    filename <- system.file("faculty",
                       "manual data",
                       "Hard Copy Course Catalogs.csv",
                       package = "williams")

    x <- read.csv(filename)

    return(x)
}
