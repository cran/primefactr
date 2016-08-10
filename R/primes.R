#' @title Is a prime number?
#' @description Is n a prime number?
#' @inheritParams primefactr-package
#' @examples
#' IsPrime(1)         # FALSE
#' IsPrime(5)         # TRUE
#' IsPrime(59999999)  # TRUE
#' @return A boolean.
#' @export
IsPrime <- function(n) {
  check(n)
  if (n == 1) {
    return(FALSE)
  } else if  (n == 2) {
    return(TRUE)
  } else {
    return(all(n %% (2:sqrt(n)) != 0))
  }
}

#' @title Get all prime numbers.
#' @description Get all prime numbers up to n.
#' @inheritParams primefactr-package
#' @examples
#' AllPrimesUpTo(10)
#' AllPrimesUpTo(100)
#' AllPrimesUpTo(1e6)
#' @return A integer vector of all prime numbers up to n.
#' @export
AllPrimesUpTo <- function(n) {
  check(n)
  if (n == 1) {
    return(integer(0))
  } else if (n == 2) {
    return(2L)
  } else if (n == 3) {
    return(c(2L, 3L))
  } else {
    primes <- rep(TRUE, n)
    primes[1] <- FALSE
    for (i in 2:sqrt(n)) {
      if (primes[i]) primes[seq(2*i, n, i)] <- FALSE
    }
    return(which(primes))
  }
}
