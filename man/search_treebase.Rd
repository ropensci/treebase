\name{search_treebase}
\alias{search_treebase}
\title{A function to pull in the phyologeny/phylogenies matching a search query}
\usage{
  search_treebase(input, by, returns = c("tree", "matrix"),
    exact_match = FALSE, max_trees = Inf,
    branch_lengths = FALSE, curl = getCurlHandle())
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
}
\value{
  either a list of trees (multiphylo) or a list of
  character matrices
}
\description{
  A function to pull in the phyologeny/phylogenies matching
  a search query
}
\details{
  Choose the search type.  Options are:
  abstract="dcterms.abtract", search terms in the
  publication abstract
  citation="dcterms.bibliographicCitation", author =
  "dcterms.contributor", match authors in the publication
  subject = "dcterms.subject", match subject id.matrix =
  "tb.identifier.matrix", id.matrix.tb1 =
  "tb.identifer.matrix.tb1", (TreeBASE 1 id #s, legacy)
  ncbi = "tb.identifier.ncbi", NCBI identifier number
  id.study = "tb.identifier.study", TreeBASE study ID
  id.study.tb1 = "tb.identifier.study.tb1", (legacy id)
  id.taxon = "tb.identifer.taxon", taxon.tb1 =
  "tb.identifier.taxon.tb1", (legacy taxon)
  taxonVariant.tb1 = "tb.identifier.taxonVarient.tb1",
  (legacy) id.tree = "tb.identifier.tree", TreeBASE tree
  identifier ubio = "tb.identifier.ubio", kind.tree =
  "tb.kind.tree", nchar = "tb.nchar.matrix", number of
  characters in the matrix ntax = "tb.ntax.matrix", number
  of taxa in the matrix quality="tb.quality.tree", matrix =
  "tb.title.matrix", study = "tb.title.study", study title
  taxon = "tb.title.taxon", taxon name taxonLabel =
  "tb.title.taxonLabel", taxonVariant =
  "tb.title.taxonVariant", tree = "tb.title.tree",
  type.matrix="tb.type.matrix", type.tree = "tb.type.tree")
  for a description of all possible search options, see
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

