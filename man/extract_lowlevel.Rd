% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_lowlevel.R
\name{extract_lowlevel}
\alias{extract_lowlevel}
\title{Extract the low level of a multilevel network}
\usage{
extract_lowlevel(x)
}
\arguments{
\item{x}{a graph object. Must be a multilevel network.}
}
\value{
\code{extract_highlevel} and \code{extract_lowlevel}
  return a 1-mode network. All
  the vertices in the selected level and the edges between them.
  \code{extract_mesolevel} returns a bipartite (2-mode) network.
  All the vertices
  are kept. Only edges between vertices of different levels are kept. This
  is what the literature also calls an \emph{affiliation} network.
}
\description{
Extract one of the three levels of a multilevel network.
  \code{extract_highlevel} will extract the higher level vertices and the
  edges between them, \code{extract_lowlevel} will extract the lower level
  vertices and the edges between them. On the other hand,
  \code{extract_mesolevel} will extract all the vertices but only the edges
  between vertices from different levels.
}
\examples{
organizations <- extract_highlevel(linked_sim)

individuals <- extract_lowlevel(linked_sim)

affiliations <- extract_mesolevel(linked_sim)

}
\author{
Neylson Crepalde, \email{neylsoncrepalde@gmail.com}
}
