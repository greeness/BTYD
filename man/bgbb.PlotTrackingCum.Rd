\name{bgbb.PlotTrackingCum}
\alias{bgbb.PlotTrackingCum}
\title{BG/BB Tracking Cumulative Transactions Plot}
\usage{
  bgbb.PlotTrackingCum(params, rf.matrix,
    actual.cum.repeat.transactions, xlab = "Time",
    ylab = "Cumulative Transactions", xticklab = NULL,
    title = "Tracking Cumulative Transactions")
}
\arguments{
  \item{params}{BG/BB parameters - a vector with alpha,
  beta, gamma, and delta, in that order. Alpha and beta are
  unobserved parameters for the beta-Bernoulli transaction
  process. Gamma and delta are unobserved parameters for
  the beta-geometric dropout process.}

  \item{rf.matrix}{recency-frequency matrix. It must
  contain columns for the number of transactions
  opportunities in the calibration period ("n.cal"), and
  the number of customers with this number of transaction
  opportunities in the calibration period ("custs").
  Columns for frequency and recency may be in the matrix,
  but are not necessary for this function since it relies
  on \code{\link{bgbb.Expectation}}, which only requires
  the number of transaction opportunities.}

  \item{actual.cum.repeat.transactions}{vector containing
  the cumulative number of repeat transactions made by
  customers in all transaction opportunities (both
  calibration and holdout periods). Its unit of time should
  be the same as the units of the recency-frequency matrix
  used to estimate the model parameters.}

  \item{xlab}{descriptive label for the x axis.}

  \item{ylab}{descriptive label for the y axis.}

  \item{xticklab}{vector containing a label for each tick
  mark on the x axis.}

  \item{title}{title placed on the top-center of the plot.}
}
\value{
  Matrix containing actual and expected cumulative repeat
  transactions.
}
\description{
  Plots the actual and expected cumulative total repeat
  transactions by all customers for the calibration and
  holdout periods. Also returns a matrix with this
  comparison.
}
\details{
  The holdout period should immediately follow the
  calibration period. This function assume that all
  customers' calibration periods end on the same date,
  rather than starting on the same date (thus customers'
  birth periods are determined using \code{max(n.cal) -
  n.cal} rather than assuming that it is 0).
}
\examples{
data(donationsSummary)
# donationsSummary$rf.matrix already has appropriate column names
rf.matrix <- donationsSummary$rf.matrix

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# get the annual repeat transactions, and transform them into
# a cumulative form
actual.inc.repeat.transactions <- donationsSummary$annual.trans
actual.cum.repeat.transactions <- cumsum(actual.inc.repeat.transactions)

# set appropriate x-axis
x.tickmarks <- c( "'96","'97","'98","'99","'00","'01","'02","'03","'04","'05","'06" )

# plot actual vs. expected transactions. The calibration period was 6 periods long.
bgbb.PlotTrackingCum(est.params, rf.matrix, actual.cum.repeat.transactions, xticklab=x.tickmarks)
}
\references{
  Fader, Peter S., Bruce G.S. Hardie, and Jen Shang.
  \dQuote{Customer-Base Analysis in a Discrete-Time
  Noncontractual Setting.} \emph{Marketing Science} 29(6),
  pp. 1086-1108. 2010. INFORMS.
  \url{http://www.brucehardie.com/papers/020/}
}

