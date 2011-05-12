get_nexus <- function(query, max_trees = Inf, curl=getCurlHandle(), branch_lengths=FALSE){
  # imports phylogenetic trees from treebase
  # Args:
  #   query: a phylows formatted search, 
  #     see https://sourceforge.net/apps/mediawiki/treebase/index.php?title=API 
  # Returns:
  #   A list object containing all the trees matching the search (class phylo)

  n_trees <- 0
  tt <- getURLContent(query, followlocation=TRUE, curl=curl)
  search_returns <- xmlParse(tt)

  if(is(search_returns, "try-error")){
    print("failed to parse query")
  } else {
    if(max_trees == Inf){
      max_trees <- "last()+1"
    } else {
      max_trees <- max_trees+1
    }
    try(xpathApply(search_returns, paste("//rdf:li[position()< ", max_trees, "]", sep=""),
             function(x){
               # Open the page on each resource 

               thepage <- xmlAttrs(x, "rdf:resource")
               target = getURLContent(thepage, followlocation=TRUE, curl=curl)
               seconddoc <- xmlParse(target)

               # Get the tree ID
               Tr.id <- gsub(".*Tr([1-9]+)+", "\\1", as.character(thepage))
              
               # Get the study ID  
               S.id <- xpathSApply(seconddoc, "//x:isDefinedBy", xmlValue, 
                           namespaces=c(x="http://www.w3.org/2000/01/rdf-schema#"))[2]
               S.id <- gsub(".*TB2:S([1-9]+)+", "\\1", S.id)

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
               node[[1]]$Tr.id <- Tr.id # add the TreeBASE tree.id to the phylogeny, so we can query its metadata
               node[[1]]$S.id <- S.id # add the TreeBASE id to the phylogeny, so we can query its metadata
               if(is(node[[1]], "phylo")){
                 print("phylogeny obtained")
               } else {
                 print("phylogeny unaccessible")
               }

               ## Return only trees that have branch lengths if asked to.  
               if(branch_lengths){
                 print("Checking for branch lengths")
                 if(is.null(node[[1]]$edge.length)){
                   out <- NULL 
                   print("no branch lengths")
                 } else {
                   out <- node[[1]]
                   print("has branch lengths")
                 }
               } else {
                 out <- node[[1]]
               }
                      
               out
            }))
  }
}     


search_treebase <- function(input, by, exact_match=FALSE, max_trees = Inf, branch_lengths=FALSE){
# 
# branch_lengths -- logical indicating whether should only return trees that have branch lengths.  


# Choose the search type, for a description of all possible options, see
# https://spreadsheets.google.com/pub?key=rL--O7pyhR8FcnnG5-ofAlw 

  nterms <- length(by)
  search_term <- character(nterms)
  section <- character(nterms)

  for(i in 1:nterms){
  search_term[i] <- switch(by[i],
                       abstract="dcterms.abtract",
                       citation="dcterms.bibliographicCitation",
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
                       quality="tb.quality.tree",
                       matrix = "tb.title.matrix",
                       study = "tb.title.study",
                       taxon = "tb.title.taxon",
                       taxonLabel = "tb.title.taxonLabel",
                       taxonVariant = "tb.title.taxonVariant",
                       tree = "tb.title.tree",
                       type.matrix="tb.type.matrix",
                       type.tree = "tb.type.tree")
  section[i] <- switch(by[i],
                       abstract= "study",
                       citation= "study",
                       author = "study",
                       subject = "study",
                       id.matrix ="matrix",  
                       id.matrix.tb1 = "matrix",
                       ncbi =  "taxon",
                       id.study = "study",
                       id.study.tb1 = "study",
                       id.taxon = "taxon",
                       taxon.tb1 = "taxon",
                       taxonVariant.tb1 = "taxon",
                       id.tree =  "tree",
                       ubio = "taxon",
                       kind.tree = "tree", 
                       nchar = "matrix",
                       ntax = "matrix",
                       quality = "tree",
                       matrix = "matrix",
                       study="study",
                       taxon = "taxon",
                       taxonLabel =  "taxon",
                       taxonVariant = "taxon", 
                       tree = "tree", 
                       type.matrix= "matrix",
                       type.tree = "tree")
  }
  if(!all(section == section[1]))
    stop("Multiple queries must belong to the same section (study/taxon/tree/matrix)")
  search_type <- paste(section[1], "/find?query=", sep="")

  search_term[1] <- paste(search_term[1], "=", sep="") 
  if(nterms > 1){
    for(i in 2:nterms){
      input <- sub("(and|or) ", paste("\\1%20", search_term[i], "=", sep=""), input)
    }
  }

  input <- gsub(" +", "%20\\1", input) # whitespace to html space symbol

  #if(by=="taxon"){
    input <- gsub("\"", "%22", input) # html quote code at start
  #}
  if(exact_match){
    search_term <- gsub("=", "==", search_term) # exact match uses (==) 
  }
# Some fixed 
#Can be one of tree, study, or matrix. Each has nexus, nexml, rdf, and html versions
# Probably needs to be "matrix" for those class of search items
  schema <- "tree"  
# We'll always use rss1 as the machine-readable format 
# could attempt to open a webpage instead with html format to allow manual user search
  format <- "&format=rss1"

  # combine into a search query
  # Should eventually update to allow for multiple query terms with booleans
  query <- paste("http://purl.org/phylo/treebase/dev/phylows/", search_type, 
                 search_term[1], input, format, "&recordSchema=", schema, sep="")
  print(query)
  out <- get_nexus(query, max_trees = max_trees, branch_lengths = branch_lengths)
  out <- out[!sapply(out, is.null)] # drop nulls

  class(out) <- "multiPhylo"
  # if returning one tree, don't make it a multiphylo list
  if(length(out) == 1) 
    out <- out[[1]]         
  out
}





