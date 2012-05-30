\name{cache_treebase}
\alias{cache_treebase}
\title{A function to cache the phylogenies in treebase locally}
\usage{
  cache_treebase(file = paste("treebase-", Sys.Date(), ".rda", sep = ""),
    pause1 = 3, pause2 = 3, attempts = 10, max_trees = Inf,
    only_metadata = FALSE, save = TRUE)
}
\arguments{
  \item{file}{filename for the cache, otherwise created
  with datestamp}

  \item{pause1}{number of seconds to hesitate between
  requests}

  \item{pause2}{number of seconds to hesitate between
  individual files}

  \item{attempts}{number of attempts to access a particular
  resource}

  \item{max_trees}{maximum number of trees to return
  (default is Inf)}

  \item{only_metadata}{option to only return metadata about
  matching trees}

  \item{save}{logical indicating whether to save a file
  with the resuls.}
}
\value{
  saves a cached file of treebase
}
\description{
  A function to cache the phylogenies in treebase locally
}
\details{
  it's a good idea to let this run overnight
}
\examples{
\dontrun{
 treebase <- cache_treebase()
}
}

