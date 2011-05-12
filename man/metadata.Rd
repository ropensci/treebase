\name{metadata}
\alias{metadata}
\title{
  A function to query the metadata for a TreeBASE study 
}
\description{
  Queries the TreeBASE OAI-PMH API to return all the metadata associated with the study
}
\usage{
metadata(study.id, curl = getCurlHandle())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{study.id}{ A treebase study id, as a character string, numbers only.
}
  \item{curl}{See documentation for \code{getCurlHandle}
}
}

\value{
 Returns a list with all the metadata associated with a study
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


\examples{
  \dontrun{
# Manualy give a sudy id
  metadata("2377")

# Get metadata for results of any search_treebase query: 
  studies <- search_treebase("2377", by="id.study")
  metadata(studies$S.id)

  }
}
