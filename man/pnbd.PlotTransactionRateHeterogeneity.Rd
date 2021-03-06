\name{pnbd.PlotTransactionRateHeterogeneity}
\alias{pnbd.PlotTransactionRateHeterogeneity}
\title{Pareto/NBD Plot Transaction Rate Heterogeneity}
\usage{
  pnbd.PlotTransactionRateHeterogeneity(params, lim = NULL)
}
\arguments{
  \item{params}{Pareto/NBD parameters - a vector with r,
  alpha, s, and beta, in that order. r and alpha are
  unobserved parameters for the NBD transaction process. s
  and beta are unobserved parameters for the Pareto
  (exponential gamma) dropout process.}

  \item{lim}{upper-bound of the x-axis. A number is chosen
  by the function if none is provided.}
}
\value{
  Distribution of customers' propensities to purchase.
}
\description{
  Plots and returns the estimated gamma distribution of
  lambda (customers' propensities to purchase).
}
\details{
  This returns the distribution of each customer's Poisson
  parameter, which determines the level of their purchasing
  (using the Pareto/NBD assumption that purchasing on the
  individual level can be modeled with a Poisson
  distribution).
}
\examples{
params <- c(0.55, 10.56, 0.61, 11.64)
pnbd.PlotTransactionRateHeterogeneity(params)
params <- c(3, 10.56, 0.61, 11.64)
pnbd.PlotTransactionRateHeterogeneity(params)
}

