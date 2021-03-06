\name{bgbb.EstimateParameters}
\alias{bgbb.EstimateParameters}
\title{BG/BB Parameter Estimation}
\usage{
  bgbb.EstimateParameters(rf.matrix,
    par.start = c(1, 1, 1, 1), max.param.value = 1000)
}
\arguments{
  \item{rf.matrix}{recency-frequency matrix. It must
  contain columns for frequency ("x"), recency ("t.x"),
  number of transaction opportunities in the calibration
  period ("n.cal"), and the number of customers with this
  combination of recency, frequency and transaction
  opportunities in the calibration period ("custs"). Note
  that recency must be the time between the start of the
  calibration period and the customer's last transaction,
  not the time between the customer's last transaction and
  the end of the calibration period.}

  \item{par.start}{initial BG/BB parameters - a vector with
  alpha, beta, gamma, and delta, in that order. Alpha and
  beta are unobserved parameters for the beta-Bernoulli
  transaction process. Gamma and delta are unobserved
  parameters for the beta-geometric dropout process.}

  \item{max.param.value}{the upper bound on parameters.}
}
\value{
  Vector of estimated paramaters.
}
\description{
  Estimates parameters for the BG/BB model.
}
\details{
  The best-fitting parameters are determined using the
  \code{\link{bgbb.rf.matrix.LL}} function. The sum of the
  log-likelihood for each customer (for a set of
  parameters) is maximized in order to estimate paramaters.

  A set of starting parameters must be provided for this
  method. If no parameters are provided, (1,1,1,1) is used
  as a default. It may be useful to use starting values for
  parameters that represent your best guess of the
  heterogeneity in the transaction and dropout rates of
  customers. It may be necessary to run the estimation from
  multiple starting points to ensure that it converges. To
  compare the log-likelihoods of different parameters, use
  \code{\link{bgbb.rf.matrix.LL}}.

  The lower bound on the parameters to be estimated is
  always zero, since BG/BB parameters cannot be negative.
  The upper bound can be set with the
  \code{max.param.value} parameter.
}
\examples{
data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)
# log-likelihood of estimated parameters
bgbb.rf.matrix.LL(est.params, rf.matrix)
}
\seealso{
  \code{\link{bgbb.rf.matrix.LL}}
}

