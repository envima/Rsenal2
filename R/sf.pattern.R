#' Simple feature to spatstat pointpattern
#' @description Converts simple feature points to a spatial point pattern
#'
#' @param p sf points
#' @param window sf polygon: the observation window (e.g. study area)
#' @param mark character vector, marks for each point (optional)
#'
#' @return a spatial point pattern
#'
#' @author Marvin Ludwig
#'
#' @import spatstat
#' @import sf
#'
#' @export

#



sf.pattern <- function(p, window, mark = NULL){

  # create the observation window
  wcoord <- as.data.frame(sf::st_coordinates(window))

  w <- spatstat::owin(xrange = c(min(wcoord$X), max(wcoord$X)),
                      yrange = c(min(wcoord$Y), max(wcoord$Y)))

  # create the point pattern

  pcoord <- as.data.frame(st_coordinates(p))


  pp <- spatstat::ppp(pcoord$X, pcoord$Y, window = w, marks = mark)
  return(pp)



}
