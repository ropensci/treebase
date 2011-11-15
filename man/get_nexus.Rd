\name{get_nexus}
\alias{get_nexus}
\title{imports phylogenetic trees from treebase. internal function}
\usage{
  get_nexus(query, max_trees = Inf, branch_lengths = FALSE,
    returns = "tree", curl = getCurlHandle())
}
\arguments{
  \item{query}{: a phylows formatted search, see
  https://sourceforge.net/apps/mediawiki/treebase/index.php?title=API}

  \item{max_trees}{limits the number of trees returned}

  \item{branch_lengths}{logical indicating if only trees
  with branch lengths should be kept.}

  \item{returns}{should return the tree object or the
  matrix (of sequences)}

  \item{curl}{the handle to the curl}
}
\value{
  A list object containing all the trees matching the
  search (of class phylo)
}
\description{
  imports phylogenetic trees from treebase. internal
  function
}
\keyword{internal}

