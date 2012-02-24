\name{dryad_metadata}
\alias{dryad_metadata}
\title{Search the dryad metadata archive}
\usage{
  dryad_metadata(study.id, curl = getCurlHandle())
}
\arguments{
  \item{study.id}{the dryad identifier}

  \item{curl}{if calling in series many times, call
  getCurlHandle() first and then pass the return value in
  here. Avoids repeated handshakes with server.}
}
\value{
  a list object containing the study metadata
}
\description{
  Search the dryad metadata archive
}
\examples{
\dontrun{
dryad_metadata("10255/dryad.12")
}
}

