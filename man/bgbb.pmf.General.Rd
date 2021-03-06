\name{bgbb.pmf.General}
\alias{bgbb.pmf.General}
\title{BG/BB General Probability Mass Function}
\usage{
  bgbb.pmf.General(params, n.cal, n.star, x.star)
}
\arguments{
  \item{params}{BG/BB parameters - a vector with alpha,
  beta, gamma, and delta, in that order. Alpha and beta are
  unobserved parameters for the beta-Bernoulli transaction
  process. Gamma and delta are unobserved parameters for
  the beta-geometric dropout process.}

  \item{n.cal}{number of transaction opportunities in the
  calibration period, or a vector of calibration period
  transaction opportunities.}

  \item{n.star}{number of transaction opportunities in the
  holdout period, or a vector of holdout period transaction
  opportunities.}

  \item{x.star}{number of transactions in the holdout
  period, or a vector of transaction frequencies.}
}
\value{
  Probability of X(n,n+n*)=x*, given BG/BB model
  parameters.
}
\description{
  Calculates the probability that a customer will make
  \code{x.star} transactions in the first \code{n.star}
  transaction opportunities following the calibration
  period.
}
\details{
  P(X(n, n+n*)=x* | alpha, beta, gamma, delta). This is a
  more generalized version of the \code{bgbb.pmf}. Setting
  \code{n.cal} to 0 reduces this function to the
  probability mass function in its usual format - the
  probability that a user will make \code{x.star}
  transactions in the first \code{n.star} transaction
  opportunities.

  It is impossible for a customer to make a negative number
  of transactions, or to make more transactions than there
  are transaction opportunities. This function will throw
  an error if such inputs are provided.

  \code{n.cal}, \code{n.star}, and \code{x.star} may be
  vectors. The standard rules for vector operations apply -
  if they are not of the same length, shorter vectors will
  be recycled (start over at the first element) until they
  are as long as the longest vector. It is advisable to
  keep vectors to the same length and to use single values
  for parameters that are to be the same for all
  calculations. If one of these parameters has a length
  greater than one, the output will be a vector of
  probabilities.
}
\examples{
params <- c(1.20, 0.75, 0.66, 2.78)
# Probability that a customer will make 3 transactions in the 10
# transaction opportunities following the 6 transaction opportunities
# in the calibration period, given BG/BB parameters.
bgbb.pmf.General(params, n.cal=6, n.star=10, x.star=3)

# Vectors may also be provided as input:
# Comparison between different frequencies:
bgbb.pmf.General(params, n.cal=6, n.star=10, x.star=1:10)
# Comparison between different holdout transaction opportunities:
bgbb.pmf.General(params, n.cal=6, n.star=5:15, x.star=3)
}
\references{
  Fader, Peter S., Bruce G.S. Hardie, and Jen Shang.
  \dQuote{Customer-Base Analysis in a Discrete-Time
  Noncontractual Setting.} \emph{Marketing Science} 29(6),
  pp. 1086-1108. 2010. INFORMS.
  \url{http://www.brucehardie.com/papers/020/}
}

