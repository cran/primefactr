#' @title Is a prime number?
#' @description Is n a prime number? You can see what is a
#' prime number [there](https://en.wikipedia.org/wiki/Prime_number).
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
  primes <- rep(TRUE, n)
  primes[1] <- FALSE
  for (i in 1:sqrt(n)) {
    if (primes[i]) primes[seq(i^2, n, i)] <- FALSE
  }
  which(primes)
}
