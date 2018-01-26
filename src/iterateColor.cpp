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
StringVector iterateColor(IntegerVector x, String colorTrue, String colorFalse) {
  int n = x.size();
  
  StringVector res;
  
    for (int i = 0; i < n; i++){
      if (x[i] == 1){
        res.push_back(colorTrue);
      } else {
        res.push_back(colorFalse);
      }
    }
  
  
  return res;
}



// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
iterateColor(c(0,0,1,1,0,1), "blue", "red")
*/
