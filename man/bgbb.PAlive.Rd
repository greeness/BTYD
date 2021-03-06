\name{bgbb.PAlive}
\alias{bgbb.PAlive}
\title{BG/BB P(Alive)}
\usage{
  bgbb.PAlive(params, x, t.x, n.cal)
}
\arguments{
  \item{params}{BG/BB parameters - a vector with alpha,
  beta, gamma, and delta, in that order. Alpha and beta are
  unobserved parameters for the beta-Bernoulli transaction
  process. Gamma and delta are unobserved parameters for
  the beta-geometric dropout process.}

  \item{x}{number of repeat transactions a customer made in
  the calibration period. May also be a vector of
  frequencies - see details.}

  \item{t.x}{recency - the last transaction opportunity in
  which this customer made a transaction. May also be a
  vector of recencies - see details.}

  \item{n.cal}{number of transaction opportunities in the
  calibration period.. May also be a vector of calibration
  period transaction opportunities - see details.}
}
\value{
  Probability that the customer is alive at the (n+1)th
  transaction opportunity. If \code{x}, \code{t.x}, and/or
  \code{n.cal} has a length greater than one, then this
  will be a vector of probabilities (containing one element
  matching each element of the longest input vector).
}
\description{
  Uses BG/BB model parameters and a customer's past
  transaction behavior to return the probability that they
  will be alive in the transaction opportunity following
  the calibration period.
}
\details{
  \code{x}, \code{t.x}, and \code{n.cal} may be vectors.
  The standard rules for vector operations apply - if they
  are not of the same length, shorter vectors will be
  recycled (start over at the first element) until they are
  as long as the longest vector. It is advisable to keep
  vectors to the same length and to use single values for
  parameters that are to be the same for all calculations.
  If one of these parameters has a length greater than one,
  the output will be a vector of probabilities.

  P(alive at n+1 | alpha, beta, gamma, delta, x, t.x, n)
}
\examples{
params <- c(1.20, 0.75, 0.66, 2.78)

# The probability that a customer who made 3 transactions in
# the calibration period (which consisted of 6 transaction
# opportunities), with the last transaction occurring at the
# 4th transaction opportunity, is alive at the 7th transaction
# opportunity
bgbb.PAlive(params, x=3, t.x=4, n.cal=6)

# The input parameters may also be vectors:
bgbb.PAlive(params, x=1, t.x=1:6, n.cal=6)
}
\references{
  Fader, Peter S., Bruce G.S. Hardie, and Jen Shang.
  \dQuote{Customer-Base Analysis in a Discrete-Time
  Noncontractual Setting.} \emph{Marketing Science} 29(6),
  pp. 1086-1108. 2010. INFORMS.
  \url{http://www.brucehardie.com/papers/020/}
}

