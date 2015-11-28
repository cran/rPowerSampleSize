\name{matrix.type.compute}
\alias{matrix.type.compute}

\title{
Computation of matrix type
}
\description{
This function determines the type of matrix structure of \eqn{\Sigma_E}
and \eqn{\Sigma_C}, which can be multisample
sphericity (type 1), multisample variance components (type 2), multisample compound
  symmetry (type 3) or unstructured variance components (type 4).}
\usage{
matrix.type.compute(SigmaE, SigmaC, display.type = FALSE)
}

\arguments{
  \item{SigmaE}{matrix giving the covariances between the
    \code{m} primary endpoints in the experimental (test) group.}

  \item{SigmaC}{matrix giving the covariances between the \code{m} primary endpoints in the control group.}

  \item{display.type}{Logical. Should we display the (name of) type of
    the matrices.}
}

\value{
Integer indicating the structure of the matrices: 1 if both are of type
1, 2 if both are of type 2, 3 if both are of type 3 or 4 if one of them
is of type 4. 
}

\author{
P. Lafaye de Micheaux, B. Liquet and J. Riou
}

\seealso{
\code{\link{indiv.analysis}},
}
\examples{
\dontrun{
# Variances of the m endpoints
var <- c(0.3520, 0.6219, 0.5427, 0.6075, 0.6277,
0.5527, 0.8066) ^ 2

# Covariance matrix
cov <- matrix(1, ncol = 7, nrow = 7)
 cov[1, 2:7] <- cov[2:7, 1] <- c(0.1341692, 0.1373891, 0.07480123,
0.1401267, 0.1280336, 0.1614103)
cov[2, 3:7] <- cov[3:7, 2] <- c(0.2874531, 0.18451960, 0.3156895,
0.2954996, 0.3963837)
cov[3, 4:7] <- cov[4:7, 3] <- c(0.19903400, 0.2736123, 0.2369907, 0.3423579)
cov[4, 5:7] <- cov[5:7, 4] <- c(0.1915028, 0.1558958, 0.2376056)
cov[5, 6:7] <- cov[6:7, 5] <- c(0.2642217, 0.3969920)
cov[6, 7] <- cov[7, 6] <- 0.3352029
diag(cov) <- var

matrix.type.compute(SigmaE = cov, SigmaC = cov, display = TRUE)
}
}

\keyword{package}
\keyword{Holm Procedure}
\keyword{r power}
\keyword{multiple testing}
\keyword{sample size computation}
