\name{bandmin}
\alias{bandmin}
\alias{tapemin}

\title{
Finding Bandwidths that Minimize Frobenius Loss
}
\description{
Given the range of bandwidths from 0 to \code{K}, \code{bandmin} finds the bandwidth that minimizes the estimated Frobenius loss function for a banded covariance matrix. \code{tapemin} finds the bandwidth that minimizes the estimated Frobenius loss function for a tapered covariance matrix out of the range of bandwidths from 0 to \code{floor(K/2)}.
}
\usage{
bandmin(x, K)
tapemin(x, K)
}

\arguments{
  \item{x}{
the data matrix. Must be \code{numeric}.
}
  \item{K}{
the maximum bandwidth to evaluate.
}
}

\value{
Both \code{bandmin} and \code{tapemin} return an object of class \code{numeric}. The value returned is the bandwidth that minimizes the Frobenius loss for, respectively, a banded covariance matrix and a tapered covariance matrix.
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
bandmin(x = sonar.r , K = 59)
tapemin(x = sonar.r , K = 59)
\dontshow{##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, K) 
{
    bandprop = bandloss(x, K)
    IXband = order(bandprop)[1]
    IXband
  }
}
}