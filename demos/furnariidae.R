require(treebase)
search_treebase("Derryberry", "author") -> a
tree <- a[[1]]
metadata(tree$S.id)
plot(tree)


# birth-death study
require(laser); require(TreePar)

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




























