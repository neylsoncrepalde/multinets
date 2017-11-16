#' Extract the low level of a multilevel network
#'
#' Functions to extract one of the three levels of a multilevel network.
#'   \code{extract_highlevel()} will extract the higher level vertices and the
#'   edges between them, \code{extract_lowlevel()} will extract the lower level
#'   vertices and the edges between them. On the other hand,
#'   \code{extract_mesolevel()} will extract all the vertices but only the edges
#'   between vertices from different levels.
#'
#' @author Neylson Crepalde, \email{neylsoncrepalde@@gmail.com}
#' @inheritParams set_color_multilevel
#'
#' @return \code{extract_highlevel()} and \code{extract_lowlevel()}
#'   return a 1-mode network. All
#'   the vertices in the selected level and the edges between them.
#'   \code{extract_mesolevel()} returns a bipartite (2-mode) network.
#'   All the vertices
#'   are kept. Only edges between vertices of different levels are kept. This
#'   is what the literature also calls an \emph{affiliation} network.
#'
#' @examples \dontrun{
#' organizations <- extract_highlevel(linked_sim)
#'
#' individuals <- extract_lowlevel(linked_sim)
#'
#' affiliations <- extract_mesolevel(linked_sim)
#' }
#' @export
extract_lowlevel <- function(x){
  if (class(x) != "igraph"){
    stop("Not a graph object")
  } else {
    if (!is_multilevel(x)){
      stop("The network is not multilevel")
    } else {
      igraph::induced_subgraph(x, igraph::V(x)[igraph::V(x)$type == FALSE])
    }
  }
}
