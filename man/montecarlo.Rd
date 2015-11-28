\name{montecarlo}
\alias{montecarlo}

\title{
Monte carlo computation of power.
}
\description{
This function approximates the power for a given sample size using a Monte
Carlo simulation.
}
\usage{
montecarlo(method, M = 100000, nE, r, m, nCovernE = 1, muC,
muE, d = rep(0.0, m), SigmaE, SigmaC, alpha =
0.05, q = 1, nbcores = parallel::detectCores() - 1, alternative =
"greater",
orig.Hochberg = FALSE)
}

\arguments{
  \item{method}{"Bonferroni", "Holm" or "Hochberg".  When \code{method =
  "Hochberg"}, we use critical values involving the D1 term in formula
  (11) of Romano et al. in order to control strongly the \eqn{q}-FWER.
  If you want to use the original Hochberg's
  procedure, set \code{orig.Hochberg} to \code{TRUE}. Even for
  \eqn{q=1}, this is a bad idea except when the p-values can be assumed independent.}

  \item{M}{number of Monte Carlo repetitions. Dmitrienko et al. (2013)
  suggested to take \code{M = 10 ^ 5}.}

  \item{nE}{integer. Sample size for the experimental (test) group.}

  \item{r}{integer, r = 1, ..., m. Desired number of endpoints to be declared significant.}

  \item{m}{integer. Number of endpoints.}

  \item{nCovernE}{ratio of \code{nC} over \code{nE}.}

  \item{muC}{vector of length \code{m} of the true means of the control
  group for all endpoints under the alternative hypothesis.}

  \item{muE}{vector of length \code{m} of the true means of the experimental (test) group for all endpoints under the alternative hypothesis.}

  \item{d}{vector of length \code{m} indicating the true value of the differences in means
  under the null hypothesis.}

  \item{SigmaE}{matrix indicating the covariances between the \code{m} 
  primary endpoints in the experimental (test) group. See Details.}

  \item{SigmaC}{matrix indicating the covariances between the \code{m} 
    primary endpoints in the control group. See Details.}

  \item{alpha}{a value which corresponds to the chosen q-gFWER type-I control bound.}

  \item{q}{integer. Value of 'q' (q = 1, ..., m) in the q-gFWER of Romano et
  al., which is the probability to make at least \code{q} false
  rejections. The default value \code{q=1} corresponds to the classical FWER control.}

  \item{nbcores}{number of cores to use for the computations.}

  \item{alternative}{NOT USED YET. Character string specifying the alternative hypothesis, must be one of "two.sided", "greater" or "less".}

 \item{orig.Hochberg}{logical. To use the standard Hochberg's procedure.}
}


\value{
\item{rpowBonf or rpowHoch or rpowHolm}{List with one element giving the computed power.}
}

\references{
Delorme P., Lafaye de Micheaux P., Liquet B., Riou, J. (2015). Type-II Generalized Family-Wise Error Rate
Formulas with Application to Sample Size Determination. Submitted to \emph{Statistics
  in Medicine.} 

Romano J. and Shaikh A. (2006) Stepup Procedures For Control of
Generalizations of the Familywise Error Rate. \emph{The Annals of Statistics},
34(4), 1850--1873.
}
\author{
P. Lafaye de Micheaux, B. Liquet and J. Riou
}

\seealso{
\code{\link{indiv.analysis}},
}

\keyword{package}
\keyword{Holm Procedure}
\keyword{r power}
\keyword{multiple testing}
\keyword{sample size computation}
