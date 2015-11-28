\name{df.compute}
\alias{df.compute}

\title{
Computation of degrees of freedom.
}
\description{
This function computes the degrees of freedom.
}
\usage{
df.compute(nE, nC, SigmaE = NULL, SigmaC = NULL, matrix.type = NULL,
equalSigmas = NULL, m = NULL)
}

\arguments{
  \item{nE}{Sample size for the experimental (test) group.}

  \item{nC}{Sample size for the control group.}

  \item{SigmaE}{NULL or a matrix indicating the covariances between the
  primary endpoints in the experimental (test) group. See Details.}

  \item{SigmaC}{NULL or a matrix indicating the covariances between the
    primary endpoints in the control group. See Details.}

  \item{matrix.type}{NULL or an integer among 1, 2, 3, 4, giving the
    type of the matrices 'SigmaE' and 'SigmaC'. See Details.}

  \item{equalSigmas}{NULL or a logical indicating if 'SigmaC' and
  'SigmaE' are equal. See Details.}

  \item{m}{NULL or the value for \code{m}. See Details.}

}

\details{
You should provide either both \code{SigmaE}, \code{SigmaC} or both
\code{matrix.type}, \code{equalSigmas}. When you provide the former, the
latter should be set to NULL. And vice versa. 
  }

\value{
\item{df}{The degrees of freedom.}
}

\references{
Delorme P., Lafaye de Micheaux P., Liquet B., Riou, J. (2015). Type-II Generalized Family-Wise Error Rate
Formulas with Application to Sample Size Determination. \emph{Statistics in Medicine.} 
Romano J. and Shaikh A. (2006) Stepup Procedures For Control of
Generalizations of the Familywise Error Rate. \emph{The Annals of Statistics},
34(4), 1850--1873.
}
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
# standard deviation of the treatment effect
var <- c(0.3520^2,0.6219^2,0.5427^2,0.6075^2,0.6277^2,0.5527^2,0.8066^2)

# Correlation matrix 
cov <- matrix(1,ncol=7,nrow=7)
cov[1,2:7] <- cov[2:7,1] <- c(0.1341692,0.1373891,0.07480123,0.1401267,0.1280336,0.1614103)
cov[2,3:7] <- cov[3:7,2] <- c(0.2874531,0.18451960,0.3156895,0.2954996,0.3963837)
cov[3,4:7] <- cov[4:7,3] <- c(0.19903400,0.2736123,0.2369907,0.3423579)
cov[4,5:7] <- cov[5:7,4] <- c(0.1915028,0.1558958,0.2376056)
cov[5,6:7] <- cov[6:7,5] <- c(0.2642217,0.3969920)
cov[6,7] <- cov[7,6] <- c(0.3352029)

# Covariance matrix
diag(cov) <- var

df.compute(SigmaE = cov, SigmaC = cov, nE = 20, nC = 30)

}
}

\keyword{package}
\keyword{Holm Procedure}
\keyword{r power}
\keyword{multiple testing}
\keyword{sample size computation}
