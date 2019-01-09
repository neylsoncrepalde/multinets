#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
StringVector getEdgeColor(IntegerMatrix m, String colorTrue, String colorFalse,
                          String colorDiff) {
  int n = m.nrow();
  StringVector res;

  for (int i = 0; i < n; i++) {
    // If sender is true
    if (m(i,0) == 1) {
      if (m(i,1) == 1)
        res.push_back(colorTrue);
      else
        res.push_back(colorDiff);
    }
    // If sender is false
    else {
      if (m(i,1) == 1)
        res.push_back(colorDiff);
      else
        res.push_back(colorFalse);
    }
  }

  return res;
}
