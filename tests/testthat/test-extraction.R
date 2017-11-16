context("Extraction from Multilevel Network")

test_that("extractions work properly", {
  data(g.bip, package = "sand")
  data(rfid, package = "igraphdata")

  expect_error(extract_highlevel(igraph::upgrade_graph(g.bip)))
  expect_error(extract_highlevel(rfid))
  expect_error(extract_lowlevel(igraph::upgrade_graph(g.bip)))
  expect_error(extract_lowlevel(rfid))
  expect_error(extract_mesolevel(igraph::upgrade_graph(g.bip)))
  expect_error(extract_mesolevel(rfid))
})
