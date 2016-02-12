library('merrimanR')
context("output checking")

df <- data.frame(col1 = c(NA,NA,NA) , col2 = c(1,1,NA), col3 = c(NA,1,NA))

test_that("check correct output remove_empty_cols()",{
  #test only empty column is being removed, not empty row
  expect_identical(remove_empty_cols(df), data.frame(col2 = c(1,1,NA), col3 = c(NA,1,NA) ))
})





