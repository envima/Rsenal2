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
#' @import sf
#'
#' @author Marvin Ludwig
#'
#' @export
#'
#' @examples
#' # create example tree
#' t = data.frame(id = "tree1", x = 5, y = 5)
#' t = sf::st_as_sf(t, coords = c(2,3))
#'
#' # measurements with angle and distance
#' m = data.frame(a = c(0,90,160,200,270),
#'                d = c(1,2,1,3,2))
#'
#' tc = crownShape(t = t, angle = m$a, distance = m$d)
#' plot(tc)
#'

#


crownShape <- function(tree, distance, angle, crs = 25832){


  # tree coordinates
  tree_coords <- sf::st_coordinates(tree)


  # corner formating
  corners <- data.frame(distance = distance,
                        angle = angle,
                        bearing = (abs((angle + 180) %% 360))*(pi/180))

  # calculate polygon corners
  p <- matrix(c(corners$distance*sin(corners$bearing) + tree_coords[,1],
                corners$distance*cos(corners$bearing) + tree_coords[,2]),
              ncol = 2)
  p <- rbind(p, p[1,])


  p <- sf::st_sfc(sf::st_polygon(list(p)), crs = crs)
  sf::st_geometry(tree) <- p
  return(tree)

}
