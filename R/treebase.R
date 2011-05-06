# file: treebase.R
# author: Carl Boettiger <cboettig@gmail.com>
# date: 26 April 2011
# Description: Implementation of the TreeBASE API in R 
# Adapted from Gabriel Becker

# FIXME Needs error handling for timeouts, etc
# Close unused connections
get_nexus <- function(query){
  # imports phylogenetic trees from treebase
  # Args:
  #   query: a phylows formatted search, 
  #     see https://sourceforge.net/apps/mediawiki/treebase/index.php?title=API 
  # Returns:
  #   A list object containing all the trees matching the search (class phylo)
  con <- url(query)
  search_returns <- try(xmlParse(readLines(con)))
  close(con)
  if(is(search_returns, "try-error")){
    print("failed to parse query")
  } else {
    try(xpathApply(search_returns, "//rdf:li",
             function(x){
               # Open the page on each resource 
               thepage <- xmlAttrs(x, "rdf:resource")
               connection <- url(thepage)
               seconddoc <- xmlParse(readLines(connection))
               close(connection)
               ## use xpathApply to find and return the nexus files
               node <- try(xpathApply(seconddoc, "//x:item[x:title='Nexus file']", 
                                namespaces=c(x="http://purl.org/rss/1.0/"),
                                function(x){
                                  if(is.list(x))
                                    x = x[[1]]
                                  con <- url(xmlValue(x[["link"]]))
                                  nex <- try(read.nexus(con))
                                  if(is(nex, "try-error")){
                                    print("Resource unavailable")
                                    nex <- NULL
                                  }
                                  close(con)
                                  nex
                                }))
               if(is(node[[1]], "phylo")){
                 print("phylogeny obtained")
               } else {
                 print("phylogeny unaccessible")
               }
               node[[1]] 
          }))
  }
}     


search_treebase <- function(input, by=c("author", "taxon"), exact_match=FALSE,
                            section=c("study", "taxon", "matrix", "tree")){

  # Consider error handling to prevent combinations 
  # that are not supported (author by taxon, etc)
  section <- match.arg(section)
  search_type <- paste(section, "/find?query=", sep="")


# Choose the search type, for a description of all possible options, see
# https://spreadsheets.google.com/pub?key=rL--O7pyhR8FcnnG5-ofAlw 
  by <- match.arg(by)
  search_term <- switch(by,
                       author = "dcterms.contributor=",
                       taxon = "tb.title.taxon=") 
  if(by=="taxon"){
    input <- gsub(" +", "%20\\1", input) # whitespace to html space symbol
    input <- gsub("^+", "%22\\1", input) # html quote code at start
    input <- gsub("+$", "%22\\1", input) # html quote code at end
  }
  if(exact_match){
    search_term <- paste(search_term, "=", sep="") # exact match uses (==) 
  }
# Some fixed 
#Can be one of tree, study, or matrix. Each has nexus, nexml, rdf, and html versions 
  schema <- "tree"  
# We'll always use rss1 as the machine-readable format 
# could attempt to open a webpage instead with html format to allow manual user search
  format <- "&format=rss1"

  # combine into a search query
  # Should eventually update to allow for multiple query terms with booleans
  query <- paste("http://purl.org/phylo/treebase/dev/phylows/", search_type, 
                 search_term, input, format, "&recordSchema=", schema, sep="")
  print(query)
  get_nexus(query)
}





