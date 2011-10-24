\name{oai_metadata}
\alias{oai_metadata}
\title{Internal function for OAI-MPH interface to the Dryad database}
\usage{
  oai_metadata(query, curl = curl)
}
\arguments{
  \item{query}{a properly formed url query to dryad}

  \item{curl}{if calling in series many times, call
  getCurlHandle() first and then pass the return value in
  here. Avoids repeated handshakes with server.}
}
\description{
  Internal function for OAI-MPH interface to the Dryad
  database
}
\seealso{
  \code{\link{dryad_metadata}}
}
\keyword{internal}

