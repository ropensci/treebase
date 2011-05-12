\name{dryad_metadata}
\alias{dryad_metadata}
\title{
  A function to download and parse the metadata associated with a given Dryad study ID
}
\description{
  Accesses the Dryad API to search for a study by id and return all information associated with it.
}
\usage{
dryad_metadata(study.id, curl = getCurlHandle())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{study.id}{ A Dryad study id, as a character
}
  \item{curl}{ See documentation for \code{getCurlHandle}
}
}
\details{
  Returned values as documented in the Dryad API
}
\value{
  Returns a list structure containing the metadata for the study
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
    dryad_metadata("10255/dryad.12")
  }
}

