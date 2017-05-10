#' 1000 Genomes LDproxy
#' @author Murray Cadzow
#'
#' @param rsid the rsID for the variant to be searched
#' @param pop the 1000 Genomes population short code either super population (e.g EUR, EAS, ...) or sub population (e.g. CEU, CHB, ...)
#' @family remote query
#'
#' @description A function that will query https://analysistools.nci.nih.gov/LDlink for a proxy SNP.
#' @references Machiela MJ, Chanock SJ. LDlink a web-based application for exploring population-specific haplotype structure and linking correlated alleles of possible functional variants. Bioinformatics. 2015 Jul 2. PMID: 26139635.
#'
#' @export
#'
#'
ldlink_ldproxy <- function(rsid = NULL, pop = NULL){
  if(missing(rsid)){ stop("rsid is NULL")}
  if(missing(pop)){stop('pop is NULL')}
  if(!pop %in% c('AFR','AMR','EAS','EUR','SAS',
                 "ACB","ASW","BEB","CDX","CEU","CHB","CHS","CLM","ESN","FIN",
                 "GBR","GIH","GWD","IBS","ITU","JPT","KHV","LWK","MSL","MXL",
                 "PEL","PJL","PUR","STU","TSI","YRI")){
    stop(paste(pop, "is not a valid population short code"))
  }
  if(!require(RCurl)){'package Rcurl needs to be installed'}

  url <- paste0('https://analysistools.nci.nih.gov/LDlink/LDlinkRest/ldproxy?var=', rsid, '&pop=', pop, '&r2_d=r2')
  urldata <- RCurl::getURL(url)
  result <- read.delim(text = urldata, stringsAsFactors = FALSE)
  if(names(result) == "X."){
    if(grep(result$X., pattern = "IOError") == 1) return(NULL)
  }
  return(result)
}


