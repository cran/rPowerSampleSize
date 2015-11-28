\name{indiv.1m.analysis}
\alias{indiv.1m.analysis}
\alias{fwer}
\alias{test.indiv}

\title{
Data analysis with an individual testing procedure in the context of multiple continuous endpoints
}
\description{
This function aims at analysing some multiple continuous endpoints with
an individual testing procedure. This method, based on
Union-Intersection test procedure, allows one to take into account
the correlations between the different endpoints in the analysis.
}
\usage{
indiv.1m.analysis(method, XC, XT, varX = NULL, alpha = 0.05,
alternative = "two.sided", n = NULL)
}

\arguments{

 \item{method}{description of the covariance matrix estimation. Two
   choices are possible: "Unknown" (normality assumption and unknown
   covariance matrix) and "Asympt" (asymptotic context).}

  \item{XC}{matrix of the outcomes for the control group.}

  \item{XT}{matrix of the outcomes for the test group.}

  \item{varX}{covariance matrix. Should be provided when 'method' = 'Known'.}

  \item{alpha}{value which correponds to the chosen Type-I error rate bound.}

  \item{alternative}{character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less".}

  \item{n}{NULL. Sample size of a group, computed from \code{XC}.}
}

\value{
\item{UnAdjPvalue}{unadjusted p-values.}
\item{AdjPvalue}{corrected p-values.}
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
\code{\link{global.1m.analysis}},
\code{\link{bonferroni.1m.ssc}}
}
\examples{
# Calling the data
data(data.sim)

# Data analysis for the individual method
n <- nrow(data) / 2 

XC <- data[1:n, 1:3]
XT <- data[(n + 1):(2 * n), 1:3]

indiv.1m.analysis(method = "UnKnown", XC = XC, XT = XT)
}
\keyword{package}
\keyword{individual procedure}
\keyword{multiple testing}
\keyword{data analysis}

