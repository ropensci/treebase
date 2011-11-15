#' imports phylogenetic trees from treebase. internal function
#' @param query : a phylows formatted search, 
#'     see https://sourceforge.net/apps/mediawiki/treebase/index.php?title=API
#' @param max_trees limits the number of trees returned
#' @param branch_lengths logical indicating if only trees with branch lengths 
#'  should be kept.  
#' @param returns should return the tree object or the matrix (of sequences)
#' @param curl the handle to the curl 
#' @return A list object containing all the trees matching the search 
#'    (of class phylo)
#' @import XML
#' @import RCurl
#' @import ape
#' @keywords internal
get_nexus <- function(query, max_trees = Inf, branch_lengths=FALSE, 
                      returns="tree", curl=getCurlHandle()){
  n_trees <- 0
  tt <- try(getURLContent(query, followlocation=TRUE, curl=curl))
  search_returns <- try(xmlParse(tt))

  if(is(search_returns, "try-error")){
    print("failed to parse query")
  } else {
    if(max_trees == Inf){
      max_trees <- "last()+1"
    } else {
      max_trees <- max_trees+1
    }
    try(xpathApply(search_returns, paste("//rdf:li[position()< ",
                                          max_trees, "]", sep=""),
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
                                  if(returns=="tree"){
                                    nex <- try(read.nexus(con))
                                  } else if (returns=="matrix"){
#                                 print(xmlValue(x[["link"]])) # print resource location
                                    nex <- try(read.nexus.data(xmlValue(x[["link"]])))
                                  }
                                  if(is(nex, "try-error")){
                                    print("Resource unavailable")
                                    nex <- NULL
                                  }
                                  close(con)
                                  nex
                                }))

               if(returns == "tree"){
                 node[[1]]$Tr.id <- Tr.id # tree id, for metadata queries
                 node[[1]]$S.id <- S.id # study id, for metadata queries 
               }

               if(is(node[[1]], "phylo")){
                 message("phylogeny obtained")
               } else if(is(node[[1]], "list")) {
                 print("alignment obtained")
               } else if(is.null(node[[1]])) {
                 print("phylogeny unaccessible")
               }

               ## Return only trees that have branch lengths if asked to. cannot apply to matrices 
               if(branch_lengths & returns=="tree"){
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

#' A function to pull in the phyologeny/phylogenies matching a search query
#' 
#' @param input a search query (character string)
#' @param by the kind of search; author, taxon, subject, study, etc
#' (see list of possible search terms, details)
#' @param returns should the fn return the tree or the character matrix?
#' @param exact_match force exact matching for author name, taxon, etc.  
#'   Otherwise does partial matching
#' @param max_trees Upper bound for the number of trees returned, good for
#' keeping possibly large initial queries fast
#' @param branch_lengths logical indicating whether should only return 
#'   trees that have branch lengths. 
#' @param curl the handle to the curl web utility for repeated calls, see
#'  the getCurlHandle() function in RCurl package for details.  
#' @return either a list of trees (multiphylo) or a list of character matrices
#' @keywords utility
#' @details Choose the search type.  Options are:
#'   abstract="dcterms.abtract", search terms in the publication abstract
#'   citation="dcterms.bibliographicCitation", 
#'   author = "dcterms.contributor", match authors in the publication
#'   subject = "dcterms.subject",  match subject
#'   id.matrix = "tb.identifier.matrix",
#'   id.matrix.tb1 = "tb.identifer.matrix.tb1", (TreeBASE 1 id #s, legacy)
#'   ncbi = "tb.identifier.ncbi", NCBI identifier number
#'   id.study = "tb.identifier.study", TreeBASE study ID
#'   id.study.tb1 = "tb.identifier.study.tb1", (legacy id) 
#'   id.taxon = "tb.identifer.taxon",
#'   taxon.tb1 = "tb.identifier.taxon.tb1", (legacy taxon)
#'   taxonVariant.tb1 = "tb.identifier.taxonVarient.tb1", (legacy)
#'   id.tree = "tb.identifier.tree", TreeBASE tree identifier
#'   ubio = "tb.identifier.ubio",
#'   kind.tree = "tb.kind.tree", 
#'   nchar = "tb.nchar.matrix", number of characters in the matrix
#'   ntax = "tb.ntax.matrix",  number of taxa in the matrix
#'   quality="tb.quality.tree", 
#'   matrix = "tb.title.matrix", 
#'   study = "tb.title.study", study title
#'   taxon = "tb.title.taxon", taxon name
#'   taxonLabel = "tb.title.taxonLabel", 
#'   taxonVariant = "tb.title.taxonVariant",
#'   tree = "tb.title.tree",
#'   type.matrix="tb.type.matrix",
#'   type.tree = "tb.type.tree")
#'   for a description of all possible search options, see
#'   https://spreadsheets.google.com/pub?key=rL--O7pyhR8FcnnG5-ofAlw. 
#' 
#' @examples \dontrun{
#' ## defaults to return phylogeny 
#' Huelsenbeck <- search_treebase("Huelsenbeck", by="author")
#'
#' ## can ask for character matrices:
#' wingless <- search_treebase("2907", by="id.matrix", returns="matrix")
#'
#' ## Some nexus matrices don't meet read.nexus.data's strict requirements,
#' ## these aren't returned
#' H_matrices <- search_treebase("Huelsenbeck", by="author", returns="matrix")
#'
#' ## Use Booleans in search: and, or, not
#' ## Note that by must identify each entry type if a Boolean is given
#' HR_trees <- search_treebase("Ronquist or Hulesenbeck", by=c("author", "author"))
#'
#' ## We'll often use max_trees in the example so that they run quickly, 
#' ## notice the quotes for species.  
#' dolphins <- search_treebase('"Delphinus"', by="taxon", max_trees=5)
#' ## can do exact matches
#' humans <- search_treebase('"Homo sapiens"', by="taxon", exact_match=TRUE, max_trees=10)
#' ## all trees with 5 taxa
#' five <- search_treebase(5, by="ntax", max_trees = 10)
#' ## These are different, a tree id isn't a Study id.  we report both
#' studies <- search_treebase("2377", by="id.study")
#' tree <- search_treebase("2377", by="id.tree")
#' c("TreeID" = tree$Tr.id, "StudyID" = tree$S.id)
#' ## Only results with branch lengths
#' ## Has to grab all the trees first, then toss out ones without branch_lengths
#'Near <- search_treebase("Near", "author", branch_lengths=TRUE)
#'  }
#' @export
search_treebase <- function(input, by, returns=c("tree", "matrix"),   
                            exact_match=FALSE, max_trees = Inf,
                            branch_lengths=FALSE, curl=getCurlHandle()){

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
  input <- gsub("\"", "%22", input) # html quote code at start
  if(exact_match){
    search_term <- gsub("=", "==", search_term) # exact match uses (==) 
  }

  returns <- match.arg(returns)
  schema <- switch(returns,
    tree = "tree",
    matrix = "matrix")

# We'll always use rss1 as the machine-readable format 
# could attempt to open a webpage instead with html format to allow manual user search
  format <- "&format=rss1"

  # combine into a search query
  # Should eventually update to allow for multiple query terms with booleans
  query <- paste("http://purl.org/phylo/treebase/phylows/", search_type, 
                 search_term[1], input, format, "&recordSchema=", schema, sep="")
  message(query)


    out <- get_nexus(query, max_trees = max_trees, branch_lengths =
                     branch_lengths, returns=returns, curl=curl)
    out <- out[!sapply(out, is.null)] # drop nulls

  if(schema=="tree"){
    class(out) <- "multiPhylo"
    # if returning one tree, don't make it a multiphylo list -- nice gesture but not good practice to vary output type
    # if(length(out) == 1) 
    #  out <- out[[1]]  
  } else if(schema=="matrix"){
    
  }
  out
}





