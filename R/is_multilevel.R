#' @name is_multilevel
#' @author Neylson Crepalde, \email{neylsoncrepalde@@gmail.com}
#' @title Check whether a graph is multilevel
#'
#' @param x A graph object.
#'
#' @description Checks whether a network (a graph) is multilevel
#'   according to the \emph{linked design} proposed by Lazega et al (2008).
#'
#' @details A multilevel network can be defined as a network with two kinds
#'   of vertex and two kinds of edges: Vertices on the lower level are,
#'   usually, individuals. Vertices on the higher level are, usually,
#'   organizations, collectivities or other kinds of social joint
#'   structures. The first kind of edges are those between the vertices
#'   of the higher level and between the vertices of the lower level. The
#'   second kind of edges are those between the vertices of different levels
#'   (affiliation ties).
#'
#'   Put another way, a multilevel network is a bipartite network (2-mode)
#'   that has ties between nodes on both levels.
#'
#' @references Lazega, E., Jourda, M. T., Mounier, L., & Stofer, R. (2008).
#'     Catching up with big fish in the big pond? Multi-level network analysis
#'     through linked design. \emph{Social Networks}, 30(2), 159-176.
#'
#'     Lazega, E. and Snijders, Tom A.B. (eds) (2016),  \emph{Multilevel
#'     Network Analysis for the Social Sciences}: Theory, Methods and
#'     Applications, Springer, Methodos Series.
#'
#' @seealso \code{\link[igraph]{is_bipartite}}
#'
#' @examples
#'   is_multilevel(linked_sim)
#'
#' @export
is_multilevel <- function(x){
  if (!inherits(x, 'igraph')){
    stop("Not a graph object")
  } else {
    if(igraph::is_bipartite(x)){
      falsos <- which(igraph::vertex_attr(x, "type") == FALSE)
      vizinhanca <- igraph::ego(x, nodes = igraph::V(x)[falsos]) #returns list

      todos_vizinhos <- c()
      for (i in 1:length(vizinhanca)){
        todos_vizinhos = c(todos_vizinhos, vizinhanca[[i]][-1])
      }
      outros_falsos = which(
        igraph::vertex_attr(x, "type", igraph::V(x)[todos_vizinhos]) == FALSE
      )

      if (length(outros_falsos) >= 1){
        return(TRUE)
      } else {
        return(FALSE)
      }


    } else {
      stop("Data is not bipartite")
    }
  }
}
