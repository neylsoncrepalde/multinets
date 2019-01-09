#' Set colors for levels of a multilevel network
#'
#' Set vertices and edges colors for a multilevel network.
#'   Default set to blue (higher level) and red (lower level).
#'
#' @author Neylson Crepalde, \email{neylsoncrepalde@@gmail.com}
#' @param x a graph object. Must be a multilevel network.
#' @param color.true a character. The color to be chosen for the higher
#'   level (attribute \code{type} set to \code{TRUE}).
#' @param color.false a character. The color to be chosen for the lower
#'   level (attribute \code{type} set to \code{FALSE}).
#' @param V.alpha numeric. The factor modifying the opacity alpha for the
#'   vertices; typically in [0,1].
#' @param E.alpha numeric. The factor modifying the opacity alpha for the
#'   edges; typically in [0,1].
#'
#' @return A graph object. A multilevel network with an added \code{color}
#'   vertex attribute vector and a \code{color} edge attribute vector.
#'
#' @importFrom grDevices adjustcolor
#'
#' @examples
#' # Check whether a graph is multilevel
#' is_multilevel(linked_sim)
#'
#' # Set the colors for each level
#' linked_sim <- set_color_multilevel(linked_sim)
#'
#'
#' @export
set_color_multilevel <- function(
  x, color.true = "blue",color.false = "red",
  V.alpha = 0.7, E.alpha = 0.7
){
  if (class(x) != "igraph"){
    stop("Not a graph object")
  } else {
    if(is_multilevel(x)){
      # Vertex
      igraph::V(x)$color <- iterateColor(as.integer(igraph::V(x)$type),
                                         adjustcolor(color.true, V.alpha),
                                         adjustcolor(color.false, V.alpha))
      # Edges
      lacos = igraph::ends(x, igraph::E(x), names = FALSE)
      tipos = get_types(lacos, x)

      igraph::E(x)$color = getEdgeColor(tipos, adjustcolor(color.true,E.alpha),
                                        adjustcolor(color.false,E.alpha),
                                        adjustcolor("grey",E.alpha))

      return(x)

    } else{
      stop("The network is not multilevel")
    }
  }
}

get_types = function(m, g) {
  if (class(m) != "matrix") stop("m must be a matrix")

  tipos = matrix(nrow = nrow(m), ncol = ncol(m))
  for (i in 1:nrow(tipos)) {
    for (j in 1:ncol(tipos)) {
      tipos[i,j] = igraph::V(g)$type[m[i,j]]
    }
  }
  tipos = ifelse(tipos, 1L, 0L)
  return(tipos)
}
