\name{metadata}
\alias{metadata}
\title{Get the metadata associated with the study in which the phylogeny
 was published.}
\usage{
  metadata(study.id, curl = getCurlHandle())
}
\arguments{
  \item{study.id}{The treebase study id (numbers only,
  specify in quotes)}

  \item{curl}{if calling in series many times, call
  getCurlHandle() first and then pass the return value in
  here.  avoids repeated handshakes with server.}
}
\description{
  Get the metadata associated with the study in which the
  phylogeny was published.
}
\details{
  if the tree is imported with search_treebase, then this
  is in tree$S.id
}
\examples{
\dontrun{
  tree <- search_treebase("1234", "id.tree")
  metadata(tree$S.id)
}
}
\keyword{utilities}

