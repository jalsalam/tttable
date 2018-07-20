context("test-arrangements.R")

library(rlang)
#a1  <- arr("V1")
#a2  <- arr(c("V1", "V2"))
#a3  <- arr(rows = "V1", cols = "V2")
#a1b <- arr(V1)
#a2b <- arr(vars(V1, V2))
#a3b <- arr(rows = V1, cols = V2)

a1 <- expect_silent(
  new_arr(rows = syms("V1"), cols = syms(c()))
)

test_that("new_arr constructor returns lists of lists of symbols", {

  expect_s3_class(a1, "tt_arr")

  expect_length(a1, 2)
  expect_length(a1$rows, 1)
  expect_length(a1$cols, 0)

  s1 <- structure(
    list(
      rows = rlang::syms(c("V1")),
      cols = rlang::syms(c())
    ),
    class = "tt_arr"
  )

  expect_equal(a1, s1)

})

a2 <- expect_silent(new_arr(rows = syms(c("V1", "V2")), cols = syms(c())))
a3 <- expect_silent(new_arr(rows = syms(c("V1")), cols = syms(c("V2"))))


test_that("basic arrangements match constructor calls", {

  expect_equivalent(arr("V1"), a1)
  expect_equal(arr(c("V1", "V2")), a2)
  expect_equal(arr("V1", "V2"), a3)

})

#a1  <- arr("V1")
#a2  <- arr(c("V1", "V2"))
#a3  <- arr(rows = "V1", cols = "V2")
#a1b <- arr(V1)
#a2b <- arr(vars(V1, V2))
#a3b <- arr(rows = V1, cols = V2)
