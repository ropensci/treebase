#long_examples.R
require(treebase)

Near <- search_treebase("Near", "author", branch_lengths=TRUE)

timetree <- function(tree){
    check.na <- try(sum(is.na(tree$edge.length))>0)
    if(is(check.na, "try-error") | check.na)
      NULL
    else
    try( chronoMPL(multi2di(tree)) )
}
drop_errors <- function(tr){
## apply to a list of trees created with timetree to drop errors
  tt <- tr[!sapply(tr, is.null)]
  tt <- tt[!sapply(tt, function(x) is(x, "try-error"))]
  print(paste("dropped", length(tr)-length(tt), "trees"))
  tt
}

tt <- drop_errors(sapply(Near, timetree))


require(laser)
pick_branching_model <- function(tree){
  m1 <- try(pureBirth(branching.times(tree)))
  m2 <- try(bd(branching.times(tree)))
  as.logical(try(m2$aic < m1$aic))
}

is_yule <- sapply(tt, pick_branching_model)
table(is_yule)



# Return all treebase trees that have branch lengths
# This has to download every tree in treebase, so not superfast...
all <- search_treebase("Consensus", "type.tree", branch_lengths=TRUE)
tt <- drop_errors(sapply(all, timetree))
is_yule <- sapply(tt, pick_branching_model)
table(is_yule)


## Some metadata queries and stats on these trees (note that the manipulations haven't lost the study-ids!
# Most trees with branches are recent additions
dates <- sapply(tt, function(x) metadata(x$S.id)[[1]]$date)
hist(as.numeric(dates), main="Trees with branch lengths included", xlab="year")


# Near[[1]] -> tree
# write.nexus(tree, file="ref.nex")
# system("./raxmlHPC -f e -t ref.nex -m GTRGAMMA -s ref.nex -n output.nex")


## add MEDUSA and TreePar examples






