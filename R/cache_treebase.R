#' A function to cache the phylogenies in treebase locally
#' 
#' @param file filename for the cache, otherwise created with datestamp
#' @param pause1 number of seconds to hesitate between requests
#' @param pause2 number of seconds to hesitate between individual files
#' @param attempts number of attempts to access a particular resource
#' @return saves a cached file of treebase
#' @details a good idea to let this run overnight
#'
cache_treebase <- function(file=paste("treebase-", Sys.Date(), ".rda",sep=""), pause1=2, pause2=2, attempts=20){
  treebase <- search_treebase("Consensus", "type.tree", pause1=pause1, pause2=pause2, attempts=attempts)
  save("treebase", file=file)
}

