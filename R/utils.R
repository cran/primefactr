check <- function(n) {
  is.int <- ((n %% 1) == 0)
  if (!is.int) stop("n should be an integer")
  
  is.pos <- (n > 0)
  if (!is.pos) stop("n should be positive")
  
  return()
}