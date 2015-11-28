\name{indiv.1m.ssc}
\alias{indiv.1m.ssc}
\alias{asympt.ssc}
\alias{known.ssc}
\alias{unknown.ssc}

\title{
Sample size computation with an individual testing procedure in the context of multiple continuous endpoints
}
\description{
This function computes the sample size with an individual testing procedure in the
context of multiple continuous endpoints. This method, based on the
Union-Intersection testing procedure, allows one to take into account
the correlation between the different endpoints in the computation of the sample size.
}
\usage{
indiv.1m.ssc(method, ES, cor, power = 0.8, alpha = 0.05, alternative =
"two.sided", tol = 1e-04, maxiter = 1000, tol.uniroot = 1e-04)
}

\arguments{

  \item{method}{description of the covariance matrix estimation. Two
   choices are possible: "Unknown" (normality assumption and unknown
   covariance matrix) and "Asympt" (asymptotic context).
}

    \item{ES}{vector indicating the values of the effect size. The definition of the effect size is presented in the "Details" section.
}
  
  \item{cor}{matrix indicating the correlation matrix between the endpoints.
}

  \item{power}{value which corresponds to the chosen power.
}

  \item{alpha}{value which correponds to the chosen Type-I error rate bound.
}

  \item{alternative}{character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less".}

  \item{tol}{the desired accuracy (convergence tolerance) for our algorithm.}

  \item{maxiter}{maximum number of iterations.}

  \item{tol.uniroot}{desired accuracy (convergence tolerance) for the
  \code{uniroot.integer} function.}

}
\details{
\code{ES}: The effect size definition parameter for the \eqn{k^{th}} endpoint is defined as \eqn{\frac{\mu^{T}_{k}-\mu^{C}_{k}}{\sigma^{*}_{k}}}, where \eqn{\sigma^{*}_{k}} refers to the standard deviation
of the population from which the different treatment groups were taken
and \eqn{\mu^{T}_{k}-\mu^{C}_{k}} is the true mean difference between the test and the control group for the \eqn{k^{th}} group. We consider that: \eqn{\sigma^{*}_{k}=\frac{\sigma^{2}_{k,T}+\sigma^{2}_{k,C}}{2}}.
}
\value{
\item{Adjusted Type-I error rate}{adjusted Type-I error rate.}

\item{Sample size}{the required sample size.}
}
\references{
Lafaye de Micheaux P., Liquet B., Marque S., Riou J. (2014). Power and
Sample Size Determination in Clinical Trials With Multiple Primary
Continuous Correlated Endpoints, \emph{Journal of
  Biopharmaceutical Statistics}, 24, 378--397.
}
\author{
P. Lafaye de Micheaux, B .Liquet and J .Riou
}

\seealso{
\code{\link{global.1m.ssc}},
\code{\link{global.1m.analysis}},
\code{\link{indiv.1m.analysis}},
\code{\link{bonferroni.1m.ssc}}
}
\examples{
# Sample size computation for the individual method
indiv.1m.ssc(method = "Known", ES = c(0.1, 0.2, 0.3), cor = diag(1, 3))

# Table 2 in our 2014 paper:
Sigma2 <- matrix(c(5.58, 2, 1.24, 2, 4.29, 1.59, 1.24, 1.59, 4.09), ncol = 3)
sd2 <- sqrt(diag(Sigma2))
cor2 <- diag(1 / sd2) \%*\% Sigma2 \%*\% diag(1 / sd2)
mu2 <- c(0.35, 0.28, 0.46)
m <- 3
indiv.1m.ssc(method = "Known", ES = mu2 / sd2, cor = cor2)
}
\keyword{package}
\keyword{multiple testing}
\keyword{individual procedure}
\keyword{sample size computation}
