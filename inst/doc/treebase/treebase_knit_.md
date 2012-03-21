<!--roptions dev="png", fig.width=7, fig.height=5, fig.path='ex-out-', tidy=FALSE, warning=FALSE, comment=NA, message=FALSE, cache=FALSE-->

<!--begin.rcode echo=FALSE 
render_gfm()
opts_knit$set(upload = TRUE)
## use flickr to upload with these options
require(socialR)
options(flickrOptions=list(
  description="https://github.com/ropensci/treebase/blob/master/inst/examples/",
    tags="phylogenetics"))
opts_knit$set(upload.fun = flickr.url)
require(ascii)
gfm_table <- function(x, ...) {
    y <- capture.output(print(ascii(x, ...), type = "org"))
    y <- gsub("[+]", "|", y)
    return(writeLines(y))
}

end.rcode-->



<!--begin.rcode libs
library(methods)
library(utils)
library(treebase)
end.rcode-->

<!--begin.rcode basicQueries, eval=FALSE
search_treebase("Delphinus", by="taxon")
search_treebase("Huelsenbeck", by="author")
end.rcode-->


<!--begin.rcode getmetadata
metadata <- search_metadata() 
end.rcode-->


<!--begin.rcode journals
dates <- sapply(metadata, `[[`, "date")
pub <- sapply(metadata, `[[`, "publisher")
end.rcode-->


<!--begin.rcode head_pub
pub_table <- sort(table(as.character(pub)), decreasing=TRUE)
end.rcode-->


<!--begin.rcode top_journals
top_contributors <- names(head(pub_table,10))
pub[!(pub %in% top_contributors)] <- "Other"
end.rcode-->


<!--begin.rcode dates
meta <- data.frame(publisher = as.character(pub), dates = dates)
require(ggplot2)
ggplot(meta) + geom_bar(aes(dates, fill = publisher))
end.rcode-->


<!--begin.rcode tree_metadata_cache
tree_metadata <- cache_treebase(only_metadata=TRUE)
end.rcode-->


<!--begin.rcode kind
kind <- table(sapply(tree_metadata, `[[`, "kind"))
gfm_table(kind) #pretty print
end.rcode-->

<!--begin.rcode type
type <- table(sapply(tree_metadata, `[[`, "type"))
gfm_table(type) 
end.rcode-->

<!--begin.rcode quality
quality <- table(sapply(tree_metadata, `[[`, "quality"))
gfm_table(quality) 
end.rcode-->


<!--begin.rcode only_metadata
genetrees <- search_treebase( "'Gene Tree'", by='kind.tree', only_metadata=TRUE )
end.rcode-->


<!--begin.rcode bulidcache, eval=FALSE
treebase <- cache_treebase()
end.rcode-->


<!--begin.rcode loadcachedtreebase
data(treebase)
end.rcode-->


<!--begin.rcode treestats
end.rcode-->


<!--begin.rcode taxagrowth
studyid <- sapply(tree_metadata,`[[`, 'S.id')
sid <- sapply(metadata, `[[`, 'identifier')
sid <- gsub(".*TB2:S(\\d*)", "\\1", sid)
matches <- sapply(sid, match, studyid)
Ntaxa <- sapply(matches, function(i)  tree_metadata[[i]]$ntax)
Ntaxa[sapply(Ntaxa, is.null)] <- NA
taxa <- data.frame(Ntaxa=as.numeric(unlist(Ntaxa)), meta)
ggplot(taxa, aes(dates, Ntaxa)) + 
  geom_point(position = 'jitter', alpha = .8) + 
  scale_y_log10() + stat_smooth(aes(group = 1))
end.rcode-->


<!--begin.rcode findderryberry
derryberry_results <- search_treebase("Derryberry", "author")
end.rcode-->


<!--begin.rcode filter
ids <- lapply(derryberry_results, `[[`, "S.id")
meta <- lapply(ids, metadata)
end.rcode-->


<!--begin.rcode matchderryberry
i <- which( sapply(meta, function(x) x$publisher == "Evolution" && x$date=="2011") )
derryberry <- derryberry_results[[i]]
end.rcode-->


<!--begin.rcode RR
require(laser)
tt <- branching.times(derryberry)
models <- list(             yule = pureBirth(tt),  
                     birth_death = bd(tt),     
                     yule.2.rate = yule2rate(tt),
      linear.diversity.dependent = DDL(tt),    
 exponential.diversity.dependent = DDX(tt),
         varying.speciation_rate = fitSPVAR(tt),  
         varying.extinction_rate = fitEXVAR(tt),  
                    varying_both = fitBOTHVAR(tt)  
              )
end.rcode-->


<!--begin.rcode extract_aic
aics <- sapply(models, `[[`, 'aic')
best_fit <- names(models[which.min(aics)])
end.rcode-->


<!--begin.rcode TreeSimError
# Locale settings to be safe
Sys.setlocale(locale="C") -> locale
rm(list="locale") # clean up
end.rcode-->


<!--begin.rcode treepar
require(TreePar)
x<-sort(getx(derryberry), decreasing=TRUE)
end.rcode-->


<!--begin.rcode treepar_yule, include=FALSE
yule_models <- bd.shifts.optim(x, sampling = c(1,1,1,1), grid = 5, start = 0, end = 60, yule = TRUE)[[2]]
end.rcode-->

<!--begin.rcode treepar_yule_show, eval=FALSE
yule_models <- bd.shifts.optim(x, sampling = c(1,1,1,1), grid = 5, start = 0, end = 60, yule = TRUE)[[2]]
end.rcode-->


<!--begin.rcode treepar_birthdeath, include=FALSE
birth_death_models <- bd.shifts.optim(x, sampling = c(1,1,1,1), grid = 5, start = 0, end = 60, yule = FALSE)[[2]]
end.rcode-->

<!--begin.rcode treepar_birthdeath_show, eval=FALSE
birth_death_models <- bd.shifts.optim(x, sampling = c(1,1,1,1), grid = 5, start = 0, end = 60, yule = FALSE)[[2]]
end.rcode-->


<!--begin.rcode aic_yule
yule_aic <- sapply(yule_models, function(pars) 2 * (length(pars) - 1) + 2 * pars[1] )
birth_death_aic <- sapply(birth_death_models, function(pars) 2 * (length(pars) - 1) + 2 * pars[1] )
best_no_of_rates <- list(Yule = which.min(yule_aic), birth.death = which.min(birth_death_aic))
best_model <- which.min(c(min(yule_aic), min(birth_death_aic)))
end.rcode-->


<!--begin.rcode meta_harvest, eval=FALSE
treebase <- cache_treebase()
end.rcode-->


<!--begin.rcode cachedcopy
data(treebase)
end.rcode-->


<!--begin.rcode branchlengthfilter
      have <- have_branchlength(treebase)
      branchlengths <- treebase[have]
end.rcode-->



<!--begin.rcode timetree
timetree <- function(tree){
    try( chronoMPL(multi2di(tree)) )
}
tt <- drop_nontrees(sapply(branchlengths, timetree))
end.rcode-->


<!--begin.rcode 
gammas <- sapply(tt,  gammaStat)
end.rcode-->


<!--begin.rcode gammadist
qplot(gammas)
end.rcode-->


<!--begin.rcode nonconst
p_values <- 2 * (1 - pnorm(abs(gammas)))
non_const <- sum(p_values < 0.025, na.rm=TRUE)/length(gammas)
end.rcode-->


<!--begin.rcode diversification_rate
lambdas <- sapply(tt, function(x) yule(x)$lambda) 
ntaxa <- sapply(tt, Ntip) 
dat <- data.frame(taxa=ntaxa,lambda=lambdas, gammas=gammas)
ggplot(dat, aes(taxa, lambda)) + 
geom_point() + stat_smooth(method=lm, formula=y ~ x) + 
scale_x_log10() + scale_y_log10()
end.rcode-->


<!--begin.rcode 
gfm_table(summary(lm(log(lambda) ~ log(taxa), dat)))
end.rcode-->

<!--begin.rcode 
ggplot(dat, aes(taxa, gammas)) + 
geom_point() + stat_smooth(method=lm, formula=y ~ x) +
scale_x_log10() 
gfm_table(summary(lm(gammas ~ log(taxa), dat)))
end.rcode-->


<!--begin.rcode save
save(list=ls(), file="treebase.rda")
end.rcode-->


