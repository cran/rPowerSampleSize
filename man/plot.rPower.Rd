\name{plot.rPower}
\alias{plot.rPower}

\title{
Plot of an rPower object
}
\description{
For an \code{rPower} object which has been produced by \code{\link{montecarlo}}, this function plots the distribution (estimated by Monte-Carlo) of the number of significant results (i.e, the realized values \eqn{r}).
}

\usage{
\method{plot}{rPower}(x, \dots)
}
\arguments{
  \item{x}{
The name of an object of class \code{rPower}.
}
 \item{\dots}{Some methods for this generic require additional arguments. None are used in this method.}
}


\value{
Returns graphs.
}

\author{
P. Lafaye de Micheaux, B. Liquet and J. Riou
}

\references{
Delorme P., Lafaye de Micheaux P., Liquet B., Riou, J. (2015). Type-II Generalized Family-Wise Error Rate
Formulas with Application to Sample Size Determination. Submitted to \emph{Statistics
  in Medicine.} }

\seealso{
\code{\link{montecarlo}}
}


