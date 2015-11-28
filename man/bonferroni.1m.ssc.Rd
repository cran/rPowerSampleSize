\name{bonferroni.1m.ssc}
\alias{bonferroni.1m.ssc}


\title{
Sample Size Computation with Single Step Bonferroni Method in the Context of Multiple Continuous Endpoints.
}
\description{
This function computes the sample size for an analysis of multiple test with a single step Bonferroni procedure.
}
\usage{
bonferroni.1m.ssc(mean.diff, sd, cor, power = 0.8, alpha = 0.05,
alternative = "two.sided")
}

\arguments{

  \item{mean.diff}{vector of the mean differences of the \code{m}
    endpoints between both groups under the alternative hypothesis.}

  \item{sd}{vector of the standard deviations of the \code{m}
  endpoints. These are assumed identical for both groups.
}

  \item{cor}{correlation matrix between the endpoints. These are assumed identical for both groups.}
  
   \item{power}{value which corresponds to the chosen power.
}

  \item{alpha}{value which correponds to the chosen Type-I error rate bound.
}

  \item{alternative}{character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less".}

}

\value{
\item{Sample size}{The required sample size.}
}
\references{
Lafaye de Micheaux P., Liquet B., Marque S., Riou J. (2014). Power and
Sample Size Determination in Clinical Trials With Multiple Primary
Continuous Correlated Endpoints, \emph{Journal of
  Biopharmaceutical Statistics}, 24, 378--397.
Adcock, C. J. (2007). Sample size determination: a review.
\emph{Journal of the Royal Statistical Society: Series D (The Statistician)}, 46:261-283. }

\author{
P. Lafaye de Micheaux, B. Liquet and J. Riou
}

\seealso{
\code{\link{global.1m.analysis}},
\code{\link{indiv.1m.ssc}},
\code{\link{indiv.1m.analysis}},
\code{\link{global.1m.ssc}}
}
\examples{
\dontrun{
# Sample size computation for the global method
bonferroni.1m.ssc(mean.diff = c(0.1, 0.2, 0.3), sd = c(1, 1,1 ), cor =
diag(1, 3))
}
}

\keyword{package}
\keyword{Bonferroni Procedure}
\keyword{multiple testing}
\keyword{sample size computation}