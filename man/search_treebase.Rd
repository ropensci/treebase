\name{search_treebase}
\alias{search_treebase}
\title{
  Search all of TreeBASE and return phylogenetic trees  }
\description{
 Can search for phylogenies by given author, year, containing certain taxa, etc.  
 Most queries can be combined with Boolean logicals, see examples.
 Can also access certain metadata about the phylogenies and the studies in which 
 they were published.  
}
\usage{
search_treebase(input, by, exact_match = FALSE, max_trees = Inf, branch_lengths = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{input}{A character string, corresponding to the search term.  
               Taxon labels should be in quotations.  Can include booleans seperated
               by spaces ("Huelsenbeck and Ronquist"), otherwise spaces are ignored.
               See details.  
}
  \item{by}{
     The type of query, i.e. author, taxon, id.study.  See details for options.  
}
  \item{exact_match}{
  If FALSE (default), will match all cases that begin with string. 
}
  \item{max_trees}{
    (optional) integer Limit the number of trees returned. Useful particularly for testing/debugging queries.
    Default returns all matches. 
}
  \item{branch_lengths}{
    logical to return only trees with branch lengths (default is FALSE).  Still must download and read in all 
    trees matching the query, which may be slow.  
}
}
\details{
  by can be any of the following options, which correspond
  to the queries avialble to the phylo-ws API listed here:
  \url{http://spreadsheets.google.com/pub?key=rL--O7pyhR8FcnnG5-ofAlw}


            citation = "dcterms.bibliographicCitation",
            author = "dcterms.contributor", 
            subject = "dcterms.subject",
            id.matrix = "tb.identifier.matrix", 
            id.matrix.tb1 = "tb.identifer.matrix.tb1",
            ncbi = "tb.identifier.ncbi", 
            id.study = "tb.identifier.study",
            id.study.tb1 = "tb.identifier.study.tb1", 
            id.taxon = "tb.identifer.taxon",
            taxon.tb1 = "tb.identifier.taxon.tb1", 
            taxonVariant.tb1 = "tb.identifier.taxonVarient.tb1", 
            id.tree = "tb.identifier.tree",
            ubio = "tb.identifier.ubio", 
            kind.tree = "tb.kind.tree",
            nchar = "tb.nchar.matrix", 
            ntax = "tb.ntax.matrix",
            quality = "tb.quality.tree", 
            matrix = "tb.title.matrix",
            study = "tb.title.study", 
            taxon = "tb.title.taxon",
            taxonLabel = "tb.title.taxonLabel", 
            taxonVariant = "tb.title.taxonVariant",
            tree = "tb.title.tree", 
            type.matrix = "tb.type.matrix",
            type.tree = "tb.type.tree"
 
}
\value{
  Returns an object of class multiphylo if multiple phylogenetic trees are returned, or 
  of class phylo if only a single match is found.  Additionally returns the TreebASE study ID
  in which the tree is found as $S.id, and the TreeBASE tree id as $Tr.id.  These can 
  be useful for other queries, such as looking up meta-data.  
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
HR_trees <- search_treebase("Ronquist or Hulesenbeck", by=c("author", "author"))
Huelsenbeck <- search_treebase("Huelsenbeck", by="author")

## We'll often use max_trees in the example so that they run quickly, 
# notice the quotes for species.  
dolphins <- search_treebase('"Delphinus"', by="taxon", max_trees=5)

## can do exact matches
humans <- search_treebase('"Homo sapiens"', by="taxon", exact_match=TRUE, max_trees=10)

# all trees with 5 taxa
five <- search_treebase(5, by="ntax", max_trees = 10)

# These are different, a tree id isn't a Study id.  we report both
studies <- search_treebase("2377", by="id.study")
tree <- search_treebase("2377", by="id.tree")
c("TreeID" = tree$Tr.id, "StudyID" = tree$S.id)

# Only results wiht branch lengths
# Has to grab all the trees first, then toss out ones without branch_lengths
Near <- search_treebase("Near", "author", branch_lengths=TRUE)
length(Near)

#### Metadata examples ### 

# Use the OAI-PMH api to check out the metadata from the study in which tree is published:
metadata(Near[[1]]$S.id)

  }
}

