% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crownShape.R
\name{crownShape}
\alias{crownShape}
\title{Crown Shapes}
\usage{
crownShape(tree, distance, angle, crs = 25832)
}
\arguments{
\item{tree}{sf point tree}

\item{distance}{vector with measured distances}

\item{angle}{vector with measured angles}

\item{crs}{epsg code}
}
\value{
tree with crown shape poylgon
}
\description{
Adds crown geometry to tree
}
\examples{
# create example tree
t = data.frame(id = "tree1", x = 5, y = 5)
t = sf::st_as_sf(t, coords = c(2,3))

# measurements with angle and distance
m = data.frame(a = c(0,90,160,200,270),
               d = c(1,2,1,3,2))

tc = crownShape(t = t, angle = m$a, distance = m$d)
plot(tc)

}
\author{
Marvin Ludwig
}
