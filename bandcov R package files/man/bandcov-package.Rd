\name{bandcov-package}
\alias{bandcov-package}
\alias{bandcov}
\docType{package}
\title{
\packageTitle{bandcov}
}
\description{
\packageDescription{bandcov}
}
\details{
Note that this package assumes that data matrices contain observations on the rows and variables on the columns.
}
\author{
\packageAuthor{bandcov}

Maintainer: \packageMaintainer{bandcov}
}
\references{
Qiu, Y. and Chen, S. X. (2015) \emph{Journal of the American Statistical Association}. \bold{110.511}, 1160--1174.

Qiu, Y. and Chen, S. X. (2012) \emph{The Annals of Statistics}. \bold{40.3}, 1285--1314.

Chen, S.X., Zhang, L., and Zhong, P. (2010) \emph{Journal of the American Statistical Association}. \bold{105.490}, 810--819.
}


\examples{
bandtest.stat(x = sonar.r , k = 10)
bandloss(x = sonar.r , K = 10)
tapeloss(x = sonar.r , K = 10)
bandmin(x = sonar.r , K = 10)
tapemin(x = sonar.r , K = 10)
btplot(x = sonar.r , K = 10 , plot = "S")
}
