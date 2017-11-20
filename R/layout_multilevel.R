#' Layout for multilevel networks
#'
#' Set layout coordinates for multilevel networks from a chosen
#'   algorithm
#'
#' In order to facilitate the visualization of multilevel networks, higher
#'   level nodes are set in the upper part of the plane and the lower level
#'   nodes are set in the lower part of the plane.
#'
#' @author Neylson Crepalde, \email{neylsoncrepalde@@gmail.com}
#'
#' @inheritParams set_color_multilevel
#'
#' @param layout The chosen layout algorithm. A function layout of the 'igraph'
#'   package without parentheses. Default set to 'Fruchterman-Reingold'.
#'
#' @return A two- or three-column matrix, each row giving the coordinates of
#'   a vertex, according to the ids of the vertex ids.
#'
#' @seealso \code{\link[igraph]{layout_}}
#'
#' @examples
#' # Check if the network is multilevel
#' is_multilevel(linked_sim)
#'
#' # Generate the layout (x,y) coordinates
#' l <- layout_multilevel(linked_sim)
#'
#' # Plot the graph using the layout
#' plot(linked_sim, layout = l)
#'
#' # Using Kamada Kawai algorithm
#' l.kk <- layout_multilevel(linked_sim, layout = igraph::layout_with_kk)
#'
#' # Plot the graph with the new layout
#' plot(linked_sim, layout = l.kk)
#'

#' @export
layout_multilevel <- function(x, layout = igraph::layout_with_fr){
  if (class(x) != "igraph"){
    stop("Not a graph object")
  } else {
    if (is_multilevel(x)){
      l = igraph::norm_coords(layout(x))
      lay_multi = matrix(nrow = nrow(l), ncol = ncol(l))
      lay_multi[ ,1] = l[ ,1]

      # Send differents up and down
      # The logic is, if it is type TRUE and it is down, send it up.
      # If it is type FALSE and it is up, send it down.

      for (i in 1:nrow(lay_multi)){
        if (igraph::V(x)$type[i] == TRUE){
          if (l[i,2] >= 0){
            lay_multi[i,2] = l[i,2] * 1
          } else {
            lay_multi[i,2] = l[i,2] * -1
          }
        } else {
          if (l[i,2] < 0){
            lay_multi[i,2] = l[i,2] * 1
          } else {
            lay_multi[i,2] = l[i,2] * -1
          }
        }
      }
      # end for

      return(open_plot(lay_multi))

    } else {
      stop("The network is not multilevel")
    }

  }
}


# Needed function
open_plot <- function(A){
  B = A
  for (i in 1:nrow(B)){
    if (B[i,2] > 0){
      B[i,2] = B[i,2] + .3
    }
    if (B[i,2] < 0){
      B[i,2] = B[i,2] - .3
    }
  }

  return(B)
}
