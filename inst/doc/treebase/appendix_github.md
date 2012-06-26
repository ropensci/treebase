<h1 id="appendix">Appendix</h1>
<h2 id="reproducible-computation-a-diversification-rate-analysis">Reproducible computation: A diversification rate analysis</h2>
<p>Different diversification models make different assumptions about the rate of speciation, extinction, and how these rates may be changing over time. The authors consider eight different models, implemented in the laser package <span class="citation">(Rabosky 2006)</span>. This code fits each of the eight models to that data:</p>
<pre class="sourceCode r"><code class="sourceCode r"><span class="kw">library</span>(ape)
<span class="kw">library</span>(laser)
bt &lt;- <span class="kw">branching.times</span>(derryberry)
models &lt;- <span class="kw">list</span>(
  <span class="dt">yule =</span> <span class="kw">pureBirth</span>(bt),  
  <span class="dt">birth_death =</span> <span class="kw">bd</span>(bt),     
  <span class="dt">yule.2.rate =</span> <span class="kw">yule2rate</span>(bt),
  <span class="dt">linear.diversity.dependent =</span> <span class="kw">DDL</span>(bt),    
  <span class="dt">exponential.diversity.dependent =</span> <span class="kw">DDX</span>(bt),
  <span class="dt">varying.speciation_rate =</span> <span class="kw">fitSPVAR</span>(bt),  
  <span class="dt">varying.extinction_rate =</span> <span class="kw">fitEXVAR</span>(bt),  
  <span class="dt">varying_both =</span> <span class="kw">fitBOTHVAR</span>(bt))</code></pre>
<p>Each of the model estimate includes an AIC score indicating the goodness of fit, penalized by model complexity (lower scores indicate better fits) We ask R to tell us which model has the lowest AIC score,</p>
<pre class="sourceCode r"><code class="sourceCode r">aics &lt;- <span class="kw">sapply</span>(models, function(model) model$aic)
best_fit &lt;- <span class="kw">names</span>(models[<span class="kw">which.min</span>(aics)])</code></pre>
<p>and confirm the result presented in E. P. Derryberry et al. <span class="citation">(2011)</span>; that the yule.2.rate model is the best fit to the data.</p>
<p>The best-fit model in the laser analysis was a Yule (net diversification rate) model with two separate rates. We can ask <code>TreePar</code> to see if a model with more rate shifts is favoured over this single shift, a question that was not possible to address using the tools provided in <code>laser</code>. The previous analysis also considers a birth-death model that allowed speciation and extinction rates to be estimated separately, but did not allow for a shift in the rate of such a model. In the main text we introduced a model from Stadler <span class="citation">(2011)</span> that permitted up to 3 change-points in the speciation rate of the Yule model,</p>
<pre class="sourceCode r"><code class="sourceCode r">yule_models &lt;- <span class="kw">bd.shifts.optim</span>(x, <span class="dt">sampling =</span> <span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">1</span>,<span class="dv">1</span>,<span class="dv">1</span>), 
  <span class="dt">grid =</span> <span class="dv">5</span>, <span class="dt">start =</span> <span class="dv">0</span>, <span class="dt">end =</span> <span class="dv">60</span>, <span class="dt">yule =</span> <span class="ot">TRUE</span>)[[<span class="dv">2</span>]]</code></pre>
<p>We can also compare the performance of models which allow up to three shifts while estimating extinction and speciation rates separately:</p>
<pre class="sourceCode r"><code class="sourceCode r">birth_death_models &lt;- <span class="kw">bd.shifts.optim</span>(x, <span class="dt">sampling =</span> <span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">1</span>,<span class="dv">1</span>,<span class="dv">1</span>), 
  <span class="dt">grid =</span> <span class="dv">5</span>, <span class="dt">start =</span> <span class="dv">0</span>, <span class="dt">end =</span> <span class="dv">60</span>, <span class="dt">yule =</span> <span class="ot">FALSE</span>)[[<span class="dv">2</span>]]</code></pre>
<p>The models output by these functions are ordered by increasing number of shifts.<br />We can select the best-fitting model by AIC score, which is slightly cumbersome in <code>TreePar</code> syntax. First compute the AIC scores of both the <code>yule_models</code> and the <code>birth_death_models</code> we fitted above,</p>
<pre class="sourceCode r"><code class="sourceCode r">yule_aic &lt;- 
<span class="kw">sapply</span>(yule_models, function(pars)
                    <span class="dv">2</span> * (<span class="kw">length</span>(pars) - <span class="dv">1</span>) + <span class="dv">2</span> * pars[<span class="dv">1</span>] )
birth_death_aic &lt;- 
<span class="kw">sapply</span>(birth_death_models, function(pars)
                            <span class="dv">2</span> * (<span class="kw">length</span>(pars) - <span class="dv">1</span>) + <span class="dv">2</span> * pars[<span class="dv">1</span>] )</code></pre>
<p>And then generate a list identifying which model has the best (lowest) AIC score among the Yule models and which has the best AIC score among the birth-death models,</p>
<pre class="sourceCode r"><code class="sourceCode r">best_no_of_rates &lt;- <span class="kw">list</span>(<span class="dt">Yule =</span> <span class="kw">which.min</span>(yule_aic), 
                         <span class="dt">birth.death =</span> <span class="kw">which.min</span>(birth_death_aic))</code></pre>
<p>The best model is then whichever of these has the smaller AIC value.</p>
<pre class="sourceCode r"><code class="sourceCode r">best_model &lt;- <span class="kw">which.min</span>(<span class="kw">c</span>(<span class="kw">min</span>(yule_aic), <span class="kw">min</span>(birth_death_aic)))</code></pre>
<p>which confirms that the Yule 2-rate<br />model is still the best choice based on AIC score. Of the eight models in this second analysis, only three were in the original set considered (Yule 1-rate and 2-rate, and birth-death without a shift), so we could by no means have been sure ahead of time that a birth death with a shift, or a Yule model with a greater number of shifts, would not have fitted better.</p>
<h1 id="references">References</h1>
<p>Derryberry, Elizabeth P., Santiago Claramunt, Graham Derryberry, R. Terry Chesser, Joel Cracraft, Alexandre Aleixo, Jorge Pérez-Emán, J. V. Remsen Jr, and Robb T. Brumfield. 2011. “LINEAGE DIVERSIFICATION AND MORPHOLOGICAL EVOLUTION IN A LARGE-SCALE CONTINENTAL RADIATION: THE NEOTROPICAL OVENBIRDS AND WOODCREEPERS (AVES: FURNARIIDAE).” <em>Evolution</em> (jul). doi:10.1111/j.1558-5646.2011.01374.x. <a href="http://doi.wiley.com/10.1111/j.1558-5646.2011.01374.x" title="http://doi.wiley.com/10.1111/j.1558-5646.2011.01374.x">http://doi.wiley.com/10.1111/j.1558-5646.2011.01374.x</a>.</p>
<p>Rabosky, Daniel L. 2006. “LASER: a maximum likelihood toolkit for detecting temporal shifts in diversification rates from molecular phylogenies.” <em>Evolutionary bioinformatics online</em> 2 (jan): 273–6. <a href="http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2674670\&amp;tool=pmcentrez\&amp;rendertype=abstract" title="http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2674670\&amp;tool=pmcentrez\&amp;rendertype=abstract">http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2674670\&amp;tool=pmcentrez\&amp;rendertype=abstract</a>.</p>
<p>Stadler, Tanja. 2011. “Mammalian phylogeny reveals recent diversification rate shifts.” <em>Proceedings of the National Academy of Sciences</em> 2011 (mar). doi:10.1073/pnas.1016876108. <a href="http://www.pnas.org/cgi/doi/10.1073/pnas.1016876108" title="http://www.pnas.org/cgi/doi/10.1073/pnas.1016876108">http://www.pnas.org/cgi/doi/10.1073/pnas.1016876108</a>.</p>
