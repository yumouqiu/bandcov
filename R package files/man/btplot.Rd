\name{btplot}
\alias{btplot}

\title{
Plotting Results from Package \code{bandcov}
}
\description{
\code{btplot} returns one of three different plots. The first plots the output of \code{bandpen2}, the second plots the output of \code{bandloss}, and the third plots the output of \code{tapeloss}. 
}
\usage{
btplot(x, K, plot = "S")
}

\arguments{
  \item{x}{
the data matrix. Must be \code{numeric}.
}
  \item{K}{
the maximum bandwidth to evaluate for the \code{bandpen2} and \code{bandloss} plots. In the case of the \code{tapeloss} plot, \code{floor(K/2)} is the maximum bandwidth evaluated.
}
  \item{plot}{
  specifies the plot desired. "S" returns the plot for \code{bandpen2}, "B" returns the plot for \code{bandloss}, and "T" returns the plot for \code{tapeloss}. Defaults to "S".
}
}

\value{
\code{btplot} outputs a plot.
}
\references{
Qiu, Y. and Chen, S. X. (2015) \emph{Journal of the American Statistical Association}. \bold{110.511}, 1160--1174.

Qiu, Y. and Chen, S. X. (2012) \emph{The Annals of Statistics}. \bold{40.3}, 1285--1314.

Chen, S.X., Zhang, L., and Zhong, P. (2010) \emph{Journal of the American Statistical Association}. \bold{105.490}, 810--819.
}

\author{
Jason Adams
}

\examples{
btplot(x = sonar.r , K = 10 , plot = "S")
btplot(x = sonar.r , K = 10 , plot = "B")
btplot(x = sonar.r , K = 10 , plot = "T")


\dontshow{##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, K, plot = "S") 
{
    K.vec <- 0:K
    adt <- sscov(x)
    tempres <- bandpen(x, K)
    res.b <- rep(0, times = K + 1)
    res.t <- rep(0, times = floor(K/2) + 1)
    if (plot == "B" || plot == "Band" || plot == "Bandloss") {
        band.plot <- .C("bandloss", as.integer(nrow(x)), as.integer(ncol(x)), 
            as.integer(K), as.double(adt), as.double(tempres), 
            as.double(res.b))[[6]]
        plot(x = K.vec, y = band.plot, xlab = "Bandwidth", ylab = "Loss", 
            main = "Banding Loss")
        lines(K.vec[order(K.vec)], band.plot[order(K.vec)], xlim = range(K.vec), 
            ylim = range(band.plot))
    }
    if (plot == "T" || plot == "Tape" || plot == "Tapeloss") {
        f <- floor(K/2)
        K.vech <- 0:f
        tape.plot <- .C("tapeloss", as.integer(nrow(x)), as.integer(ncol(x)), 
            as.integer(K), as.double(adt), as.double(tempres), 
            as.double(res.t))[[6]]
        plot(x = K.vech, y = tape.plot, xlab = "Bandwidth", ylab = "Loss", 
            main = "Tapering Loss")
        lines(K.vech[order(K.vech)], tape.plot[order(K.vech)], 
            xlim = range(K.vech), ylim = range(tape.plot))
    }
    if (plot == "S" || plot == "SS" || plot == "Squares") {
        ss.plot <- c()
        for (i in K.vec) {
            ss.plot[i + 1] <- as.numeric(.C("sbandpen2call", 
                as.double(x), as.integer(nrow(x)), as.integer(ncol(x)), 
                as.integer(i), as.double(0))[5])
        }
        plot(x = K.vec, y = ss.plot, xlab = "Bandwidth", ylab = "Sum of Squares", 
            main = "Sum of Squares for Off Diagonal")
        lines(K.vec[order(K.vec)], ss.plot[order(K.vec)], xlim = range(K.vec), 
            ylim = range(ss.plot))
    }
  }
}
}
