# Tests is_multilevel

context("Multilevel network definition")

test_that("is_multilevel works properly", {
  data("linked_sim")
  data(g.bip, package = "sand")
  data(rfid, package = "igraphdata")

    expect_equal(is_multilevel(linked_sim), TRUE)
  expect_equal(is_multilevel(igraph::upgrade_graph(g.bip)), FALSE)
  expect_error(is_multilevel(5))
  expect_error(is_multilevel(igraph::upgrade_graph(rfid)))
})
