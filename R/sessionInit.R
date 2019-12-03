#' Initialize R Session
#' @description Loads packages
#'
#'
#' @return
#'
#' @author Marvin Ludwig
#'
#' @export
#'


sessionInit <- function(){
  lapply(c(
    "sf", "raster", "RStoolbox",
    "stringr", "mapview", "rlist",
    "plyr", "reshape2",
    "lidR", "ggplot2", "viridis"
  ), library, character.only = TRUE)


  cat("Everything ready")
}



