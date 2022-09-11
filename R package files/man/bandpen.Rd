\name{bandpen}
\alias{bandpen}
\alias{bandpen2}
\title{
Calculating Sums of Squares and Penalties
}
\description{
\code{bandpen2} estimates the sum of squares and the penalty for the \code{q}th off diagonal while \code{bandpen} implements \code{bandpen2} for all the off diagonals from the main diagonal up to the \code{K}th off diagonal.
} 
\usage{
bandpen(x, K)
bandpen2(x, q)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
the data matrix. Must be \code{numeric}.
}
  \item{K}{
the largest off diagonal to evaluate. All off diagonals up to \code{K} will be evaluated. \code{K} is only used in \code{bandpen}.
}
\item{q}{
the off diagonal to be evaluated. \code{q} is only used in \code{bandpen2}.
}
}
\details{
\code{bandpen2} is used in \code{bandpen}. \code{bandpen} is used in \code{bandloss} and \code{tapeloss}
}
\value{
\code{bandpen2} returns a two element vector. The first element is the estimated sum of squares, and the second element is the penalty. \code{bandpen} returns a matrix with \code{K}+1 rows and 2 columns. The first row is for the main diagonal, the second row is for the first off diagonal, and the final row is for the \code{K}th off diagonal. The first column is the estimated sum of squares, and the second column is the penalty.
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
bandpen2(x = sonar.r , q = 10)
bandpen(x = sonar.r , K = 10)
\dontshow{##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, K) 
{
    if (typeof(x) != "double") {
        stop("X must be numeric")
    }
    if (K >= ncol(x)) {
        stop("K must be less than p")
    }
    store = matrix(0, K + 1, 2)
    res <- .C("bandpen", as.double(x), as.integer(nrow(x)), as.integer(ncol(x)), 
        as.integer(K), as.double(store))[[5]]
    resM <- matrix(res, nrow = K + 1, ncol = 2, byrow = T)
    resM[1, ] <- bandpen2(x, 0)
    resM
  }
}
}
