context("test-build.R")

#so far min_build2 can only deal with all variables assigned to rows or cols

test_that("min_build2 doesn't error", {
  expect_silent(min_build2(tttable(toy, arr("V1", "V2"))))
  expect_silent(min_build2(tttable(toy, arr(c("V1", "V2")))))
  expect_silent(min_build2(tttable(toy, arr(cols = c("V1", "V2")))))
})
