context("Layout conditions")

test_that("layout_multilevel responds correctly to various objects",{
  data("linked_sim")
  data(g.bip, package = "sand")
  data(rfid, package = "igraphdata")

  expect_error(layout_multilevel(igraph::upgrade_graph(g.bip)))
  expect_error(layout_multilevel(rfid))
  expect_equal(inherits(layout_multilevel(linked_sim), "matrix"), TRUE)
})
