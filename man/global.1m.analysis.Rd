\name{global.1m.analysis}
\alias{global.1m.analysis}

\title{Data analysis with a global method in the context of multiple continuous endpoints}

\description{
This function aims at analysing \eqn{m} multiple continuous endpoints with a global procedure. The clinical aim
is to be able to detect a mean difference between the test \eqn{T} and
the control \eqn{C} product for at least one endpoint among \eqn{m}. This method is based on a multivariate model taking into account
the correlations between the \eqn{m} endpoints and possibly some adjustment variables. The result gives only a global decision.}
\usage{
global.1m.analysis(XC, XT, A, alpha = 0.05, n = NULL)
}
\arguments{
  \item{XC}{matrix of the outcome for the control group.}

  \item{XT}{matrix of the outcome for the test group.}

  \item{A}{matrix of the adjustment variables.}
  
  \item{n}{sample size of a group. The sample size needs to be the same for each group.}

  \item{alpha}{value which corresponds to the chosen Type-I error rate bound.}
}

\value{
\item{Pvalue}{the p-value of the global test.}
}
\references{
Lafaye de Micheaux P., Liquet B., Marque S., Riou J. (2014). Power and
Sample Size Determination in Clinical Trials With Multiple Primary
Continuous Correlated Endpoints, \emph{Journal of
  Biopharmaceutical Statistics}, 24, 378--397.
}

\author{
P. Lafaye de Micheaux, B. Liquet and J. Riou
}

\seealso{
\code{\link{global.1m.ssc}},
\code{\link{indiv.1m.ssc}},
\code{\link{indiv.1m.analysis}},
\code{\link{bonferroni.1m.ssc}}
}
\examples{
# Calling the data
data(data.sim)

# Data analysis for the global method
n <- nrow(data) / 2

XC <- data[1:n, 1:3]
XT <- data[(n + 1):(2 * n), 1:3]

global.1m.analysis(XC = XC, XT = XT, A = data[, 5])
}

\keyword{package}
\keyword{multivariate models}
\keyword{multiple testing}
\keyword{data analysis}
