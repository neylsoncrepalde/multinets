#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
StringVector iterateShape(IntegerVector x, String shapeTrue, String shapeFalse) {
  int n = x.size();

  StringVector res;

  for (int i = 0; i < n; i++){
    if (x[i] == 1){
      res.push_back(shapeTrue);
    } else {
      res.push_back(shapeFalse);
    }
  }

  return res;
}
