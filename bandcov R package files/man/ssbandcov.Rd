\name{ssbandcov}
\alias{ssbandcov}
\title{
Estimating the Sum of Squares for a Banded Covariance Matrix
}
\description{
\code{ssbandcov} estimates the sum of squares for a banded covariance matrix with bandwidth \code{k}. Using \code{bandtest.stat}, this value is compared with the sum of squares for the non-banded covariance matrix in order to test whether \code{k} is the appropriate bandwidth. 
}
\usage{
ssbandcov(x, k)
}
\arguments{
  \item{x}{
the data matrix. Must be \code{numeric}.
}
  \item{k}{
The bandwidth of the banded covariance matrix.
}
}
\details{
This function is used in \code{bandtest.stat} to compute a test statistic.
}
\value{
\code{ssbandcov} returns an object of class \code{numeric}.This value is the sum of squares for the banded covariance matrix with bandwidth \code{k}.
}
\references{
Qiu, Y. and Chen, S. X. (2015) \emph{Journal of the American Statistical Association}. \bold{110.511}, 1160--1174.

Qiu, Y. and Chen, S. X. (2012) \emph{The Annals of Statistics}. \bold{40.3}, 1285--1314.

Chen, S.X., Zhang, L., and Zhong, P. (2010) \emph{Journal of the American Statistical Association}.
}
\author{
Yumou Qiu and Jason Adams
}


\examples{
ssbandcov(x = sonar.r , k = 2)
ssbandcov(x = sonar.r , k = 3)
\dontshow{##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, k) 
{
    if (typeof(x) != "double") {
        stop("X must be numeric")
    }
    if (k >= ncol(x)) {
        stop("k must be less than p")
    }
    res <- .C("adb", as.double(x), as.integer(nrow(x)), as.integer(ncol(x)), 
        as.integer(k), as.double(0))[5]
    as.numeric(res)
  }
}
}