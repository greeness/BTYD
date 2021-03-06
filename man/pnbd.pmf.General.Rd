\name{pnbd.pmf.General}
\alias{pnbd.pmf.General}
\title{Generalized Pareto/NBD Probability Mass Function}
\usage{
  pnbd.pmf.General(params, t.start, t.end, x)
}
\arguments{
  \item{params}{Pareto/NBD parameters - a vector with r,
  alpha, s, and beta, in that order. r and alpha are
  unobserved parameters for the NBD transaction process. s
  and beta are unobserved parameters for the Pareto
  (exponential gamma) dropout process.}

  \item{t.start}{start of time period for which probability
  is being calculated. It can also be a vector of values.}

  \item{t.end}{end of time period for which probability is
  being calculated. It can also be a vector of values.}

  \item{x}{number of repeat transactions by a random
  customer in the period defined by (t.start, t.end]. It
  can also be a vector of values.}
}
\value{
  Probability of x transaction occuring between t.start and
  t.end conditional on model parameters. If t.start, t.end,
  and/or x has a length greater than one, a vector of
  probabilities will be returned.
}
\description{
  Generalized probability mass function for the Pareto/NBD.
}
\details{
  P(X(t.start, t.end)=x | r, alpha, s, beta). Returns the
  probability that a customer makes x repeat transactions
  in the time interval (t.start, t.end].

  It is impossible for a customer to make a negative number
  of repeat transactions. This function will return an
  error if it is given negative times or a negative number
  of repeat transactions. This function will also return an
  error if \code{t.end} is less than \code{t.start}.

  \code{t.start}, \code{t.end}, and \code{x} may be
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
params <- c(0.55, 10.56, 0.61, 11.64)
# probability that a customer will make 10 repeat transactions in the
# time interval (1,2]
pnbd.pmf.General(params, t.start=1, t.end=2, x=10)
# probability that a customer will make no repeat transactions in the
# time interval (39,78]
pnbd.pmf.General(params, t.start=39, t.end=78, x=0)
}
\references{
  Fader, Peter S., and Bruce G.S. Hardie. \dQuote{Deriving
  an Expression for P (X(t) = x) Under the Pareto/NBD
  Model.} Sept. 2006. Web.
  \url{http://www.brucehardie.com/notes/012/}

  Fader, Peter S., Bruce G.S. Hardie, and Kinshuk Jerath.
  \dQuote{Deriving an Expression for P (X(t, t + tau) = x)
  Under the Pareto/NBD Model.} Sept. 2006. Web.
  \url{http://www.brucehardie.com/notes/013/}
}

