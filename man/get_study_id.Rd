\name{get_study_id}
\alias{get_study_id}
\title{return the study.id from the search results.}
\usage{
  get_study_id(search_results)
}
\arguments{
  \item{search_results}{the output of download_metadata, or
  a subset thereof}
}
\value{
  the study id
}
\description{
  get_study_id is deprecated, and now can be performed more
  easily using phylo_metadata and oai_metadata search
  functions.
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
s <- treebase:::get_study_id( all[nature] )
}
}
\keyword{internal}

