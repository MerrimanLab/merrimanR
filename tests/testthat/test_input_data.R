library('merrimanR')
context("input checking")

not_df <- matrix()

test_that("check correct input data structure",{
  expect_error(remove_empty_cols(), "Need to provide data.frame")
  expect_error(remove_empty_cols(not_df), "Need to use a data.frame")
})

