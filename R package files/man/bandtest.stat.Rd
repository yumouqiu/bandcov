\name{bandtest.stat}
\alias{bandtest.stat}

\title{
Computing a Test Statistic for the Covariance Matrix Bandwidth
}
\description{
\code{bandtest.stat} gives the test statistic for the null hypothesis that the covariance matrix is equal to the banded version of the covariance matrix with bandwidth \code{k}.
}
\usage{
bandtest.stat(x, k)
}

\arguments{
  \item{x}{
the data matrix. Must be \code{numeric}.
}
  \item{k}{
the proposed bandwidth.
}
}

\value{
\code{bandtest.stat} returns an object of class \code{numeric}. This value is the test statistic. Reject the null hypothesis if the test statistic is larger than $2 \times z_{\alpha}$, where $z_{\alpha}$ is the upper $\alpha$ quantile of the standard normal distribution.
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
bandtest.stat(x = sonar.r , k = 10)
bandtest.stat(x = sonar.r , k = 20)
\dontshow{##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, k) 
{
    if (typeof(x) != "double") {
        stop("X must be numeric")
    }
    M <- c(nrow(x), ncol(x))
    ts <- M[1] * (sscov(x)/ssbandcov(x, k) - 1)
    ts
  }
}
}