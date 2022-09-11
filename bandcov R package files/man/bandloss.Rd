\name{bandloss}
\alias{bandloss}
\alias{tapeloss}

\title{
Estimating Frobenius Loss from Banding and Tapering
}
\description{
\code{bandloss} estimates the Frobenius loss function from banding the covariance matrix. \code{tapeloss} estimates the Frobenius loss function from tapering the covariance matrix. In both functions, the loss function is estimated for all bandwidths from 0 to \code{K}.
}
\usage{
bandloss(x, K)
tapeloss(x, K)
}
\arguments{
  \item{x}{
the data matrix. Must be \code{numeric}.
}
  \item{K}{
the maximum bandwidth to evaluate. All bandwidths from 0 to \code{K} are evaluated.
}
}
\details{
\code{bandloss} is also used in \code{bandmin}, and \code{tapeloss} is also used in \code{tapemin}}
\value{
\code{tapeloss} returns a vector with \code{K}+1 elements. The first element corresponds to the estimated Frobenius loss when the bandwidth is 0, the second element corresponds to the estimated Frobenius loss when the bandwidth is 1, and so on until the last element, which is the estimated Frobenius loss when the bandwidth is \code{K}. 

\code{tapeloss} returns a vector with estimated Frobenius loss from tapering. For this vector, however, the \code{K}th element of the vector corresponds to using \code{floor(K/2)} as the bandwidth.
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
bandloss(x = sonar.r , K = 10)
tapeloss(x = sonar.r , K = 10)
\dontshow{##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, K) 
{
    adt <- sscov(x)
    tempres <- bandpen(x, K)
    res.b <- rep(0, times = K + 1)
    bl <- .C("bandloss", as.integer(nrow(x)), as.integer(ncol(x)), 
        as.integer(K), as.double(adt), as.double(tempres), as.double(res.b))[[6]]
    bl
  }
}
}

