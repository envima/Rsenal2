#' Calculate tree hulls with crown attributes
#' @description height related attributes
#'
#' @param tree_pc, classified tree
#' @param stems, stem positions for crown radius (optional)
#'
#' @return
#'
#' @import lidR
#' @import spatialEco
#'
#' @author Marvin Ludwig
#'
#' @export

#

tree.attributes <- function(tree_pc, stems = NULL){
  # standard lidR + conversion to geometries
  th <- lidR::tree_hulls(tree_pc, "convex", func = .stdmetrics_z)
  # perimeter of crowns
  th@data$perimeter <- spatialEco::polyPerimeter(th)
  if(!is.null(stems)){
    th@data$radius <- crown.radius(crowns = th, stems)
  }
  th <- th[order(th$treeID),]
  return(th)
}
