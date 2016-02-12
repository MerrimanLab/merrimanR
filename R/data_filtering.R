#remove empty columns from data.frame

remove_empty_cols <- function(data){
  if(missing(data)){
    stop("Need to provide data.frame")
  }
  if(!is.data.frame(data)){
    stop("Need to use a data.frame")
  }
  return(Filter(function(x)!all(is.na(x)), data))
}

