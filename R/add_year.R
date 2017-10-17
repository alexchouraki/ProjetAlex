
#' add_year
#'
#' @param dataframe the dataframe lacking a year column
#' @param yearofdata the year the user wants to add
#'
#' @return the dataframe with the year as its first column
#' @import tidyverse
#' @export
#' @example
#' add_year(data2015, 2015)


add_year <- function(dataframe, yearofdata){
  newdataframe <-  mutate(dataframe, year = yearofdata)

  result <-  select(newdataframe, c(length(newdataframe), 1:(length(newdataframe)-1)))

  return(result)
}
