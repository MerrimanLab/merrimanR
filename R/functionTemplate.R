#' Insert function template
#'
#' Call this function as an addin to insert a function template at the cursor position.
#'
#' @export

functionTemplate <- function() {
  rstudioapi::insertText(" <- function() {\n\t\n} ")
  if(rstudioapi::getActiveDocumentContext()$path != ""){
    rstudioapi::navigateToFile(file = rstudioapi::getActiveDocumentContext()$path,
                               line = rstudioapi::getActiveDocumentContext()$selection[[1]]$range$start[1] -1 ,
                               column= 3)
  }
}

