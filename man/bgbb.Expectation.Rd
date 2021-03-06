\name{bgbb.Expectation}
\alias{bgbb.Expectation}
\title{BG/BB Expectation}
\usage{
  bgbb.Expectation(params, n)
}
\arguments{
  \item{params}{BG/BB parameters - a vector with alpha,
  beta, gamma, and delta, in that order. Alpha and beta are
  unobserved parameters for the beta-Bernoulli transaction
  process. Gamma and delta are unobserved parameters for
  the beta-geometric dropout process.}

  \item{n}{number of transaction opportunities.}
}
\value{
  Mean of the BG/BB probability mass function.
}
\description{
  Returns the number of transactions that a randomly chosen
  customer (for whom we have no prior information) is
  expected to make in the first n transaction
  opportunities.
}
\details{
  E(X(n) | alpha, beta, gamma, delta)
}
\examples{
params <- c(1.20, 0.75, 0.66, 2.78)
# Expected number of transactions that a randomly chosen customer
# will make in the first 10 transaction opportunities.
bgbb.Expectation(params, n=10)

# We can also compare expected transactions over time:
bgbb.Expectation(params, n=1:10)
}
\references{
  Fader, Peter S., Bruce G.S. Hardie, and Jen Shang.
  \dQuote{Customer-Base Analysis in a Discrete-Time
  Noncontractual Setting.} \emph{Marketing Science} 29(6),
  pp. 1086-1108. 2010. INFORMS.
  \url{http://www.brucehardie.com/papers/020/}
}

