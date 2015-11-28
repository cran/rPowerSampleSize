\name{global.1m.ssc}
\alias{global.1m.ssc}


\title{
Sample Size Computation Based on a Global Procedure in the Context of Multiple Continuous Endpoints
}
\description{
This function computes the sample size with a global method in the
context of \eqn{m} multiple continuous endpoints. Two groups are
considered: \eqn{C} for control and \eqn{T} for treatment. The clinical aim
is to be able to detect a mean difference between the test and the control product
for at least one endpoint among \eqn{m}. This method is based on a
multivariate model with co-variates taking into account
the correlations between the endpoints.
}
\usage{
global.1m.ssc(method, mean.diff, sd, cor, v = NULL, M = NULL, 
power = 0.8, alpha = 0.05)
}

\arguments{

  \item{method}{either "Model" if no co-variates are involved and "Adj.Model" for a model with co-variates.}


  \item{mean.diff}{vector of the mean differences of the \code{m}
    endpoints between both groups under the alternative hypothesis.}

  \item{sd}{vector of the standard deviations of the \code{m}
  endpoints. These are assumed identical for both groups.}

  \item{cor}{correlation matrix between the endpoints. These are assumed identical for both groups.}

  \item{v}{\eqn{v} is a \eqn{p\times1} vector whose \eqn{l^{th}}
  component is \eqn{v_{l}=\bar{a}_{l}^C-\bar{a}_l^T}, where \eqn{p} is
  the number of adjustment variables, and \eqn{\bar{a}_{l}^{i}} is the
  mean of the adjustment variable \eqn{a_{l}} for the group \eqn{i},
  \eqn{i = C, T}.} 

  \item{M}{\eqn{M} is a \eqn{p\times p} matrix with general term \eqn{M_{l,l'}=\left(\overline{a_la_{l'}}^C-\bar{a}_l^C\bar{a}_{l'}^C\right)+\left(\overline{a_{l}a_{l'}}^T-\bar{a}_l^T\bar{a}_{l'}^T\right)}.}

  \item{power}{value which corresponds to the chosen power.
}

  \item{alpha}{value which correponds to the chosen Type-I error rate bound.
}

}

\value{
\item{Sample size}{The required sample size.}
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
\code{\link{global.1m.analysis}},
\code{\link{indiv.1m.ssc}},
\code{\link{indiv.1m.analysis}},
\code{\link{bonferroni.1m.ssc}}
}
\examples{
# Sample size computation for the global method 
global.1m.ssc(method = "Adj.Model", mean.diff = c(0.1, 0.2, 0.3), sd =
c(1, 1, 1), cor = diag(1, 3), v = -0.2, M = 0.46)

# Table 2 in our 2014 paper:
Sigma2 <- matrix(c(5.58, 2, 1.24, 2, 4.29, 1.59, 1.24, 1.59, 4.09), ncol = 3)
sd2 <- sqrt(diag(Sigma2))
cor2 <- diag(1 / sd2) \%*\% Sigma2 \%*\% diag(1 / sd2)
mu2 <- c(0.35, 0.28, 0.46)
m <- 3
global.1m.ssc(method = "Model", mean.diff = mu2, sd = sd2, cor = cor2)
}

\keyword{package}
\keyword{multivariate models}
\keyword{multiple testing}
\keyword{sample size computation}
