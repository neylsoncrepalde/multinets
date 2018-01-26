#include <Rcpp.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
NumericMatrix openPlot(NumericMatrix A) {
  
  int n = A.nrow();
  NumericMatrix B(A.nrow(), A.ncol());
  
  for (int i = 0; i < n; i++){
    if (A(i,1) > 0){
      B(i,0) = A(i,0);
      B(i,1) = A(i,1) + 0.3;
    }
    if (A(i,1) < 0){
      B(i,0) = A(i,0);
      B(i,1) = A(i,1) - 0.3;
    }
  }
  
  return B;
}
