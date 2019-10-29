#' Crown Shapes
#' @description Adds crown geometry to tree
#'
#' @param tree sf point tree
#' @param distance vector with measured distances
#' @param angle vector with measured angles
#' @param crs epsg code
#'
#' @return tree with crown shape poylgon
#'
#' @author Marvin Ludwig
#'
#' @export

#


crownShape <- function(tree, distance, angle, crs = 25832){


  # tree coordinates
  tree_coords <- st_coordinates(tree)


  # corner formating
  corners <- data.frame(distance = distance,
                        angle = angle,
                        bearing = (abs((angle + 180) %% 360))*(pi/180))

  # calculate polygon corners
  p <- matrix(c(corners$distance*sin(corners$bearing) + tree_coords[,1],
                corners$distance*cos(corners$bearing) + tree_coords[,2]),
              ncol = 2)
  p <- rbind(p, p[1,])


  p <- st_sfc(st_polygon(list(p)), crs = crs)
  st_geometry(tree) <- p
  return(tree)

}
