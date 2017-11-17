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
#' @examples \dontrun{
#' # Check whether a graph is multilevel
#' is_multilevel(linked_sim)
#'
#' # Set the colors for each level
#' linked_sim <- set_color_multilevel(linked_sim)
#' }
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
      igraph::V(x)$color <- ifelse(igraph::V(x)$type == TRUE,
                                   adjustcolor(color.true, V.alpha),
                                   adjustcolor(color.false, V.alpha))
      # Edges
      lacos = igraph::ends(x, igraph::E(x), names = FALSE)
      # buscando cada laco
      for (i in 1:nrow(lacos)){
        # Se os nos do laco forem iguais
        if (igraph::vertex_attr(x, "type", lacos[i,1]) ==
            igraph::vertex_attr(x, "type", lacos[i,2])){
          # Se forem TRUE
          if (igraph::vertex_attr(x, "type", lacos[i,1]) == TRUE){
            igraph::E(x)$color[i] = adjustcolor(color.true, E.alpha)
          } else { # se forem FALSE
            igraph::E(x)$color[i] = adjustcolor(color.false, E.alpha)
          }
        } else {
          # Se os nos do laco nao forem iguais
          igraph::E(x)$color[i] = adjustcolor("grey", E.alpha)
        }
      }

      return(x)

    } else{
      stop("The network is not multilevel")
    }
  }
}
