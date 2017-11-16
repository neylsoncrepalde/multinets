#' 2-mode to 1-mode transformation
#'
#' This function is a wrapper to the \code{bipartite_projection()} function from
#'   the igraph package. It transforms a bipartite (2-mode) network to two
#'   1-mode networks. It is recommended to use it as an analysis
#'   tool for a bipartite network that was obtained from
#'   \code{extract_mesolevel()} function.
#'
#' The function counts 1 edge when two vertices of the
#'   higher level share a vertex of the lower level and 1 edge when two vertices
#'   of the lower level are affiliated to the same vertex in the higher level.
#'
#' @author Neylson Crepalde, \email{neylsoncrepalde@@gmail.com}
#' @param x a bipartite graph object. Data must be bipartite and must not
#'   be multilevel
#' @param which one of "both", "high" or "low". High indicates to do the
#'   transformation to the higher level. Low indicates to do the transformation
#'   to the lower level. Both returns a list with both networks.
#'
#' @return If which is set to "both" (default), returns a list with two
#'   generated networks. If which is set to "high" or "low", returns a graph
#'   object.
#'
#' @examples \dontrun{
#' # To obtain both transformed networks
#' transformed <- mode_transformation(affiliation)
#'
#' # To obtain just one transformed network
#' high_transformed <- mode_transformation(affiliation, which = "high")
#' }
#'
#' @export
mode_transformation <- function(x, which = c("both", "high", "low")){

  if (class(x) != "igraph"){
    stop("Not a graph object")
  } else {
    if (is_multilevel(x)){
      stop("Data must be bipartite but not multilevel")
    } else{
      suppressWarnings({

        if (!igraph::is_bipartite(x)){
          stop("Data is not bipartite")
        } else {
          if (which == "both"){
            new = igraph::bipartite_projection(x, which = "both")
          }
          if (which == "high"){
            new = igraph::bipartite_projection(x, which = "true")
          }
          if (which == "low"){
            new = igraph::bipartite_projection(x, which = "false")
          }

          return(new)
        }
      })
    }
  }
}
