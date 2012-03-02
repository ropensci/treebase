\name{cache_treebase}
\alias{cache_treebase}
\title{A function to cache the phylogenies in treebase locally}
\usage{
  cache_treebase(file = paste("treebase-", Sys.Date(), ".rda", sep = ""),
    pause1 = 3, pause2 = 3, attempts = 10, max_trees = Inf)
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
}
\value{
  saves a cached file of treebase
}
\description{
  A function to cache the phylogenies in treebase locally
}
\details{
  a good idea to let this run overnight
}

