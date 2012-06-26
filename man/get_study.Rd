\name{get_study}
\alias{get_study}
\title{return the trees in treebase that correspond to the search results
get_study is deprecated, and now can be performed more easily using
phylo_metadata and oai_metadata search functions.}
\usage{
  get_study(search_results, curl = getCurlHandle(), ...)
}
\arguments{
  \item{search_results}{the output of download_metadata, or
  a subset thereof}

  \item{curl}{the handle to the curl web utility for
  repeated calls, see the getCurlHandle() function in RCurl
  package for details.}

  \item{...}{additional arguments to pass to
  search_treebase}
}
\value{
  all corresponding phylogenies.
}
\description{
  return the trees in treebase that correspond to the
  search results get_study is deprecated, and now can be
  performed more easily using phylo_metadata and
  oai_metadata search functions.
}
\details{
  this function is commonly used to get trees corresponding
  to the metadata search.
}
\examples{
\dontrun{
all <- download_metadata("", by="all")
nature <- sapply(all, function(x) length(grep("Nature", x$publisher))>0)
science <- sapply(all, function(x) length(grep("^Science$", x$publisher))>0)
s <- treebase:::get_study( all[nature] )
s <- treebase:::get_study(all[science])
}
}
\keyword{internal}

