\name{pnbd.compress.cbs}
\alias{pnbd.compress.cbs}
\title{Compress Customer-by-Sufficient-Statistic Matrix}
\usage{
  pnbd.compress.cbs(cbs, rounding = 3)
}
\arguments{
  \item{cbs}{calibration period CBS (customer by sufficient
  statistic). It must contain columns for frequency ("x"),
  recency ("t.x"), and total time observed ("T.cal"). Note
  that recency must be the time between the start of the
  calibration period and the customer's last transaction,
  not the time between the customer's last transaction and
  the end of the calibration period.}

  \item{rounding}{the function tries to ensure that there
  are similar customers by rounding the
  customer-by-sufficient-statistic matrix first. This
  parameter determines how many decimal places are left in
  the data. Negative numbers are allowed; see the
  documentation for \code{round} in the base package. As of
  the time of writing, that documentation states: "Rounding
  to a negative number of digits means rounding to a power
  of ten, so for example \code{round(x, digits = -2)}
  rounds to the nearest hundred."}
}
\value{
  A customer-by-sufficient-statistic matrix with an
  additional column "custs", which contains the number of
  customers with each combination of recency, frequency and
  length of calibration period.
}
\description{
  Combines all customers with the same combination of
  recency, frequency and length of calibration period in
  the customer-by-sufficient-statistic matrix, and adds a
  fourth column labelled "custs" (with the number of
  customers belonging in each row).
}
\details{
  This function is meant to be used to speed up
  log-likelihood and parameter estimation functions. How
  much faster those function run depends on how similar
  customers are.

  This function only takes columns "x", "t.x", and "T.cal"
  into account. All other columns will be added together -
  for example, if you have a spend column, the output's
  spend column will contain the total amount spent by all
  customers with an identical recency, frequency, and time
  observed.
}
\examples{
# Create a sample customer-by-sufficient-statistic matrix:
set.seed(7)
x <- sample(1:4, 10, replace = TRUE)
t.x <- sample(1:4, 10, replace = TRUE)
T.cal <- rep(4, 10)
ave.spend <- sample(10:20, 10, replace = TRUE)
cbs <- cbind(x, t.x, T.cal, ave.spend)
cbs

# If cbs is printed, you would note that the following
# sets of rows have the same x, t.x and T.cal:
# (1, 6, 8); (3, 9)

pnbd.compress.cbs(cbs, 0)   # No rounding necessary

# Note that all additional columns (in this case, ave.spend)
# are aggregated by sum.
}

