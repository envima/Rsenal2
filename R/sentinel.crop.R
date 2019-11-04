#' Crop Sentinel
#' @description Crops Sentinal data to mof extent
#'
#' @param pathL2A filepath to L2A Sentinel data
#' @param cropExtent sf / sp crop extent
#' @param outpath filepath for the cropped scene
#'
#' @return
#'
#' @import raster
#' @import sf
#'
#' @author Marvin Ludwig
#'
#' @export


sentinel.crop <- function(pathL2A, cropExtent, outpath){

    senFilename <- function(pathL2A){
    n <- paste0(
      "S2_",
      substr(pathL2A, regexpr("MSIL2A_", pathL2A) + 7, regexpr("MSIL2A_", pathL2A) + 14),
      "_mof.grd"
    )
  }


  searchPattern <- "(B02|B03|B04|B08)_10m.jp2$"
  ten_bands <- list.files(paste0(pathL2A, "/GRANULE/"), pattern = searchPattern, full.names = TRUE, recursive = TRUE)

  searchPattern <- "(B05|B06|B07|B8A|B11|B12)_20m.jp2$"
  twenty_bands <- list.files(paste0(pathL2A, "/GRANULE/"), pattern = searchPattern, full.names = TRUE, recursive = TRUE)

  searchPattern <- "(B01|B09)_60m.jp2$"
  sixty_bands <- list.files(paste0(pathL2A, "/GRANULE/"), pattern = searchPattern, full.names = TRUE, recursive = TRUE)


  l2a10 <- stack(ten_bands)


  cropExtent <- st_transform(cropExtent, crs = projection(l2a10))

  l2a10 <- crop(l2a10, cropExtent)

  l2a20 <- stack(twenty_bands)
  l2a20 <- crop(l2a20, cropExtent)

  l2a60 <- stack(sixty_bands)
  l2a60 <- crop(l2a60, cropExtent)

  # resample lower resoltion bands
  l2a20 <- resample(l2a20, l2a10[[1]])
  l2a60 <- resample(l2a60, l2a10[[1]])

  # combine all bands
  l2a <- stack(l2a10, l2a20, l2a60)

  names(l2a) <- c("B02", "B03", "B04", "B08", "B05", "B06", "B07", "B8A", "B11", "B12", "B01", "B09")

  writeRaster(l2a, filename = paste0(outpath, "/", senFilename(pathL2A)), overwrite = TRUE)



}









