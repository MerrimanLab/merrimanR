#' Insert function template
#'
#' Call this function as an addin to insert a function template at the cursor position.
#'
#' @export

functionTemplate <- function(){
  rstudioapi::insertText(" <- function() {

  } ")
}
