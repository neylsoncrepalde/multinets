#' Set shapes for levels of a multilevel network
#'
#' Set vertices shapes for a multilevel network.
#'   Default set to "square" (higher level) and "circle" (lower level).
#'
#' @author Neylson Crepalde, \email{neylsoncrepalde@@gmail.com}
#' @inheritParams set_color_multilevel
#' @param shape.true a character. The shape to be chosen for the higher
#'   level (attribute \code{type} set to \code{TRUE}).
#' @param shape.false a character. The shape to be chosen for the lower
#'   level (attribute \code{type} set to \code{FALSE}).
#'
#' @return A graph object. A multilevel network with an added \code{shape}
#'   vertex attribute vector.
#'
#' @examples
#' # Check whether a graph is multilevel
#' is_multilevel(linked_sim)
#'
#' # Set the shapes for each level
#' linked_sim <- set_shape_multilevel(linked_sim)
#'
#'
#'
#' @export
set_shape_multilevel <- function(
  x, shape.true = "square", shape.false = "circle"){
  if (!inherits(x, 'igraph')){
    stop("Not a graph object")
  } else {
    if(is_multilevel(x)){

      igraph::V(x)$shape <- iterateShape(as.integer(igraph::V(x)$type),
                                         shapeTrue = shape.true,
                                         shapeFalse = shape.false)
      return(x)

    } else {
      stop("The network is not multilevel")
    }
  }
}
