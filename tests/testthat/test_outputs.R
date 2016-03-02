library('merrimanR')
context("output checking")

df <- data.frame(col1 = c(NA,NA,NA) , col2 = c(1,1,NA), col3 = c(NA,1,NA))

test_that("check correct output remove_empty_cols()",{
  #test only empty column is being removed, not empty row
  expect_identical(remove_empty_cols(df), data.frame(col2 = c(1,1,NA), col3 = c(NA,1,NA) ))
})

f <- data.frame(FID = c(3,5,1), IID = c("C8","A6","A2"), PID = c(0,0,0), MID = c(0,0,0), SEX = c(0,0,0), AFF = c(-9,-9,-9))
p <- data.frame(IID = c("A2", "A6", "B7", "C2"), trait = c(1,1,2,3))
test_that("output fam dimensions are correct",{
  expect_identical(dim(update_fam(fam = f, pheno_df = p, iid_col = "IID", pheno_col = "trait")), dim(f))
})


