context("test-tttable.R")

test_that("basic tttable construction and printing 'works' ", {
  t1 <- expect_silent(tttable(toy, arr("V1", "V2")))
  t1
})
