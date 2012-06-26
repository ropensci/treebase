




















Appendix
========

Reproducible computation: A diversification rate analysis
---------------------------------------------------------

Different diversification models make different assumptions 
about the rate of speciation, extinction, and how these rates may be changing
over time.  The authors consider eight different models, implemented in the 
laser package [@rabosky2006b]. This code fits each of the eight models to that
data:



```r
library(ape)
library(laser)
bt <- branching.times(derryberry)
models <- list(
  yule = pureBirth(bt),  
  birth_death = bd(bt),     
  yule.2.rate = yule2rate(bt),
  linear.diversity.dependent = DDL(bt),    
  exponential.diversity.dependent = DDX(bt),
  varying.speciation_rate = fitSPVAR(bt),  
  varying.extinction_rate = fitEXVAR(bt),  
  varying_both = fitBOTHVAR(bt))
```




Each of the model estimate includes an AIC score indicating the goodness of
fit, penalized by model complexity (lower scores indicate better fits)
We ask R to tell us which model has the lowest AIC score,



```r
aics <- sapply(models, function(model) model$aic)
best_fit <- names(models[which.min(aics)])
```




and confirm the result presented in @derryberry2011; 
that the yule.2.rate model is the best fit to the data.  


The best-fit model in the laser analysis was a Yule (net diversification
rate) model with two separate rates.  We can ask ` TreePar ` to see if
a model with more rate shifts is favoured over this single shift,
a question that was not possible to address using the tools provided in
`laser`. The previous analysis also considers a birth-death model that 
allowed speciation and extinction rates to be estimated separately, but 
did not allow for a shift in the rate of such a model.  In the main text
we introduced a model from @stadler2011 that permitted up to 3 change-points
in the speciation rate of the Yule model,







```r
yule_models <- bd.shifts.optim(x, sampling = c(1,1,1,1), 
  grid = 5, start = 0, end = 60, yule = TRUE)[[2]]
```




We can also compare the performance of models which allow up to three
shifts while estimating extinction and speciation rates separately:






```r
birth_death_models <- bd.shifts.optim(x, sampling = c(1,1,1,1), 
  grid = 5, start = 0, end = 60, yule = FALSE)[[2]]
```




The models output by these functions are ordered by increasing number of shifts.  
We can select the best-fitting model by AIC score, which is slightly cumbersome 
in `TreePar` syntax.  First compute the AIC scores of both the `yule_models` and the 
`birth_death_models` we fitted above,



```r
yule_aic <- 
sapply(yule_models, function(pars)
                    2 * (length(pars) - 1) + 2 * pars[1] )
birth_death_aic <- 
sapply(birth_death_models, function(pars)
                            2 * (length(pars) - 1) + 2 * pars[1] )
```




And then generate a list identifying which model has the best (lowest) AIC score among the Yule models and 
which has the best AIC score among the birth-death models, 



```r
best_no_of_rates <- list(Yule = which.min(yule_aic), 
                         birth.death = which.min(birth_death_aic))
```




The best model is then whichever of these has the smaller AIC value.  



```r
best_model <- which.min(c(min(yule_aic), min(birth_death_aic)))
```





which confirms that the Yule 2-rate  
model is still the best choice based on AIC score.  Of the eight models 
in this second analysis, only three were in the original set considered 
(Yule 1-rate and 2-rate, and birth-death without a shift), so we could by
no means have been sure ahead of time that a birth death with a shift, or
a Yule model with a greater number of shifts, would not have fitted better.  


# References

