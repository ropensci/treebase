\name{oai_metadata}
\alias{oai_metadata}
\title{Search the OAI-PMH metadata by date, publisher, or identifier}
\usage{
oai_metadata(x = c("date", "publisher", "author", "title", "Study.id",
  "attributes"), metadata = NULL, ...)
}
\arguments{
  \item{x}{one of "date", "publisher", "identifier" for the
  study}

  \item{metadata}{returned from \code{download_metadata}
  function. if not specified will download latest copy from
  treebase.  Pass in the value during repeated calls to
  speed function runtime substantially}

  \item{...}{additional arguments to
  \code{download_metadata}}
}
\value{
a list of values matching the query
}
\description{
Search the OAI-PMH metadata by date, publisher, or
identifier
}
\keyword{internal}

