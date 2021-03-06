\name{bgbb.HeatmapHoldoutExpectedTrans}
\alias{bgbb.HeatmapHoldoutExpectedTrans}
\title{BG/BB Heatmap of Holdout Period Expected Transactions}
\usage{
  bgbb.HeatmapHoldoutExpectedTrans(params, n.cal, n.star,
    xlab = "Recency", ylab = "Frequency", xticklab = NULL,
    title = "Heatmap of Conditional Expected Transactions")
}
\arguments{
  \item{params}{BG/BB parameters - a vector with alpha,
  beta, gamma, and delta, in that order. Alpha and beta are
  unobserved parameters for the beta-Bernoulli transaction
  process. Gamma and delta are unobserved parameters for
  the beta-geometric dropout process.}

  \item{n.cal}{number of transaction opportunities in the
  calibration period.}

  \item{xlab}{descriptive label for the x axis.}

  \item{ylab}{descriptive label for the y axis.}

  \item{xticklab}{vector containing a label for each tick
  mark on the x axis.}

  \item{title}{title placed on the top-center of the plot.}

  \item{n.star}{number of transaction opportunities in the
  holdout period.}
}
\value{
  A matrix containing the conditional expected transactions
  in the holdout period for each recency-frequency
  combination in the calibration period. The rows represent
  calibration period frequencies, and the columns represnt
  calibration period recencies.
}
\description{
  Plots a heatmap based on the conditional expected holdout
  period frequency for each recency-frequency combination
  in the calibration period.
}
\details{
  E(X(n, n+n*) | alpha, beta, gamma, delta, x, t.x, n).
  This function requires the holdout period to immediately
  follow the calibration period.
}
\examples{
data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# Plot a heatmap of conditional expected transactions in
# a holdout period of 5 transaction opportunities, given
# that the calibration period consisted of 6 transaction
# opportunities.
bgbb.HeatmapHoldoutExpectedTrans(est.params, n.cal=6, n.star=5)
}
\references{
  Fader, Peter S., Bruce G.S. Hardie, and Jen Shang.
  \dQuote{Customer-Base Analysis in a Discrete-Time
  Noncontractual Setting.} \emph{Marketing Science} 29(6),
  pp. 1086-1108. 2010. INFORMS.
  \url{http://www.brucehardie.com/papers/020/}
}
\seealso{
  \code{\link{bgbb.ConditionalExpectedTransactions}}
}

