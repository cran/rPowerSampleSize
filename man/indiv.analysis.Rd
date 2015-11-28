\name{indiv.analysis}
\alias{indiv.analysis}

\title{
Data analysis using an individual testing procedure controlling the
q-gFWER in the context of \eqn{m} multiple continuous endpoints
}
\description{
This function aims at analysing some multiple continuous endpoints with
individual testing procedures (Bonferroni, Holm, Hochberg). These procedures, based on a Union-Intersection test procedure, allow to take into account
the correlation between the different endpoints in the analysis. This
function uses critical values from Romano et al. to control the
q-gFWER. Different structures of the covariance matrices between
endpoints are considered.
}
\usage{
indiv.analysis(method, XE, XC, d, matrix.type, equalSigmas, alpha =
0.05, q = 1, rho = NULL, alternative = "greater", orig.Hochberg = FALSE)
}

\arguments{

  \item{method}{"Bonferroni", "Holm" or "Hochberg". When \code{method =
  "Hochberg"}, we use critical values involving the D1 term in formula
  (11) of Romano et al. in order to control strongly the \eqn{q}-FWER.
  If you want to use the original Hochberg's
  procedure, set \code{orig.Hochberg} to \code{TRUE}. Even for
  \eqn{q=1}, this is a bad idea except when the p-values can be assumed independent.}

  \item{XE}{matrix (of size \eqn{n_E \times m}) of the outcome for the experimental (test) group.}

  \item{XC}{matrix (of size \eqn{n_C \times m}) of the outcome for the control group.}

  \item{d}{vector of length \code{m} indicating the true value of the differences in means
  under the null hypothesis.}

  \item{matrix.type}{integer value equal to 1, 2, 3, 4 or 5. A value of 1
  indicates multisample sphericity. A value of 2 indicates multisample
  variance components. A value of 3 indicates multisample compound
  symmetry. A value of 4 indicates multisample compound
  symmetry with unequal individual (endpoints) variances. A value of 5 indicates unstructured variance components.}

  \item{equalSigmas}{logical. Indicates if \eqn{\Sigma_E} is equal to \eqn{\Sigma_C}.}

  \item{alpha}{value which corresponds to the chosen q-gFWER type-I
  error rate control bound.}

  \item{q}{integer. Value of 'q' (q=1,...,m) in the q-gFWER of Romano et
  al., which is the probability to make at least \code{q} false
  rejections. The default value \code{q=1} corresponds to the classical FWER control.}

  \item{rho}{NULL or should be provided only if \code{matrix.type} is equal
  to 3 or 4. This is the value of correlation for the compound symmetry case.}

  \item{alternative}{NOT USED YET. Character string specifying the
  alternative hypothesis, must be one of "two.sided", "greater" or
  "less".}

\item{orig.Hochberg}{logical. To use the standard Hochberg's procedure.}

}

\value{list(stat = statvec, pvals = pvals, AdjPvals = pvals.adj, sig2hat = varhatvec)
\item{stat}{individual test statistic values.}
\item{pvals}{non corrected p-values.}
\item{pvals.adj}{corrected p-values.}
\item{sig2hat}{estimated variance (i.e., square of denominator of the test statistic.}
}
\references{
Delorme P., Lafaye de Micheaux P., Liquet B., Riou, J. (2015). Type-II Generalized Family-Wise Error Rate
Formulas with Application to Sample Size Determination. Submitted to
\emph{Statistics in Medicine.}

Romano J. and Shaikh A. (2006) Stepup Procedures For Control of
Generalizations of the Familywise Error Rate. \emph{The Annals of Statistics},
34(4), 1850--1873.
}
\author{
P. Lafaye de Micheaux, B. Liquet and J. Riou
}

\seealso{
\code{\link{indiv.rm.ssc}},
}
\keyword{package}
\keyword{individual procedure}
\keyword{multiple testing}
\keyword{data analysis}

