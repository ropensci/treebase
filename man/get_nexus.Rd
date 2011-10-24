\name{get_nexus}
\alias{get_nexus}
\title{imports phylogenetic trees from treebase. internal function}
\usage{
  get_nexus(query, max_trees = Inf, curl = getCurlHandle(),
  branch_lengths = FALSE, returns = "tree")
}
\arguments{
  \item{query}{: a phylows formatted search, see
  https://sourceforge.net/apps/mediawiki/treebase/index.php?title=API}
}
\value{
  A list object containing all the trees matching the
  search (class phylo)
}
\description{
  imports phylogenetic trees from treebase. internal
  function
}
\keyword{internal}

