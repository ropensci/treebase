# Helper functions for common analyses


#' Search the PhyloWS metadata 
#' 
#' @param x one of "Study.ids", "Tree.ids", "kind", "type", "quality", "ntaxa"
#' @param metadata returned from \code{search_treebase} function. 
#' if not specified will download latest copy of PhyloWS metadata from treebase.  Pass
#' in search results value during repeated calls to speed function runtime substantially
#' @param ... additional arguments to \code{search_treebase}
#' @return a list of the values matching the query
#' @examples
#' \dontrun{
#'      # calls will work without a metadata object
#'      kind <- phylo_metadata("kind")
#'      type <- phylo_metadata("type") 
#'      table(kind, type)
#'      }
#'      # but are much faster if the data object is provided, see cache_treebase():
#'      data(treebase)
#'      kind <- phylo_metadata("kind", metadata=treebase)
#'      type <- phylo_metadata("type", metadata=treebase) 
#'      table(kind, type)
#' 
#' @export
phylo_metadata <- function(x =  c("Study.id", "Tree.id", "kind", "type", "quality", "ntaxa"), metadata=NULL, ...){
  x = match.arg(x)
# Aliases
  x <- gsub("Study.id", "S.id", x)
  x <- gsub("Tree.id", "Tr.id", x)
  x <- gsub("ntaxa", "ntax", x)
  if(is.null(metadata))
    metadata <- cache_treebase(only_metadata=TRUE, save=FALSE)
  sapply(metadata, `[[`, x)
}


#' Search the OAI-PMH metadata by date, publisher, or identifier
#' 
#' @param x one of "date", "publisher", "identifier" for the study
#' @param metadata returned from \code{search_metadata} function. 
#' if not specified will download latest copy from treebase.  Pass
#' in the value during repeated calls to speed function runtime substantially
#' @param ... additional arguments to \code{search_metadata}
#' @return a list of values matching the query
#' @examples
#' \dontrun{
#'     dates <- oai_metadata("date") 
#'     pub <- oai_metadata("publisher")
#'     table(dates, pub)
#' }
#' @export
oai_metadata <- function(x = c("date", "publisher", "author", "title", "Study.id", "attributes"), metadata=NULL, ...){
  x = match.arg(x)
# Aliases
  x <- gsub("attributes", ".attr", x)
  x <- gsub("author", "creator", x)
  x <- gsub("Study.id", "identifier", x)
  if(is.null(metadata))
    metadata <- search_metadata(...)
  out <- sapply(metadata, `[[`, x)
  if(x == "identifier")
    out <- gsub(".*TB2:S(\\d*)", "\\1", out)
  as.character(out) # avoid list object returns
}



