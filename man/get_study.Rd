\name{get_study}
\alias{get_study}
\title{return the trees in treebase that correspond to the search results}
\usage{
  get_study(search_results, curl = getCurlHandle(), ...)
}
\arguments{
  \item{search_results}{the output of search_metadata, or a
  subset thereof}

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
  search results
}
\details{
  this function is commonly used to get trees corresponding
  to the metadata search.
}
\examples{
\dontrun{
all <- search_metadata("", by="all")
nature <- sapply(all, function(x) length(grep("Nature", x$publisher))>0)
science <- sapply(all, function(x) length(grep("^Science$", x$publisher))>0)
s <- get_study( all[nature] )
s <- get_study(all[science])
}
}

