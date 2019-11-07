#' Download L2A Sentinel data
#' @description Query and download Sentinel-2 data from the Copernicus hub
#'
#' @param username Copernicus username
#' @param password Copernicus password
#' @param area study area as a path geojson
#' @param date1 start search date YYYYMMDD
#' @param date2 end search date YYYYMMDD
#' @param outpath directory for the imagery
#'
#' @return
#'
#' @import reticulate
#' @import rlist
#'
#' @author Marvin Ludwig
#'
#' @export

#

sentinel.download <- function(username, password, area, date1, date2, outpath){

  sentinelsat = reticulate::import("sentinelsat")

  api = sentinelsat$SentinelAPI(username, password, "https://scihub.copernicus.eu/dhus")
  footprint = sentinelsat$geojson_to_wkt(sentinelsat$read_geojson(area))



  product = api$query(area = footprint, date = c(date1, date2),
                      producttype = "S2MSI2A")

  if(length(product) < 1){
    return("No products found")
  }


  # cloud percentage filter
  prod <- list()
  for(i in seq(length(product))){

    if(product[[i]]$cloudcoverpercentage < 20){
      prod <- rlist::list.append(prod, product[[i]])
    }
  }

  if(length(prod) < 1){
    return("No products found")

  }else{
    cat(paste0("Downloading ", length(prod), " Sentinel-2 scenes"))
    # download
    for(k in prod){
      api$download(k$uuid, outpath)
    }

  }

}
