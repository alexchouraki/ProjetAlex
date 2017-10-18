#' Country analysis
#'
#' @param country the country you want to analyze
#'
#' @return the graph with the evolution of the main indicators
#' @import dygraphs
#' @import tidyverse
#' @export
#'
#' @example
#' country_analysis("France)
#'
country_analysis <- function(country){
  data_Happiness %>%
    group_by(Country) %>%
    filter(Country == country) %>%
    select(-Dystopia.Residual, - Happiness.Rank, - Happiness.Score) %>%
    dygraph()

}
