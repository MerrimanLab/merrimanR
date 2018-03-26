#' Update plink fam file affection column with specified phenotype/affection.
#' @author Murray Cadzow
#'
#' @param fam The plink fam file read into R as a data.frame
#' @param pheno_df The data.frame containing the sample ids and phenotypes
#' @param fid_col The column name in pheno_df containing the FIDs
#' @param iid_col The column name in pheno_df containing the IIDs
#' @param pheno_col The column name in pheno_df containing the phenotypes to put into the fam file
#'
#' @export
#'
#'

update_fam  <- function(fam = NULL, pheno_df = NULL, fid_col = NULL, iid_col = NULL, pheno_col = NULL) {
  if(missing(fam) | missing(pheno_df) | missing(iid_col) | missing(pheno_col) ){
    stop("Make sure all arugments are filled")
  }
  if(missing(fid_col)){
    message("fid_col was not provided, ensure all iid's in fam and pheno are unique!")
  }
  if(!is.data.frame(fam) | !is.data.frame(pheno_df)){
    stop("fam and pheno_df need to be data.frame")
  }

  if(!is.character(iid_col) | !is.character(pheno_col)){
    stop("iid_col and pheno_col need to be type character")
  }
  if(dim(fam)[2] != 6){
    stop("fam should have 6 columns")
  }
  if(sum(c("FID", "IID", "PID","MID","SEX","AFF") %in% colnames(fam)) != 6 ){
    stop("Ensure column names of fam are 'FID', 'IID', 'PID','MID','SEX','AFF'")
  }
  if(sum(iid_col %in% colnames(pheno_df)) == 0){
    stop("iid_col not in colnames(pheno_df)")
  }
  if(sum(pheno_col %in% names(pheno_df)) == 0){
    stop("pheno_col not in colnames(pheno_df")
  }
  if(sum(pheno_df[,iid_col] %in% fam$IID) == 0){
    stop("No ids match between pheno_df and fam")
  }

  fam$sort <- as.numeric(row.names(fam))
  if(!missing(fid_col)){
    updated_fam <- merge(fam, pheno_df[,c(fid_col,iid_col, pheno_col)], by.x = c("FID","IID"), by.y = c(fid_col,iid_col), all.x = TRUE)
  } else {
    updated_fam <- merge(fam, pheno_df[,c(iid_col, pheno_col)], by.x = "IID", by.y = iid_col, all.x = TRUE)
  }
  updated_fam <- updated_fam[order(updated_fam$sort),]
  message(paste0("There were ", sum(pheno_df[,iid_col] %in% fam$IID), " pheno ids in the fam file out of ",length(pheno_df[,iid_col]) ," ids"))
  message(paste0("There were ", sum(fam$IID %in% pheno_df[,iid_col]), " fam ids in the pheno info out of ", length(fam$IID) ," ids"))
  if(nrow(fam) != nrow(updated_fam)){
    stop("Merge went weird, too many matches!")
  }
  updated_fam <- updated_fam[,c("FID", "IID", "PID","MID","SEX",pheno_col)]
  colnames(updated_fam) <- c("FID", "IID", "PID","MID","SEX","AFF")
  return(updated_fam)
}
