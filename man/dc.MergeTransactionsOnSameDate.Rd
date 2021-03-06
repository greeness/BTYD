\name{dc.MergeTransactionsOnSameDate}
\alias{dc.MergeTransactionsOnSameDate}
\title{Merge Transactions on Same Day}
\usage{
  dc.MergeTransactionsOnSameDate(elog)
}
\arguments{
  \item{elog}{event log, which is a data frame with columns
  for customer ID ("cust"), date ("date"), and optionally
  other columns such as "sales". Each row represents an
  event, such as a transaction.}
}
\value{
  Event log with transactions made by the same customer on
  the same day merged into one transaction.
}
\description{
  Updates an event log; any transactions made by the same
  customer on the same day are combined into one
  transaction.
}

