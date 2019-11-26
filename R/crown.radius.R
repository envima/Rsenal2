#' Calculate Tree Crown Radius
#' @description Distance from stem position to farthest crown polygon vertex
#'
#' @param crowns, tree crown geometries
#' @param stems, stem positions
#'
#' @return vector with radi
#'
#' @import sf
#'
#' @details If no stems are provided, the polygon centroids are used as stem positions
#'
#' @author Marvin Ludwig
#'
#' @export

#



crown.radius <- function(crowns, stems = NULL){

  crowns <- st_as_sf(crowns)

  # calculate stems as centroids if not specified
  if(is.null(stems)){
    stems <- st_centroid(crowns)
  }
  crowns <- st_cast(crowns, "POINT")


  # calculate radius for each pair of crown and stem
  crown_radius <- c()
  for(i in seq(nrow(stems))){
    crown_radius <- append(crown_radius, max(st_distance(stems[i,], crowns[crowns$treeID == stems$treeID[i],])))
  }
  return(crown_radius)
}
