get.faculty.data <- function(){

    pdf.data <- get.pdf.data()

    html.data <- get.html.data()

    manual.data <- get.manual.data()

    faculty.data <- combine.all.data(pdf.data, html.data, manual.data)

    save(faculty.data, file = "faculty.data.Rdata")

    write.csv(faculty.data, file = "facultydata.csv")

    return(faculty.data)
}
