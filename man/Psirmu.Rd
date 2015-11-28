\name{Psirmu}
\alias{Psirmu}

\title{
Computation of power for step-up (Hochberg) procedure.
}
\description{
This function computes the power for an analysis of m multiple tests
with a control of the q-gFWER with the Hochberg procedure.
}
\usage{
Psirmu(r, m, p = m, nE, nCovernE = 1, delta, SigmaC, SigmaE,
alpha = 0.05, q = 1, asympt = FALSE,
maxpts = 25000, abseps = 0.001, releps = 0, nbcores = 1, LB = FALSE,
orig.Hochberg = FALSE)
}

\arguments{
  \item{r}{integer, r = 1, ..., m. Desired number of endpoints to be declared significant.}

  \item{m}{integer. Number of endpoints.}

  \item{p}{integer, p = 1, ..., m. Indicates the number of false null hypotheses.}

  \item{nE}{integer. Sample size for the experimental (test) group.}

  \item{nCovernE}{Ratio of \code{nC} over \code{nE}.}

  \item{delta}{vector of length \code{m} equal to \code{muE - muC - d}.}

  \item{SigmaC}{matrix giving the covariances between the \code{m} primary endpoints in the control group.}

  \item{SigmaE}{matrix giving the covariances between the \code{m} primary
  endpoints in the experimental (test) group.}

  \item{alpha}{a value which corresponds to the chosen q-gFWER type-I control bound.}

  \item{q}{integer. Value of 'q' (q=1,...,m) in the q-gFWER of Romano et
  al., which is the probability to make at least \code{q} false
  rejections. The default value \code{q=1} corresponds to the classical FWER control.}
     
  \item{asympt}{logical. \code{TRUE} for the use of the asymptotic approximation by a
  multivariate normal distribution or \code{FALSE} for the multivariate
  Student distribution.}

  \item{maxpts}{convergence parameter used in the \code{GenzBretz}
  function. A suggested choice is \code{min(25000 * true.complexity, .Machine$integer.max)}
  where \code{true.complexity} is computed with the \code{complexity} function. But note that this might considerably increase the
  computation time!}

  \item{abseps}{convergence parameter used in the \code{GenzBretz}
  function. A suggested choice is \code{max(0.001 / true.complexity, 1e-08)}
  where \code{true.complexity} is computed with the \code{complexity} function. But note that this might considerably increase the
  computation time!}

  \item{releps}{relative error tolerance as double used in the
    \code{GenzBretz} function.}

  \item{nbcores}{integer. Number of cores to use for parallel computations.}

  \item{LB}{logical. Should we use a load balancing parallel computation.}

\item{orig.Hochberg}{logical. To use the standard Hochberg's procedure.}
}

\note{
Note that we use critical values involving the D1 term in formula
  (11) of Romano et al. in order to control strongly the \eqn{q}-FWER.
  If you want to use the original Hochberg's
  procedure, set \code{orig.Hochberg} to \code{TRUE}. Even for
  \eqn{q=1}, this is a bad idea except when the p-values can be assumed
  independent.

  Results can differ from one time to another because the results of the
function \code{pmvt} are random.  If this is the case, you should
consider increasing \code{maxpts} and decreasing \code{abseps}.
  }

\value{List with two components:
    \item{pow}{The computed power.}
    \item{error}{The sum of the absolute estimated errors for each call
    to the \code{pmvt} (or \code{pmvnorm}) function. The number of such
    calls is given (in the non exchangeable case) by the function \code{complexity}. Note that in the
    exchangeable case, some probabilities are weighted. So an error
    committed on such a probability is also inflated with the same weight. Note also that this global error does not take into account
    the signs of the individual errors and is thus most certainly higher
    than the true error. In other words, you are 99 percent sure that
    the true power is between 'pow' - 'error' and 'pow' + 'error', but
    it is also probably much closer to 'pow', particularly if the
    complexity is large.}
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
\keyword{Hochberg Procedure}
\keyword{r power}
\keyword{multiple testing}
\keyword{sample size computation}
