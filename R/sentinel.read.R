#' Read Sentinel
#' @description reads Sentinel Stack from .SAFE
#'
#' @param pathL2A filepath to L2A Sentinel data
#'
#' @return raster stack
#'
#' @author Marvin Ludwig
#'
#' @export
#'

sentinel.read <- function(pathL2A){


senFilename <- function(pathL2A){
  n <- paste0(
    "S2_",
    substr(pathL2A, regexpr("MSIL2A_", pathL2A) + 7, regexpr("MSIL2A_", pathL2A) + 14),
    "_mof.grd"
  )
}


searchPattern <- "(B02|B03|B04|B08)_10m.jp2$"
ten_bands <- list.files(paste0(pathL2A, "/GRANULE/"), pattern = searchPattern, full.names = TRUE, recursive = TRUE)


l2a10 <- stack(ten_bands)





names(l2a10) <- c("B02", "B03", "B04", "B08")


return(l2a10)
}
