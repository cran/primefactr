#' @title Compute the ratio of factorials.
#' @description Compute the ratio of factorials
#' using Prime Factorization.
#' For example, ComputeDivFact(c(a, b), c(d, e, f)) computes
#' \eqn{\frac{a! b!}{d! e! f!}}.
#' @param num The vector of all numbers which have their factorials
#' in the numerator.
#' @param deno The vector of all numbers which have their factorials
#' in the denominator. Default is \code{NULL}, there is only a numerator.
#' @param out.log Is the logarithm of the result returned instead?
#' Default is \code{FALSE}.
#' @examples
#' choose(100, 20)
#' ComputeDivFact(100, c(20, 80))
#' lchoose(100, 20)
#' ComputeDivFact(100, c(20, 80), out.log = TRUE)
#'
#' factorial(100)
#' ComputeDivFact(100)
#' lfactorial(100)
#' ComputeDivFact(100, out.log = TRUE)
#' @return The result of the ratio or its logarithm
#' if \code{out.log = TRUE}.
#' @seealso choose
#' @export
ComputeDivFact <- function(num, deno = NULL, out.log = FALSE) {
  code <- integer(max(num, deno))

  for (var in num) {
    code[1:var] <- code[1:var] + 1
  }
  for (var2 in deno) {
    code[1:var2] <- code[1:var2] - 1
  }

  code <- ReducePrime(code, out.summary = TRUE)

  if (out.log) {
    return(sum(code[2, ] * log(code[1, ])))
  } else {
    return(prod(code[1, ] ^ code[2, ]))
  }
}
