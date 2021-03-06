\name{pnbd.Plot.DERT}
\alias{pnbd.Plot.DERT}
\title{Pareto/NBD Plot Discounted Expected Residual Transactions}
\usage{
  pnbd.Plot.DERT(params, x, t.x, T.cal, d,
    type = "wireframe")
}
\arguments{
  \item{params}{Pareto/NBD parameters - a vector with r,
  alpha, s, and beta, in that order. r and alpha are
  unobserved parameters for the NBD transaction process. s
  and beta are unobserved parameters for the Pareto
  (exponential gamma) dropout process.}

  \item{x}{a vector of calibration period transaction
  frequencies.}

  \item{t.x}{a vector of recencies of transactions.}

  \item{T.cal}{length of the calibration period - must be a
  single value and not a vector.}

  \item{d}{the discount rate to be used. Make sure that it
  matches up with your chosen time period (do not use an
  annual rate for monthly data, for example).}

  \item{type}{must be either "persp" (perspective - 3
  dimensional) or "contour". Determines the type of plot
  produced by this function.}
}
\value{
  A matrix with discounted expected residual transaction
  values for every combination of calibration period
  frequency and calibration period recency.
}
\description{
  Plots discounted expected residual transactions for
  different combinations of calibration period frequency
  and recency.
}
\details{
  A matrix with DERT values for all the possible
  combinations of the given \code{x} and \code{t.x}.
}
\examples{
# The RFM and CLV paper uses all 78 weeks of the cdnow data to
# estimate parameters. These parameters can be estimated as follows:

# elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3)
# cal.cbs <- dc.ElogToCbsCbt(elog)$cal$cbs
# pnbd.EstimateParameters(cal.cbs)
# (The final function was run several times with its own output as
# input for starting parameters, to ensure that the result converged).

params <- c(0.5629966, 12.5590370, 0.4081095, 10.5148048)

# 15\% compounded annually has been converted to 0.0027 compounded continously,
# as we are dealing with weekly data and not annual data.
d <- 0.0027

pnbd.Plot.DERT(params, x=0:14, t.x=0:77, T.cal=77.86, d, type="persp")
pnbd.Plot.DERT(params, x=0:14, t.x=0:77, T.cal=77.86, d, type="contour")
}
\references{
  Fader, Peter S., Bruce G.S. Hardie, and Ka L. Lee.
  \dQuote{RFM and CLV: Using Iso-Value Curves for Customer
  Base Analysis.} \emph{Journal of Marketing Research}
  Vol.42, pp.415-430. November. 2005.
  \url{http://www.brucehardie.com/papers.html}

  Note that this paper refers to what this package is
  calling discounted expected residual transactions (DERT)
  simply as discounted expected transactions (DET).
}

