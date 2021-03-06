\name{dc.CreateSpendCBT}
\alias{dc.CreateSpendCBT}
\title{Create Spend Customer-by-Time Matrix}
\usage{
  dc.CreateSpendCBT(elog, is.avg.spend = FALSE)
}
\arguments{
  \item{elog}{event log, which is a data frame with columns
  for customer ID ("cust"), date ("date"), and optionally
  other columns such as "sales". Each row represents an
  event, such as a transaction. If the dates are not
  formatted to be in the order year-month-day, the columns
  of the customer-by-time matrix may not be ordered
  chronologically if the "date" column does not consist of
  date objects (R will order them alphabetically). This
  will cause problems with other functions, so it is better
  to convert the date column to date objects before running
  this function.}

  \item{is.avg.spend}{if TRUE, return average spend
  customer-by-time matrix; else, return total spend
  customer-by-time matrix.}
}
\value{
  Spend customer-by-time matrix.
}
\description{
  Creates a customer-by-time matrix with spend per time
  period.
}
\examples{
# Create event log from file "cdnowElog.csv", which has
# customer IDs in the second column, dates in the third column, and
# sales numbers in the fifth column.
elog <- dc.ReadLines(system.file("data/cdnowElog.csv", package="BTYD"),2,3,5);

# Given that the dates are in the order year-month-day,
# it is not strictly necessary to convert the date column
# to date formats. However, it is good practice:
elog[,"date"] <- as.Date(elog[,"date"], "\%Y\%m\%d")

spend.cbt <- dc.CreateSpendCBT(elog)
}

