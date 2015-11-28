\name{complexity}
\alias{complexity}

\title{
Computation of the complexity of the numerical computations.
}
\description{
This function computes the complexity of our formulas.
}
\usage{
complexity(method, exchangeable, r, p, display = TRUE)
}

\arguments{
  \item{method}{"Bonferroni", "Hochberg" or "Holm".}

  \item{exchangeable}{Logical indicating if we are in the exchangeable
  case or not.}

  \item{r}{integer, r = 1, ..., m. Desired number of endpoints to be declared significant.}

  \item{p}{integer, p = 1, ..., m. Indicates the number of false null hypotheses.}

  \item{display}{Logical. Should we display the complexity.}
}


\value{
Complexity of the formulas (i.e., number of individual probabilities
computed using the function \code{pmvt} (or \code{pmvnorm}) in the non
exchangeable case).
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



\keyword{package}
\keyword{Holm Procedure}
\keyword{r power}
\keyword{multiple testing}
\keyword{sample size computation}
