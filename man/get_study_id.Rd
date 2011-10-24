\name{get_study_id}
\alias{get_study_id}
\title{return the study.id from the search results.}
\usage{
  get_study_id(search_results)
}
\arguments{
  \item{search_results}{the output of search_metadata, or a
  subset thereof}
}
\value{
  the study id
}
\description{
  return the study.id from the search results.
}
\details{
  this

  function is commonly used to get trees corresponding to
  the metadata search.
}
\examples{
\dontrun{
all <- search_metadata("", by="all")

nature <- sapply(all, function(x) length(grep("Nature", x$publisher))>0)
science <- sapply(all, function(x) length(grep("^Science$", x$publisher))>0)
s <- get_study_id( all[nature] )
nature_trees <- sapply(s, function(x) search_treebase(x, "id.study"))
s <- get_study_id(all[science])
science_trees <- sapply(s, function(x) search_treebase(x, "id.study", branch=T))
}
}

