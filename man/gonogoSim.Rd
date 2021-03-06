% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gonogoSim.R
\name{gonogoSim}
\alias{gonogoSim}
\title{gonogoSim}
\usage{
gonogoSim(mlo, mhi, sg, n2, n3, p, lam, dm = 0, ds = 0, ln = F, plt = 0,
  neyer = F, iseed = -1, IIgo = T, M = 1)
}
\arguments{
\item{mlo}{The min value \eqn{\mu_min} to guess a reasonable range (\eqn{\mu_min, \mu_max}) for \eqn{\mu}}

\item{mhi}{The max value \eqn{\mu_max} to guess a reasonable range (\eqn{\mu_min, \mu_max}) for \eqn{\mu}}

\item{sg}{Guess for standard deviation \eqn{\sigma_g}, should satisfy: \eqn{\mu_max - \mu_min \ge 6*\sigma_g}}

\item{n2}{Phase II test size, \eqn{n2 \ge 0}, \eqn{n2 = 0} skips Phase II and proceeds directly to Phase III}

\item{n3}{Phase III test size, \eqn{n3 \ge 0}, \eqn{n3 = 0} skips Phase III}

\item{p}{Phase III skewed RMJ procedure p (percentile)}

\item{lam}{Phase III skewed RMJ procedure lambda (skewness coefficient)}

\item{dm}{\eqn{\mu_d} is the deviation from the true mean (\eqn{\mu_true}), which is taken to be (\code{mlo}+\code{mhi})/2.}

\item{ds}{\eqn{\sigma_d} is the deviation from the true standard deviation (sigma_true), which is taken to be \code{sg}.}

\item{ln}{logical; if \code{TRUE} test in log(\emph{X}) units (Experimental)}

\item{plt}{\code{plt}=0 for no plot}

\item{neyer}{logical; if \code{TRUE}, Neyer test is performed, otherwise three-phase optimal design (3pod) test}

\item{iseed}{An iseed not equal to -1 allows one to repeatedly generate the same sequence of X's & Y's.}

\item{IIgo}{logical; if TRUE means continue into Phase II, otherwise IIgo = F would be useful to compare 3pod and Neyer Phase I}

\item{M}{the simulation ALWAYS multiplies \code{mlo}, \code{mhi}, \code{sg}, \code{dm} and \code{ds} by \code{M} (default is 1)
this option allows you to demonstrate that the procedures are scale-free

#list(d0,jvec,tmu,tsig,v$mu,v$sig,en,abo,titl,uni,p,reso,ln,lam,neyer,M,dm,ds,iseed)}
}
\value{
A list containing 19 named objects, which are:
\enumerate{

		\item \code{d0}: A data frame having column names of ("X", "Y","COUNT","RX","EX","TX","ID"),
		where the columns contain the sequence of: X's, Y's, 1's, Recommended X's, Exact X's,
		Transformed X's (used for log transformed data), and ID's (Identifying the test Phase), respectively

   \item \code{jvec}: An i by 9 matrix, \eqn{0 \le I \le n3+1} documenting the Phase III calculation

   \item \code{tmu}: \eqn{\mu_t = (\mu_min + \mu_max) / 2 + \mu_d};

   \item \code{tsig}: \eqn{\sigma_t = \sigma_g + \sigma_d};

   \item \code{mu}:

   \item \code{sig}:

		\item \code{en}: A vector of the lengths (\emph{n1},\emph{n2},\emph{n3}) for the 3 Phases (thus far)

		\item \code{abo}: A string containing \code{mlo}, \code{mhi}, \code{sg},
		      \code{n1}, \code{n2}, \code{n3}, \code{p}, \code{lambda}, and \code{reso}

		\item \code{titl}: A string containing the user defined title

		\item \code{uni}: A string containing the user defined units


		\item \code{p}: The numeric value of the user define \emph{p} (0 if not in Phase III)

		\item \code{reso}: The resolution (0 default for no rounding of recommended stresses)

		\item \code{ln}: A logical (\code{TRUE} or \code{FALSE}), \code{TRUE} when method operates on log transformed stresses

		\item \code{lam}: A numeric value of the user entry lambda (0 prior to Phase III)

		\item \code{neyer}: A logical (\code{TRUE} or \code{FALSE}), \code{TRUE} for Neyer Test, \code{FALSE} for 3pod (default)

   \item \code{M}: the simulation ALWAYS multiplies \code{mlo}, \code{mhi}, \code{sg}, \code{dm} and \code{ds} by \code{M} (default is 1)
this option allows you to demonstrate that the procedures are scale-free

   \item \code{dm}: \code{dm} is the deviation from the true mean (mu_true), which is taken to be (\code{mlo}+\code{mhi})/2.

   \item \code{ds}: \code{ds} is the deviation from the true standard deviation (sigma_true), which is taken to be \code{sg}.

		\item \code{iseed}: An iseed not equal to -1 allows one to repeatedly generate the same sequence of X's & Y's.
}
}
\description{
Dynamic sequential algorithms for sensitivity testing (binary response information). It is a three-phase
optimal design of sensitivity experiments that is highly modular. It can be used to meet several test objectives,
from exploratory testing (Phase I), to refined reliability estimates (Phase III). This three-phase procedure
can be viewed as a trilogy of "search-estimate-approximate."
}
\details{
There are three versions of 3pod, console(one at a time, keyboard entry), batch?? (a vector of responses is looked for)
and one suited for simulation. This function is the simulation version.
}
\examples{
M= 1;  y1=gonogoSim(0,22,3,5,5,.9,1,plt=1,dm=1,ds=1,M= 1,iseed=5)
M=10; y10=gonogoSim(0,22,3,5,5,.9,1,plt=1,dm=1,ds=1,M=10,iseed=5)
Look at graphs: ptest(y1,i) v ptest(10,i), for i=1,2 and 3. Examine y1$d0 and y10$d0
}
