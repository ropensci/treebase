\name{metadata_table}
\alias{metadata_table}
\title{generate a table of all available metadata for TreeBASE entries}
\usage{
  metadata_table(phylo.md = NULL, oai.md = NULL)
}
\arguments{
  \item{phylo.md}{cached phyloWS (tree) metadata,
  (optional)}

  \item{oai.md}{cached OAI-PMH (study) metadata (optional)}
}
\value{
  a data frame of all available metadata, (as a data.table
  object) columns are: "Study.id", "Tree.id", "kind",
  "type", "quality", "ntaxa" "date", "publisher", "author",
  "title".
}
\description{
  generate a table of all available metadata for TreeBASE
  entries
}
\examples{
meta <- metadata_table()
meta[publisher \%in\% c("Nature", "Science") & ntaxa > 100 & kind == "Gene Tree",]
}

