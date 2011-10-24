require(treebase)
search_treebase("Derryberry", "author")[[1]] -> tree
metadata(tree$S.id)
plot(tree)

# Other such trees
#others <- search_treebase("furnariidae", by="taxon")

# birth-death study
require(laser)
require(TreePar)

tt <- branching.times(tree)

models <-  list(pb = pureBirth(tt), 
                bdfit = bd(tt),
                y2r = yule2rate(tt), # yule model with single shift pt 
                ddl = DDL(tt), # linear, diversity-dependent
                ddx = DDX(tt), #exponential diversity-dendent
                sv = fitSPVAR(tt), # vary speciation in time
                ev = fitEXVAR(tt), # vary extinction in time
                bv = fitBOTHVAR(tt)# vary both 
                )

aics <- sapply(models, function(x) x$aic)
models[which.min(aics)]

# replace underscores in names with spaces
#names <- sapply(tree$tip.label, function(input) gsub("_", " ", input))

# Search treebase for any of these taxa
#others <- lapply(names, function(n) search_treebase(paste('"', n, '"', sep=""), by="taxon", exact=TRUE))

# run medusa on this tree -- seems to choke on size
#richness=data.frame(tree$tip.label, rep(1, tree$Nnode+1))
#out  <- runMedusa(tree,richness)
#summaryMedusa(tree, richness, out) 








