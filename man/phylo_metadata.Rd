\name{phylo_metadata}
\alias{phylo_metadata}
\title{Search the PhyloWS metadata}
\usage{
  phylo_metadata(x = c("Study.id", "Tree.id", "kind", "type", "quality", "ntaxa"),
    metadata = NULL, ...)
}
\arguments{
  \item{x}{one of "Study.ids", "Tree.ids", "kind", "type",
  "quality", "ntaxa"}

  \item{metadata}{returned from \code{search_treebase}
  function. if not specified will download latest copy of
  PhyloWS metadata from treebase.  Pass in search results
  value during repeated calls to speed function runtime
  substantially}

  \item{...}{additional arguments to
  \code{search_treebase}}
}
\value{
  a list of the values matching the query
}
\description{
  Search the PhyloWS metadata
}
\examples{
\dontrun{
     # calls will work without a metadata object, but require longer to download data
     kind <- treebase:::phylo_metadata("kind")
     type <- phylo_metadata("type")
     table(kind, type)
     }
     # but are much faster if the data object is provided, see cache_treebase():
     data(treebase)
     kind <- treebase:::phylo_metadata("kind", metadata=treebase)
     type <- treebase:::phylo_metadata("type", metadata=treebase)
     table(kind, type)
}
\keyword{internal}

