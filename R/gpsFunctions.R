#' Rename GPS export colnames
#'
#' @details Renames a GNSSESSENTIAL export from XPAD
#'
#' @param gpsExport data.frame, the XPAD export using the GNSSESSENTIAL template
#'
#' @details Makes you less likely to jump out of the window because of dots and weird abbreviations in colnames.
#'
#' @return the gpsExport data.frame with pretty column names
#' @export
#'


gpsPretty <- function(gpsExport){

  gpsExport$X = NULL

  colnames(gpsExport) = gsub("\\.", "_", colnames(gpsExport))
  colnames(gpsExport) = gsub("__", "_", colnames(gpsExport))
  colnames(gpsExport) = gsub("_$", "", colnames(gpsExport))

  return(gpsExport)

}


#' Format GCP for Metashape
#'
#' @details Prepares a txt export from XPAD for the use as ground control points in Metashape
#'
#' @param gpsExport data.frame, the XPAD export using the GNSSESSENTIAL template
#'
#' @return a data.frame with all relevant GCP information
#'
#' @export
#'

gps2gcp <- function(gpsExport){

  gpsExport = gpsPretty(gpsExport)
  gcp = dplyr::select(gpsExport, "Name", "Point_Lon", "Point_Lat", "Point_H",
                             "East_RMS", "North_RMS", "VRMS",
                             "Point_East_E", "Point_North_N", "Point_Z_Z")
  return(gcp)
}


