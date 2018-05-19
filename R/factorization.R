#' @title Get the Prime Factorization.
#' @description Get the Prime Factorization for a number
#' with a particular coding.
#' @param code A vector representing a number. See details.
#' @details A \code{code} is the coding of a number as follows,
#' \deqn{number = \prod i^{code[i]},}
#' or, which is equivalent,
#' \deqn{\log(number) = \sum code[i] * \log(i).}
#' For example, \itemize{
#' \item 5 is coded as (0, 0, 0, 0, 1),
#' \item 5! is coded as (1, 1, 1, 1, 1),
#' \item 8! is coded as (1, 1, 1, 1, 1, 1, 1, 1),
#' \item 8! / 5! is therefore coded as (0, 0, 0, 0, 0, 1, 1, 1),
#' \item 5! = 5 * 3 * 2^3 can be reduced to (0, 3, 1, 0, 1).
#' }
#' Note that the first element of a \code{code} has no effect.
#' @param primes.div The vector of all prime numbers
#' up to \code{sqrt(length(code))}. Default get them for you.
#' @param out.summary Is the result to be summarized? For example,
#' (2, 3, 0, 0, 1) can be summarized as (2, 5; 3, 1). Default is \code{FALSE}.
#' @examples
#' code100 <- c(rep(0, 99), 1)
#' ReducePrime(c(rep(0, 99), 1), out.summary = TRUE)
#' primes.div <- AllPrimesUpTo(floor(sqrt(length(code100))))
#' ReducePrime(c(rep(0, 99), 1), primes.div = primes.div)
#' @return Two rows representing prime numbers
#' @export
ReducePrime <- function(code, out.summary = FALSE, primes.div = NULL) {
  n <- length(code)
  if (n >= 4) {
    if (is.null(primes.div))
      primes.div <- AllPrimesUpTo(floor(sqrt(n)))
    for (p in primes.div) {
      tmp.n <- n
      for (i in 1:(floor(log(tmp.n, p)) - 1)) {
        s <- seq(p, tmp.n, p)
        tmp.n <- floor(tmp.n / p)
        code.s <- code[s]
        code[s] <- 0
        code[p] <- sum(code.s)
        code[1:tmp.n] <- code[1:tmp.n] + code.s
      }
    }
  }
  code[1] <- 0  # convention

  if (out.summary) {
    primes <- which(code != 0)
    return(rbind(primes = primes, power = code[primes]))
  } else {
    return(code)
  }
}
