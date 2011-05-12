\name{get_study_id}
\alias{get_study_id}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  A function to get the TreeBASE study id
  }
\description{
  A simple function to grab the TreeBASE study id from the  query from search_metadata

}
\usage{
get_study_id(search_results)
}
\arguments{
  \item{search_results}{
  The output of \code{\link{search_metadata}} function
}
}
\details{
  Parses the \code{\link{search_metadata}} output to return just the study ids.
  This information can be passed to search_treebase to return the corresponding trees
}
\value{
  A character string with each element containing a TreeBASE study id.
}
\references{
 Project Development portal: \url{https://github.com/cboettig/treeBASE}
 TreeBASE phylo-ws API: \url{http://sourceforge.net/apps/mediawiki/treebase/index.php?title=API}
 TreeBASE OAI-PMH API: \url{http://sourceforge.net/apps/mediawiki/treebase/index.php?title=OAI-PMH}
 Dryad API: \url{https://datadryad.org/wiki/API}
}
\author{
Carl Boettiger \email{cboettig@gmail.com}
}

\seealso{
  \code{\link{search_metadata}}
  \code{\link{search_treebase}}

}
\examples{
  \dontrun{
    m <- search_metadata("2011-05-05", by="from")
    s <- get_study_id(m)
    out <- lapply(s, function(x) search_treebase(x, "id.study"))
  }
}
