context("Mode transformation")

test_that("mode transformation responds properly to different objects", {
  data("linked_sim")
  data(g.bip, package = "sand")
  data(rfid, package = "igraphdata")

  expect_error(mode_transformation(linked_sim, "high"))
  expect_error(mode_transformation(rfid, "high"))
  expect_silent(mode_transformation(igraph::upgrade_graph(g.bip), "high"))
})

test_that("mode transformation works without specifying 'which'", {
  gteste = igraph::upgrade_graph(g.bip)
  proj = igraph::bipartite_projection(g.bip)
  expect_type(mode_transformation(igraph::upgrade_graph(g.bip)), "list")
  expect_is(mode_transformation(igraph::upgrade_graph(g.bip))$proj1, "igraph")

  for (i in length(igraph::V(proj$proj1)$name)) {
    expect_true(igraph::V(proj$proj1)$name[i] == igraph::V(mode_transformation(igraph::upgrade_graph(g.bip))$proj1)$name[i])
  }
})
