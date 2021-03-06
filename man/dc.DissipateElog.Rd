\name{dc.DissipateElog}
\alias{dc.DissipateElog}
\title{Dissipate Event Log}
\usage{
  dc.DissipateElog(elog, dissipate.factor)
}
\arguments{
  \item{elog}{event log, which is a data frame with columns
  for customer ID ("cust"), date ("date"), and optionally
  other columns such as "sales". Each row represents an
  event, such as a transaction.}

  \item{dissipate.factor}{integer indicating how much of
  the dataset to eliminate. It must be greater than 1 for
  the function to work.
  (dissipate.factor-1)/(dissipate.factor) events will be
  removed from the event log. For example, if 2 is
  provided, 1/2 of the event log is eliminated, and if 10
  is provided, 9/10 of the event log is eliminated.}
}
\value{
  Reduced event log.
}
\description{
  Filters an event log, keeping a fraction of the original
  event log.
}

