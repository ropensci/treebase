# file: metadata.R
# author: Carl Boettiger <cboettig@gmail.com>
# date: 11 May 2011
# Description: Implementation of the TreeBASE API in R 
# With input from Ducan Temple Lang


# 

metadata <- function(study.id, curl=getCurlHandle()){
  # Get the metadata associated with the study in which the phylogeny was published.
  # if the tree is imported with search_treebase, then this is in tree$S.id:
  # Note that this is not the Tree ID, tree$Tr.id   
  #
  # Examples: 
  #   tree <- search_treebase("1234", "id.tree")
  #   metadata(tree$S.id)
  #   

  oai_url <- "http://treebase.org/treebase-web/top/oai?verb=" 
  get_record <- "GetRecord&metadataPrefix=oai_dc&identifier=" 
  query <- paste(oai_url, get_record, "TB:s", study.id, sep="")
  oai_metadata(query, curl=curl)
}


search_metadata <- function(query, by=c("until", "from", "all"), curl=getCurlHandle()){
# query must be a date in format yyyy-mm-dd
# search_metadata(2010-01-01, by="until")
# all isn't a real query type, but will return all trees regardless of date
  by = match.arg(by)
  oai_url <- "http://treebase.org/treebase-web/top/oai?verb=" 
  list_record <- "ListRecords&metadataPrefix=oai_dc&"
  midnight <- "T00:00:00Z"
  query <- paste(oai_url, list_record, by, "=", query, midnight, sep="")
  oai_metadata(query, curl=curl)
}



get_study_id <- function(search_results){
  sapply(1:length(search_results), 
          function(i){
            id <- search_results[[i]]$identifier
            id <- sub(".*TB2:S(\\d+)+", "\\1", id)
          })
}

dryad_metadata <- function(study.id, curl=getCurlHandle()){
  # Example: 
  #   dryad_metadata("10255/dryad.12")
  
  oai_url <- "http://www.datadryad.org/oai/request?verb=" 
  get_record <- "GetRecord&metadataPrefix=oai_dc&identifier=" 
  query <- paste(oai_url, get_record, "oai:datadryad.org:", study.id, sep="")
  oai_metadata(query, curl=curl)
}



oai_metadata <- function(query, curl=curl){
  print(query)
  tt <- getURLContent(query, followlocation=TRUE, curl=curl)
  doc <- xmlParse(tt)
  dc = getNodeSet(doc, "//dc:dc", namespaces=c(dc="http://www.openarchives.org/OAI/2.0/oai_dc/"))
  lapply(dc, xmlToList)
}


