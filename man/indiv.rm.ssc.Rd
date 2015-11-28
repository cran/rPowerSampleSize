\name{indiv.rm.ssc}
\alias{indiv.rm.ssc}

\title{
Sample size determination in the context of multiple continuous
endpoints with a control of the q-gFWER, for a given value of r-power
(generalized disjunctive power).
}
\description{
This function computes the sample size for an analysis of \code{m} multiple tests with a control of the q-gFWER.
}
\usage{
indiv.rm.ssc(method, asympt = FALSE, r, m, p = m, nCovernE = 1,
muC = NULL, muE = NULL, d = NULL, delta = NULL, SigmaC = NULL,
SigmaE = NULL, power = 0.8, alpha = 0.05, interval = c(2, 2000), q = 1,
maxpts = 25000, abseps = 0.001, releps = 0, nbcores = 1, LB = FALSE,
orig.Hochberg = FALSE)
}

\arguments{
  \item{method}{"Bonferroni", "Hochberg" or "Holm".  When \code{method = 
  "Hochberg"}, we use critical values involving the D1 term in formula
  (11) of Romano et al. in order to control strongly the \eqn{q}-FWER.
  If you want to use the original Hochberg's
  procedure, set \code{orig.Hochberg} to \code{TRUE}. Even for
  \eqn{q=1}, this is a bad idea except when the p-values can be assumed independent.}
  
  \item{asympt}{logical. \code{TRUE} for the use of the asymptotic approximation by a
  multivariate normal distribution or \code{FALSE} for the multivariate Student distribution.}

  \item{r}{integer, r = 1, ..., m. Desired number of endpoints to be declared significant.}

  \item{m}{integer. Number of endpoints.}

  \item{p}{integer, p = 1, ..., m. Indicates the number of false null hypotheses.}

  \item{nCovernE}{ratio of \code{nC} over \code{nE}.}

  \item{muC}{\code{NULL} or a vector of length \code{m} of the true means of the control
  group for all endpoints under the alternative hypothesis. If \code{muC}, \code{muE} and \code{d} are \code{NULL}, then \code{delta} should
  be provided instead.}

  \item{muE}{\code{NULL} or a vector of length \code{m} of the true means of the experimental (test) group for all endpoints under the alternative hypothesis.}

  \item{d}{\code{NULL} or a a vector of length \code{m} indicating the true value of the differences in means
  under the null hypothesis.}

  \item{delta}{should be \code{NULL} if \code{muC}, \code{muE} and
  \code{d} are provided. If not, it is equal to \code{muE - muC - d} and
  these parameters should be set to \code{NULL}.}

  \item{SigmaC}{matrix giving the covariances between the \code{m} primary endpoints in the control group.}

  \item{SigmaE}{matrix giving the covariances between the \code{m} primary
  endpoints in the experimental (test) group.}

   \item{power}{a value which correponds to the chosen r-power.}

  \item{alpha}{a value which corresponds to the chosen q-gFWER type-I control bound.}

  \item{interval}{an interval of values in which to search for the sample size. Left
  endpoint should be greater than or equal to 2.}
  
  \item{q}{integer. Value of 'q' (q=1,...,m) in the q-gFWER of Romano et
  al., which is the probability to make at least \code{q} false
  rejections. The default value \code{q=1} corresponds to the classical FWER control.}

  \item{maxpts}{convergence parameter used in the \code{GenzBretz}
    function. A good choice is
    \code{min(25000 * 10 ^ true.complexity, .Machine$integer.max)}
  where \code{true.complexity} is computed with the \code{complexity}
  function. But note that this might considerably increase the
  computation time!}

  \item{abseps}{convergence parameter used in the \code{GenzBretz}
    function. A good choice is
    \code{max(0.001 / true.complexity, 1e-08)}
  where \code{true.complexity} is computed with the \code{complexity}
  function. But note that this might considerably increase the
  computation time!}

  \item{releps}{relative error tolerance as double used in the
    \code{GenzBretz} function.}

  \item{nbcores}{integer. Number of cores to use for parallel computations.}

  \item{LB}{logical. Should we use a load balancing parallel computation.}

\item{orig.Hochberg}{logical. To use the standard Hochberg's procedure.}
}

\note{
Results can differ from one time to another because the results of the
function \code{pmvt} are random. If this is the case, you should
consider increasing \code{maxpts} and decreasing \code{abseps}. In any
case, you should always double check using one of the functions
\code{Psirms}, \code{Psirmu} or \code{Psirmd} if the sample size you
obtained gives you the intended power, with an acceptable error (or at
least compute the power a few times with various seeds to see if results
are stable).
  }

\value{
The required sample size.
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
\code{\link{indiv.analysis}},
}
\examples{
\dontrun{
# Pneumovacs example (takes 37 mn to compute on 1 core)

# Treatment effect
delta <- c(0.55, 0.34, 0.38, 0.20, 0.70, 0.38, 0.86)

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

indiv.rm.ssc(method = "Hochberg", asympt = FALSE, r = 3, m = 7, p = 7, nCovernE = 1,
muC = NULL, muE = NULL, d = NULL, delta = delta, SigmaC = cov,
SigmaE = cov, power = 0.8, alpha = 0.05, interval = c(10, 2000), q = 1)

# Pre-RELAX-AHF example from the paper by Teerlink et al. (2009),
# Relaxin for the treatment of patients with acute heart failure
# (Pre-RELAX-AHF): a multicentre, randomised,
# placebo-controlled, parallel-group, dose-finding phase IIb
# study, Lancet, 373: 1429--39

# Table 2 page 1432:
# ------------------
# Proportion with moderately or markedly better dyspnoea at 6 h, 12 h, and 24 h (Likert): 23\% 40\%
# Dyspnoea AUC change from baseline to day 5 (VAS [mmxh]): 1679 (2556) 2567 (2898) 
# Worsening heart failure through day 5: 21\% 12\%
# Length of stay (days): 12.0 (7.3) 10.2 (6.1) 
# Days alive out of hospital: 44.2 (14.2) 47.9 (10.1) 
# KM cardiovascular death or readmission (HR, 95\% CI): 17.2\% 2.6\% (0.13, 0.02--1.03); p=0.053 
# KM cardiovascular death (HR, 95\% CI):  14.3\% 0.0\% (0.00, 0.00--0.98); p=0.046 

# Table 4 page 1436:
# ------------------
# >=25\% increase at day 5: 8 (13\%) 9 (21\%) 
# >=26 micro-mol/L increase at days 5 and 14: 4 (7\%)  3 (7\%) 
muC <- c(23 / 100, 1679, 1 - 21 / 100, -12.0, 44.2, 1 - 17.2 / 100, 1 -
          14.3 / 100, 13 / 100, 7 / 100)
muE <- c(40 / 100, 2567, 1 - 12 / 100, -10.2, 47.9, 1 - 2.60 / 100, 1,
         21 / 100, 7 / 100)

sdC <- c(sqrt(0.23 * (1 - 0.23)), 2556, sqrt(0.79 * (1 - 0.79)), 7.3,
 14.2, sqrt(0.828 * (1 - 0.828)), sqrt(0.857 * (1 - 0.857)), sqrt(0.13 *
 (1 - 0.13)), sqrt(0.07 * (1 - 0.07)))
sdE <- c(sqrt(0.4 * (1 - 0.4))  , 2898, sqrt(0.88 * (1 - 0.88)), 6.1,
 10.1, sqrt(0.974 * (1 - 0.974)), 1e-12                    , sqrt(0.21 * (1 - 0.21)), 
 sqrt(0.07 * (1 - 0.07)))

m <- 9
rho <- 0.1
cor <- matrix(rho, nrow = m, ncol = m)
diag(cor) <- 1
sd.pooled <- sqrt(0.5 * sdE + 0.5 * sdC)
SigmaE <- diag(sdE) \%*\% cor \%*\% diag(sdE)
SigmaC <-diag(sdC) \%*\% cor \%*\% diag(sdC)
indiv.rm.ssc(method = "Bonferroni", asympt = FALSE, r = 6, m = 9, p = 9, nCovernE = 1,
  muC = NULL, muE = NULL, d = rep(0.0, m), delta = (muE - muC) / sd.pooled,
  SigmaC = cor, SigmaE = cor, power = 0.8, alpha = 0.1, interval = c(2, 500),
  q = 1, maxpts = 25000, abseps = 0.01, nbcores = 1, LB = TRUE)

}
}

\keyword{package}
\keyword{Bonferroni Procedure}
\keyword{r power}
\keyword{multiple testing}
\keyword{sample size computation}
