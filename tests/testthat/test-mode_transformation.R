context("Mode transformation")

test_that("mode transformation responds properly to different objects", {
  data("linked_sim")
  data(g.bip, package = "sand")
  data(rfid, package = "igraphdata")

  expect_error(mode_transformation(linked_sim, "high"))
  expect_error(mode_transformation(rfid, "high"))
  expect_silent(mode_transformation(igraph::upgrade_graph(g.bip), "high"))
})

test_that("function with missing argument 'which' raises error", {
  data(rfid, package = "igraphdata")
  expect_error(mode_transformation(igraph::upgrade_graph(g.bip)))
})
