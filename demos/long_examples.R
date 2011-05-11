#long_examples.R
require(XML)
require(RCurl)
require(ape)
require(treebase)

# Return all treebase trees that have branch lengths
all <- search_treebase("Consensus", "type.tree", branch_lengths=TRUE)
dates <- sapply(1:length(all) function(i) metadata(all[[i]]$S.id)[[1]]$date)
