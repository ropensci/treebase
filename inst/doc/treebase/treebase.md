








```r
library(methods)
library(utils)
library(treebase)
```






```r
search_treebase("Delphinus", by="taxon")
search_treebase("Huelsenbeck", by="author")
```







```r
metadata <- search_metadata() 
```







```r
dates <- sapply(metadata, `[[`, "date")
pub <- sapply(metadata, `[[`, "publisher")
```







```r
pub_table <- sort(table(as.character(pub)), decreasing=TRUE)
```







```r
top_contributors <- names(head(pub_table,10))
pub[!(pub %in% top_contributors)] <- "Other"
```







```r
meta <- data.frame(publisher = as.character(pub), dates = dates)
require(ggplot2)
ggplot(meta) + geom_bar(aes(dates, fill = publisher))
```

![plot of chunk dates](http://farm8.staticflickr.com/7107/7004043079_e5cb0b150a_o.png) 





```r
tree_metadata <- cache_treebase(only_metadata=TRUE)
```







```r
kind <- table(sapply(tree_metadata, `[[`, "kind"))
gfm_table(kind) #pretty print
```



```
|   | Barcode Tree | Gene Tree | Species Tree |
|---|--------------|-----------|--------------|
| 1 | 11.00        | 301.00    | 10049.00     |
```






```r
type <- table(sapply(tree_metadata, `[[`, "type"))
gfm_table(type) 
```



```
|   | Consensus | Single  |
|---|-----------|---------|
| 1 | 3022.00   | 7354.00 |
```






```r
quality <- table(sapply(tree_metadata, `[[`, "quality"))
gfm_table(quality) 
```



```
|   | Alternative Tree | Preferred Tree | Suboptimal Tree | Unrated  |
|---|------------------|----------------|-----------------|----------|
| 1 | 76.00            | 270.00         | 15.00           | 10000.00 |
```







```r
genetrees <- search_treebase( "'Gene Tree'", by='kind.tree', only_metadata=TRUE )
```







```r
treebase <- cache_treebase()
```







```r
data(treebase)
```











```r
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
```

![plot of chunk taxagrowth](http://farm7.staticflickr.com/6220/7004048369_bd5603be10_o.png) 





```r
derryberry_results <- search_treebase("Derryberry", "author")
```







```r
ids <- lapply(derryberry_results, `[[`, "S.id")
meta <- lapply(ids, metadata)
```







```r
i <- which( sapply(meta, function(x) x$publisher == "Evolution" && x$date=="2011") )
derryberry <- derryberry_results[[i]]
```







```r
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
```







```r
aics <- sapply(models, `[[`, 'aic')
best_fit <- names(models[which.min(aics)])
```







```r
# Locale settings to be safe
Sys.setlocale(locale="C") -> locale
rm(list="locale") # clean up
```







```r
require(TreePar)
x<-sort(getx(derryberry), decreasing=TRUE)
```










```r
yule_models <- bd.shifts.optim(x, sampling = c(1,1,1,1), grid = 5, start = 0, end = 60, yule = TRUE)[[2]]
```










```r
birth_death_models <- bd.shifts.optim(x, sampling = c(1,1,1,1), grid = 5, start = 0, end = 60, yule = FALSE)[[2]]
```







```r
yule_aic <- sapply(yule_models, function(pars) 2 * (length(pars) - 1) + 2 * pars[1] )
birth_death_aic <- sapply(birth_death_models, function(pars) 2 * (length(pars) - 1) + 2 * pars[1] )
best_no_of_rates <- list(Yule = which.min(yule_aic), birth.death = which.min(birth_death_aic))
best_model <- which.min(c(min(yule_aic), min(birth_death_aic)))
```







```r
treebase <- cache_treebase()
```







```r
data(treebase)
```







```r
      have <- have_branchlength(treebase)
      branchlengths <- treebase[have]
```








```r
timetree <- function(tree){
    try( chronoMPL(multi2di(tree)) )
}
tt <- drop_nontrees(sapply(branchlengths, timetree))
```







```r
gammas <- sapply(tt,  gammaStat)
```







```r
qplot(gammas)
```

![plot of chunk gammadist](http://farm8.staticflickr.com/7111/6857964534_7135796a46_o.png) 





```r
p_values <- 2 * (1 - pnorm(abs(gammas)))
non_const <- sum(p_values < 0.025, na.rm=TRUE)/length(gammas)
```







```r
lambdas <- sapply(tt, function(x) yule(x)$lambda) 
ntaxa <- sapply(tt, Ntip) 
dat <- data.frame(taxa=ntaxa,lambda=lambdas, gammas=gammas)
ggplot(dat, aes(taxa, lambda)) + 
geom_point() + stat_smooth(method=lm, formula=y ~ x) + 
scale_x_log10() + scale_y_log10()
```

![plot of chunk diversification_rate](http://farm8.staticflickr.com/7095/7004079381_44ff56607e_o.png) 





```r
gfm_table(summary(lm(log(lambda) ~ log(taxa), dat)))
```



```
|             | Estimate | Std. Error | t value | Pr(> \vert t \vert ) |
|-------------|----------|------------|---------|----------------------|
| (Intercept) | 1.81     | 0.47       | 3.88    | 0.00                 |
| log(taxa)   | -0.17    | 0.11       | -1.53   | 0.13                 |
```






```r
ggplot(dat, aes(taxa, gammas)) + 
geom_point() + stat_smooth(method=lm, formula=y ~ x) +
scale_x_log10() 
```

![plot of chunk unnamed-chunk-4](http://farm8.staticflickr.com/7222/6857964970_fcb7d7f303_o.png) 

```r
gfm_table(summary(lm(gammas ~ log(taxa), dat)))
```



```
|             | Estimate | Std. Error | t value | Pr(> \vert t \vert ) |
|-------------|----------|------------|---------|----------------------|
| (Intercept) | -3.46    | 0.70       | -4.94   | 0.00                 |
| log(taxa)   | 1.40     | 0.17       | 8.18    | 0.00                 |
```







```r
save(list=ls(), file="treebase.rda")
```





