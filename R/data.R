#' metadata.rda
#' 
#' All metadata from treebase publications, Created 2011-12-12
#' @name all
#' @docType data
#' @keywords data
#' @details recreate with \code{ 
#' all <- search_metadata("", by="all") 
#' }
NULL

#' branchlengths.rda
#' 
#' All treebase trees with branch length data, created 2011-12-12
#' @name branchlengths
#' @docType data
#' @keywords data
#' @details recreate with code: \code{
#' all_trees <- search_treebase("Consensus", "type.tree", branch_lengths=TRUE)
#' }

NULL

#' treebase.rda
#'
#' Contains a cache of all phylogenies search_treebase() function was able
#' to pull down when run  on 2011-12-12.  
#' @name all_treebase
#' @docType data
#' @keywords data
#' @details recreate with: \code{
#' all_treebase <- search_treebase("Consensus", "type.tree")
#' }
#'
NULL


#' derryberry.rda
#'
#' Created 2012-01-04
#' @name derryberry 
#' @docType data
#' @keywords data
#' @details recreate with: \code{
#' derryberry <- search_treebase("Derryberry", "author")[[1]]
#' }
#'
NULL




