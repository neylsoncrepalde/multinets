#' A simulated multilevel network
#'
#' A simulated multilevel network following the "linked design" as proposed by
#'   Lazega et al (2008).
#'
#' @name linked_sim
#'
#'
#' @format \code{linked_sim} is a graph object with 150 vertices and 600 edges.
#'   There is one vertex attribute "type" defining to which level each vertex
#'   belongs. \code{FALSE} means lower level and \code{TRUE} means higher level.
#'
#'   linked_sim_matrix is a matrix object that contains the adjacency matrix for
#'   the simulated network.
#'
#'   linked_sim_type is a logical vector containing each vertex type.
#'
#' @source Elaborated by the author.
#'
#' @author Neylson Crepalde, \email{neylsoncrepalde@@gmail.com}
#'
#' @references Lazega, E., Jourda, M. T., Mounier, L., & Stofer, R. (2008).
#'     Catching up with big fish in the big pond? Multi-level network analysis
#'     through linked design. \emph{Social Networks}, 30(2), 159-176.
#'
#'     Lazega, E. and Snijders, Tom A.B. (eds) (2016),  \emph{Multilevel
#'     Network Analysis for the Social Sciences}: Theory, Methods and
#'     Applications, Springer, Methodos Series.
#'
"linked_sim"

#' @rdname linked_sim
"linked_sim_matrix"

#' @rdname linked_sim
"linked_sim_type"
