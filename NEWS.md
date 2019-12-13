# multinets 0.2.2

* *CRAN Error fix* - Fix CRAN error in https://cran.r-project.org/web/checks/check_results_multinets.html

* *CRAN Note fix* - Fix CRAN Notes in https://cran.r-project.org/web/checks/check_results_multinets.html
* *bug fix* - correct problems with seting edge colors
* Change levels' distance in layout_multilevel

# multinets 0.2.1

* *bug fix* - correct package imports in DESCRIPTION file ("igraphdata").

# multinets 0.2.0

* *enhance* set_color_multilevel. Cpp code set colors to nodes and edges.

# multinets 0.1.1.9001

* small *enhance* set_color_multilevel using cpp. Cpp code only sets colors to nodes, not yet to edges.

# multinets 0.1.1.9000

* *bug fix* - issue #1 - fix if statement with condition length > 1. Changed chain of if statements in mode_transformation to a switch and included an error raise when which argument is missing.

* *enhance* set_shape_multilevel performance with cpp code.

* include Rcpp in the project.


# multinets 0.1.0

* First release
