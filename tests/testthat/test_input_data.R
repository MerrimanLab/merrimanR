library('merrimanR')
context("input checking")

not_df <- matrix()
df <- data.frame()

f <- data.frame(FID = c(3,5,1), IID = c("C8","A6","A2"), PID = c(0,0,0), MID = c(0,0,0), SEX = c(0,0,0), AFF = c(-9,-9,-9))
f1 <- data.frame(V1 = c(3,5,1), V2 = c("C8","A6","A2"), V3 = c(0,0,0), V4 = c(0,0,0), V5 = c(0,0,0), V6 = c(-9,-9,-9))
p <- data.frame(IID = c("A2", "A6", "B7", "C2"), trait = c(1,1,2,3))
test_that("check arguments are provided",{
  expect_error(remove_empty_cols(), "Need to provide data.frame")
  expect_error(update_fam(), "Make sure all arugments are filled")
})

test_that("check correct input data structure",{
  expect_error(remove_empty_cols(not_df), "Need to use a data.frame")

  expect_error(update_fam(fam = not_df, pheno= df, iid_col = "",pheno_col = "" ), "fam and pheno_df need to be data.frame")
  expect_error(update_fam(fam = df, pheno= not_df, iid_col = "",pheno_col = "" ), "fam and pheno_df need to be data.frame")
  expect_error(update_fam(fam = not_df, pheno= not_df, iid_col = "",pheno_col = "" ), "fam and pheno_df need to be data.frame")
  expect_error(update_fam(fam = df, pheno = df, iid_col = 1, pheno_col = ""), "id_col and pheno_col need to be type character")
  expect_error(update_fam(fam = df, pheno = df, iid_col = "", pheno_col = 1), "id_col and pheno_col need to be type character")
  expect_error(update_fam(fam = f1, pheno_df = p, iid_col = "IID", pheno_col = "trait"), "Ensure column names of fam are 'FID', 'IID', 'PID','MID','SEX','AFF'")
})

