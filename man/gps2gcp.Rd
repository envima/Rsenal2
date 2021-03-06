% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gpsFunctions.R
\name{gps2gcp}
\alias{gps2gcp}
\title{Format GCP for Metashape}
\usage{
gps2gcp(gpsExport)
}
\arguments{
\item{gpsExport}{data.frame, the XPAD export using the GNSSESSENTIAL template}
}
\value{
a data.frame with all relevant GCP information
}
\description{
Format GCP for Metashape
}
\details{
Prepares a txt export from XPAD for the use as ground control points in Metashape
}
