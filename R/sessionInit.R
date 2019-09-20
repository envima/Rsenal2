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
    "sf", "raster", "plyr", "RStoolbox", "glcm", "stringr", "mapview", "rlist", "caret", "ranger", "plyr", "reshape2"
  ), library, character.only = TRUE)


  cat("Everything ready")
}



