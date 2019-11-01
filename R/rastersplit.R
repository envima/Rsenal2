#' Raster Class Splitter
#' @description Takes a raster with categorial values and splits it into binary layers
#'
#' @param x raster
#'
#' @return raster stack with one layer per class
#'
#' @author Marvin Ludwig
#'
#' @import raster
#'
#' @export

#




raster.split <- function(x){

  classes <- x@data@attributes[[1]]

  clsplit <- lapply(seq(nrow(classes)), function(i){

    return(mask(x, x == i, maskvalue = 0))

  })
  clsplit <- stack(clsplit)
  names(clsplit) <- classes$value
  return(clsplit)

}


