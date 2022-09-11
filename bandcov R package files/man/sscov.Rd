\name{sscov}
\alias{sscov}

\title{
Estimating the Sum of Squares for a Covariance Matrix
}
\description{
\code{sscov} is used to estimate the sum of squares for an non-banded covariance matrix. In bandwidth testing and estimation, this value is compared against the sum of squares for banded and tapered matrices.
}

\usage{
sscov(x)
}

\arguments{
  \item{x}{
the data matrix. Must be \code{numeric}.
}
}
\details{
This function is used in \code{bandtest.stat}, \code{bandloss}, and \code{tapeloss}.
}
\value{
\code{sscov} returns an object of class \code{numeric}. This value is the sum of squares for the entire non-banded covariance matrix. 
}
\references{
Qiu, Y. and Chen, S. X. (2015) \emph{Journal of the American Statistical Association}. \bold{110.511}, 1160--1174.

Qiu, Y. and Chen, S. X. (2012) \emph{The Annals of Statistics}. \bold{40.3}, 1285--1314.

Chen, S.X., Zhang, L., and Zhong, P. (2010) \emph{Journal of the American Statistical Association}. \bold{105.490}, 810--819.
}
\author{
Yumou Qiu and Jason Adams
}
\examples{
sscov(x = sonar.r)
sscov(x = sonar.m)
\dontshow{##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x) 
{
    if (nrow(x) < 4) {
        stop("X must have more than 4 rows")
    }
    if (typeof(x) != "double") {
        stop("X must be numeric")
    }
    M <- c(nrow(x), ncol(x))
    a <- matrix(1, nrow = 1, ncol = M[1])
    A <- t(a \%*\% x)
    B <- sum(diag(x \%*\% t(x)))
    mf22 <- t(A) \%*\% A - B
    mf1 <- 1/P(2, M[1]) + 2/P(3, M[1]) + 2/P(4, M[1])
    mf2 <- 1/P(4, M[1])
    mf3 <- 2/P(3, M[1]) + 4/P(4, M[1])
    res <- .C("adT", as.double(x), as.double(M[1]), as.double(M[2]), 
        as.integer(a), as.double(A), as.double(B), as.double(mf22), 
        as.double(mf1), as.double(mf2), as.double(mf3), as.double(0))
    as.numeric(res[11])
  }
}
}
