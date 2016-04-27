#' Create power graphs for case/control GWAS.
#' @author Tanya Flynn
#'
#' @inheritParams powerOR
#' @param title The title of the graph
#' @family power functions
#'
#' @export
#'
#'
powerGraph=function(caseN=NULL,controlN=NULL,controlA1=NULL,oddsratio=NULL,siglevel=NULL,title=NULL){
  if(is.null(oddsratio))
    oddsratio <- c(1.2,1.5,2.0)
  else oddsratio=oddsratio
  if(is.null(controlA1))
    controlA1 <- seq(0.01,0.5,0.005)
  else controlA1=controlA1

  #specify how many variable to use
  noddsratio <- length(oddsratio)
  ncontrolA1 <- length(controlA1)
  #make file of graphable variables
  result <- data.frame(matrix(nrow=(ncontrolA1),ncol=(noddsratio+1)))
  names(result)=c("allelefreq",(oddsratio))
  result$allelefreq <- controlA1

  #calculate detection power
  for(i in 1:ncontrolA1){
    for(j in 1:noddsratio){
      output <- powerOR(caseN=caseN, controlN=controlN, controlA1=controlA1[i],oddsratio=oddsratio[j],siglevel=siglevel)
      result[i,(j+1)] <- output[10]
    }
  }

  # set up graph
  xrange <- range(controlA1)
  yrange <- 0:1
  plot(xrange, yrange, type="n",
       xlab="Allele Frequency",
       ylab="Detection Power" )

  # add power curves
  for (i in 1:noddsratio){
    lines(controlA1, result[,(i+1)], type="l", lwd=2, lty=i)
  }

  # add legend
  title(as.character(title))
  legend("topright", title="Odds Ratio", as.character(oddsratio), lty=1:noddsratio)

}
