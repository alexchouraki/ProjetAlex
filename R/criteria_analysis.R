#' criteria_analysis
#'
#' @param criteria the criteria we want to focus on, which should be among the columns of the Happiness dataset
#' @param top the number of countries we want to list
#' @param focusyear the year we want to focus on
#' @return the top countries for one given criteria
#' @import tidyverse
#' @export
#'
#' @example
#' criteria_analysis(Freedom, 10, 2016)
criteria_analysis <- function(criteria, top, focusyear){
    res <- data_Happiness %>%
           filter(year == focusyear) %>%
           select(Country, criteria) %>%
           distinct() %>%
           top_n(top, criteria)
    return(res)
}
