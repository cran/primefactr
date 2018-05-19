[![Project Status: Inactive ? The project has reached a stable, usable state but is no longer being actively developed; support/maintenance will be provided as time allows.](http://www.repostatus.org/badges/latest/inactive.svg)](http://www.repostatus.org/#inactive) [![Licence](https://img.shields.io/badge/licence-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html) [![Build Status](https://travis-ci.org/privefl/primefactr.svg?branch=master)](https://travis-ci.org/privefl/primefactr) [![codecov](https://codecov.io/gh/privefl/primefactr/branch/master/graph/badge.svg)](https://codecov.io/gh/privefl/primefactr) [![minimal R version](https://img.shields.io/badge/R%3E%3D-3.2.3-6666ff.svg)](https://cran.r-project.org/) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/primefactr)](https://cran.r-project.org/package=primefactr) [![packageversion](https://img.shields.io/badge/Package%20version-0.1.0-orange.svg?style=flat-square)](commits/master) [![Last-changedate](https://img.shields.io/badge/last%20change-2018--05--17-yellowgreen.svg)](/commits/master)

# primefactr

R package that uses Prime Factorization for computations.

This small R package was initially developed to compute [hypergeometric probabilities](https://en.wikipedia.org/wiki/Hypergeometric_distribution) which are used in Fisher's exact test, for instance.

Installation and Attachment
---------------------------

``` r
## Installation
install.packages("primefactr")

## Attachment
library("primefactr")
```

Features
--------

### Main feature

To compute
<p align="center"><img src="https://raw.githubusercontent.com/privefl/primefactr/master/CodeCogsEqn.png"></p>
you can use `ComputeDivFact(c(K, (N-K), n, (N-n)), c(k, (K-k), (n-k), (N-K-n+k), N))`. This uses a Prime Factorization to simplify computations.

### Play with primes

You can also test if a number is a prime and get all prime numbers up to a certain number.
