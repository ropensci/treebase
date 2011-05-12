#long_examples.R
library(treebase)

Near <- search_treebase("Near", "author", branch_lengths=TRUE)

require(laser)
pick_branching_model <- function(tree){
  timetree <- multi2di(chronopl(tree, lambda=1))
  m1 <- pureBirth(branching.times(timetree))
  m2 <- bd(branching.times(timetree))
  m2$aic < m1$aic
}
is_yule <- sapply(Near, pick_branching_model)



# Return all treebase trees that have branch lengths
# This has to download every tree in treebase, so not superfast...
all <- search_treebase("Consensus", "type.tree", branch_lengths=TRUE)

# Most trees with branches are recent additions
dates <- sapply(1:length(all), function(i) metadata(all[[i]]$S.id)[[1]]$date)
hist(as.numeric(dates), main="Trees with branch lengths included", xlab="year")

is_yule <- (all, pick_branching_model)

