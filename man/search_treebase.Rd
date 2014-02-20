\name{search_treebase}
\alias{search_treebase}
\title{A function to pull in the phyologeny/phylogenies matching a search query}
\usage{
search_treebase(input, by, returns = c("tree", "matrix"),
  exact_match = FALSE, max_trees = Inf, branch_lengths = FALSE,
  curl = getCurlHandle(), verbose = TRUE, pause1 = 2, pause2 = 1,
  attempts = 3, only_metadata = FALSE)
}
\arguments{
  \item{input}{a search query (character string)}

  \item{by}{the kind of search; author, taxon, subject,
  study, etc (see list of possible search terms, details)}

  \item{returns}{should the fn return the tree or the
  character matrix?}

  \item{exact_match}{force exact matching for author name,
  taxon, etc.  Otherwise does partial matching}

  \item{max_trees}{Upper bound for the number of trees
  returned, good for keeping possibly large initial queries
  fast}

  \item{branch_lengths}{logical indicating whether should
  only return trees that have branch lengths.}

  \item{curl}{the handle to the curl web utility for
  repeated calls, see the getCurlHandle() function in RCurl
  package for details.}

  \item{verbose}{logical indicating level of progress
  reporting}

  \item{pause1}{number of seconds to hesitate between
  requests}

  \item{pause2}{number of seconds to hesitate between
  individual files}

  \item{attempts}{number of attempts to access a particular
  resource}

  \item{only_metadata}{option to only return metadata about
  matching trees which lists study.id, tree.id, kind
  (gene,species,barcode) type (single, consensus) number of
  taxa, and possible quality score.}
}
\value{
either a list of trees (multiphylo) or a list of character
matrices
}
\description{
A function to pull in the phyologeny/phylogenies matching a
search query
}
\details{
Choose the search type.  Options are: \itemize{
\item{abstract }{ search terms in the publication abstract}
\item{author }{ match authors in the publication}
\item{subject }{ match subject} \item{doi }{ the unique
object identifier for the publication } \item{ncbi }{ NCBI
identifier number for the taxon} \item{kind.tree }{ Kind of
tree (Gene tree, species tree, barcode tree) }
\item{type.tree }{ type of tree (Consensus or Single)}
\item{ntax }{ number of taxa in the matrix} \item{quality
}{ A quality score for the tree, if it has been rated.  }
\item{study }{ match words in the title of the study or
publication} \item{taxon }{ taxon scientific name }
\item{id.study }{ TreeBASE study ID} \item{id.tree }{
TreeBASE's unique tree identifier (Tr.id)} \item{id.taxon
}{ taxon identifier number from TreeBase } \item{tree }{
The title for the tree} \item{type.matrix }{ Type of matrix
} \item{matrix }{ Name given the the matrix }
\item{id.matrix }{ TreeBASE's unique matrix identifier}
\item{nchar }{ number of characters in the matrix} }

The package provides partial support for character matrices
provided by TreeBASE. At the time of writing, TreeBASE
permits ambiguous DNA characters in these matrices, such as
`{CG}` indicating either a C or G, which is not supported
by any R interpreter, and thus may lead to errors.  for a
description of all possible search options, see
https://spreadsheets.google.com/pub?key=rL--O7pyhR8FcnnG5-ofAlw.
}
\examples{
\dontrun{
## defaults to return phylogeny
Huelsenbeck <- search_treebase("Huelsenbeck", by="author")

## can ask for character matrices:
wingless <- search_treebase("2907", by="id.matrix", returns="matrix")

## Some nexus matrices don't meet read.nexus.data's strict requirements,
## these aren't returned
H_matrices <- search_treebase("Huelsenbeck", by="author", returns="matrix")

## Use Booleans in search: and, or, not
## Note that by must identify each entry type if a Boolean is given
HR_trees <- search_treebase("Ronquist or Hulesenbeck", by=c("author", "author"))

## We'll often use max_trees in the example so that they run quickly,
## notice the quotes for species.
dolphins <- search_treebase('"Delphinus"', by="taxon", max_trees=5)
## can do exact matches
humans <- search_treebase('"Homo sapiens"', by="taxon", exact_match=TRUE, max_trees=10)
## all trees with 5 taxa
five <- search_treebase(5, by="ntax", max_trees = 10)
## These are different, a tree id isn't a Study id.  we report both
studies <- search_treebase("2377", by="id.study")
tree <- search_treebase("2377", by="id.tree")
c("TreeID" = tree$Tr.id, "StudyID" = tree$S.id)
## Only results with branch lengths
## Has to grab all the trees first, then toss out ones without branch_lengths
Near <- search_treebase("Near", "author", branch_lengths=TRUE)
 }
}
\keyword{utility}

