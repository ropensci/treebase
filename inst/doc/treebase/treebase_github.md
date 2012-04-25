cboettig@ucdavis.edu

[cor1]Corresponding author.

1.  TreeBASE is an important and rapidly growing repository of
    phylogenetic data. The R statistical environment has become a
    primary tool for the applied phylogenetic analyses that use this
    kind of data for across a range of questions, from comparative
    evolution to community ecology to conservation planning.

2.  We have developed `treebase`, an open-source package (freely
    available from
    [http://cran.r-project.org/web/packages/treebase](http://cran.r-project.org/web/packages/treebase))
    for the R environment, providing simplified, programmatic and
    interactive access to phylogenetic data in the TreeBASE repository.

3.  We illustrate how this package creates a bridge between the
    repository and the rapidly growing ecosystem of R packages for
    phylogenetics that can reduce barriers to discovery and integration
    across phylogenetic research.

4.  We provide examples of the utility of the `treebase` package by
    replicating and extending several previous phylogenetic comparative
    analyses on identifying shifts in lineage diversification rate and
    run these across 1000s of phylogenies automatically.

R software API TreeBASE tools e-science

Introduction
============

Applications that use phylogenetic information as part of their analyses
are becoming increasingly central to both evolutionary and ecological
research. The exponential growth in genetic sequence data available for
all forms of life has driven rapid advances in the methods that can
infer the phylogenetic relationships and divergence times across
different taxa [@Huelsenbeck2001b, @Stamatakis2006, @Drummond2007]. Just
as the availability of sequence data has led to the subsequent explosion
of phylogenetic methods, and many other avenues of research, this rapid
expanse of phylogenetic data now primes new innovations across ecology
and evolution. Once again the product of one field has become the raw
data of the next. Unfortunately, while the discipline of bioinformatics
has emerged to help harness and curate the wealth of genetic data with
cutting edge computer science, statistics, and internet technology, its
counterpart in evolutionary informatics remains “scattered, poorly
documented, and in formats that impede discovery and integration”
[@Parr2011a]. Our goal when developing the `treebase` package was to
address this gap by providing how programmatic and interactive access
between the repositories that store this data and the software tools
commonly used to analyze them.

Our focus is primarily on such applications which use, rather than
generate, phylogenetic data, and thus stand to benefit the most from
programmatic and interactive access to TreeBASE. While the task of
inferring phylogenies from sequence data remains dominated by dedicated
compiled software such as MrBayes [@Huelsenbeck2001b], BEAST
[@Drummond2007], RAXML [@Stamatakis2006], the ever-growing suite of
research methods that use these phylogenies as input data are largely
based in R. The R statistical environment [@RTeam2012] has become a
dominant platform for researchers using phylogenetic data to address a
rapidly expanding set of questions in ecological and evolutionary
processes. These methods include but are not limited to tasks such as
ancestral state reconstruction [@Paradis2004, @Butler2004],
diversification analysis [@Paradis2004, @Rabosky2006b, @Harmon2008,
@FitzJohn2009, @FitzJohn2010, @Goldberg2011, @Stadler2011], quantifying
the rate and tempo of trait evolution [@Butler2004, @Paradis2004,
@Harmon2008, @Hipp2010, @Revell2011, @Eastman2011], identifying
evolutionary influences and proxies for community ecology [@Webb2008,
@Kembel2010], performing phyloclimatic modelling [@Warren2008,
@Evans2009b], and simulation of speciation and character evolution
[@Harmon2008, @Stadler2011a, @Boettiger2012], as well as various
manipulation and visualization of phylogenetic data [@Paradis2004,
@Schliep2010, @Jombart2010, @Revell2011]. A more comprehensive list of R
packages by analysis type is available on the phylogenetics taskview,
[http://cran.r-project.org/web/views/Phylogenetics.html](http://cran.r-project.org/web/views/Phylogenetics.html).
Several programs exist outside the R language for applied phylogenetic
methods, incuding Java [@Maddison2011], MATLAB [@Blomberg2003] and
Python [@Sukumaran2010] and online interfaces [@Martins2004].

TreeBASE ([http://treebase.org](http://treebase.org)) is an online
repository of phylogenetic data (e.g. trees of species, populations, or
genes) that have been published in a peer-reviewed academic journal,
book, thesis or conference proceedings [@Sanderson1994b, @Morell1996].
The database can be searched through an online interface which allows
users to find a phylogenetic tree from a particular publication, author
or taxa of interest. TreeBASE provides an application programming
interface (API) that lets computer applications make queries to the
database. Our `treebase` package uses this API to create a direct link
between this data and the R language, making it easier for users and
developers to take advantage of this data.

We provide three kinds of examples to illustrate what such programmatic
and interactive access could mean for applied phylogenetics research.
The first illustrates the process of exploration and discovery of
available data to characterize the kind of data available in TreeBASE
and illustrate its rapid increase in both the number and size of
phylogenies provided. The second example focuses on reproducible
research using a more detailed analysis of a single phylogeny, in which
we replicate some results from an existing paper and extend the analysis
to more recently developed methods. In the third example we take all of
TreeBASE as our scope for a meta-analysis on diversification rates,
illustrating full potential of interactive and programmatic access to
the repository.

Basic Queries
-------------

The basic functions of the TreeBASE API allow search queries through two
separate interfaces. The `OAI-PMH` interface provides the metadata
associated with the publications from which the phylogenies have been
taken, while the `Phylo-WS` interface provides information and access to
the phylogenetic data itself. These interfaces are well-documented on
the TreeBASE website. The `treebase` package allows these queries to be
made directly from R, just as a user would make them from the browser.
Because the queries can be implemented programmatically in R, a user can
construct more complicated filters than permitted by the web interface,
and can maintain a record of the queries they used to collect their data
as an R script. The ability to script this data-gathering step of
research can go a long way to reducing errors and ensuring that an
analysis can be replicated later, by the author or other groups
[@Peng2011a].

Any of the queries available on the web interface can now be made
directly from R, including downloading and importing the phylogeny into
the R interface. For instance, one can search for phylogenies containing
dolphin taxa, “Delphinus,” or all phylogenies submitted by a given
author, “Huelsenbeck”,

~~~~ {.r}
    search_treebase("Delphinus", by="taxon")
    search_treebase("Huelsenbeck", by="author")
~~~~

This function loads the matching phylogenies into R, ready for analysis.
The package documentation provides many examples of possible queries.
The `search_treebase` function is the heart of the `treebase` package.
While basic queries such as these seem simple, we present several
use-cases of how this programmatic access can be leveraged to allow
rapid exploration of phylogenetic data that opens doors to faster and
easier verification of results and also new kinds of analysis and new
scales of analysis.

To illustrate this potential, we introduce the second core function,
`search_metadata`, which provides metadata about the resources available
in the TreeBASE repository. Using programmatic access to this metadata
and standard analysis tools available in R, we can quickly paint an
up-to-the-minute picture of the data currently available TreeBASE. We
will then return to our `search_treebase` function to illustrate several
ways we can take advantage of the programmatic access to the data.

Quantifying TreeBASE
====================

The `treebase` package provides access to the metadata of all
publications containing trees deposited in TreeBASE using a separate API
built on the OAI-PMH protocol, an international web standard such data.
This can help the user discover phylogenies of interest and also allows
the user to perform statistical analyses on the data deposition itself,
which could identify trends or biases in the phylogenetics literature.

The following command downloads the metadata for all publications
associated with TreeBASE. (An optional argument can restrict searches to
a given date range)

~~~~ {.r}
    metadata <- search_metadata() 
~~~~

    Error: could not find function "getClass"

This returns an R list object, in which each element is an entry with
bibliographic information corresponding to a published study that has
deposited data in TreeBASE. From the length of this list we see that
there are currently prettyNum(length(metadata)) published studies in the
database.

R provides a rich statistical environment in which we can extract and
visualize the data we have just obtained. For instance, we may wish to
obtain a list of all the dates of publication & names of the journals
(publishers) that have submitted data:

~~~~ {.r}
    dates <- sapply(metadata, `[[`, "date")
~~~~

    Error: object of type 'symbol' is not subsettable

~~~~ {.r}
    pub <- sapply(metadata, `[[`, "publisher")
~~~~

    Error: object of type 'symbol' is not subsettable

which we organize into a table,

\`\`\` {R head\_pub, comment=NA } pub\_table <-
sort(table(as.character(pub)), decreasing=TRUE) \`\`\`\`

Many journals have only a few submissions, so we will group them
together as “Other”:

~~~~ {.r}
    top_contributors <- names(head(pub_table,10))
~~~~

    Error: object 'pub_table' not found

~~~~ {.r}
    pub[!(pub %in% top_contributors)] <- "Other"
~~~~

    Error: object 'pub' not found

We can then look at the distribution of publication years for
phylogenies deposited in TreeBASE, color coding by publisher in Fig
[fig:1]. Note that no single journal dominates the submissions, and
taxa-specific publications as well as more broad-scope journals share
the top ten spots. It will be interesting to watch these trends as more
journals extend mandatory archiving requirements over the coming years.

~~~~ {.r}
    meta <- data.frame(publisher = as.character(pub), dates = dates)
~~~~

    Error: object 'pub' not found

~~~~ {.r}
    require(ggplot2)
    ggplot(meta) + geom_bar(aes(dates, fill = publisher))
~~~~

    Error: object 'meta' not found

Histogram of publication dates by year, with the code required to
generate the figure.[fig:1]

In addition to this information about the publications, we can obtain
metadata about the phylogenies themselves, including the study
identifier number of where they were published, the number of taxa in
the tree, a quality score (if available), kind of tree (gene tree,
species tree, or barcode tree) and whether the phylogeny represents a
single or consensus type.

~~~~ {.r}
    tree_metadata <- cache_treebase(only_metadata=TRUE)
~~~~

For instance, we can summarize how the length(tree~m~etadata) trees
break out by kind or type (The `xtable` command formats this as a
table):

<!-- change to multifactor tables at least -->



~~~~ {.r}
    kind <- table(sapply(tree_metadata, `[[`, "kind"))
    xtable::xtable(kind) 
~~~~

<!-- html table generated in R 2.15.0 by xtable 1.7-0 package -->
<!-- Wed Apr 25 14:00:08 2012 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> 
V1
</TH>  </TR>
  <TR> <TD align="right"> 
Barcode Tree
</TD> <TD align="right">  
11
</TD> </TR>
  <TR> <TD align="right"> 
Gene Tree
</TD> <TD align="right"> 
317
</TD> </TR>
  <TR> <TD align="right"> 
Species Tree
</TD> <TD align="right"> 
10121
</TD> </TR>
   </TABLE>





~~~~ {.r}
    type <- table(sapply(tree_metadata, `[[`, "type"))
    xtable::xtable(type) 
~~~~

<!-- html table generated in R 2.15.0 by xtable 1.7-0 package -->
<!-- Wed Apr 25 14:00:08 2012 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> 
V1
</TH>  </TR>
  <TR> <TD align="right"> 
Consensus
</TD> <TD align="right"> 
3058
</TD> </TR>
  <TR> <TD align="right"> 
Single
</TD> <TD align="right"> 
7406
</TD> </TR>
   </TABLE>



~~~~ {.r}
    quality <- table(sapply(tree_metadata, `[[`, "quality"))
    xtable::xtable(quality) 
~~~~

<!-- html table generated in R 2.15.0 by xtable 1.7-0 package -->
<!-- Wed Apr 25 14:00:09 2012 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> 
V1
</TH>  </TR>
  <TR> <TD align="right"> 
Alternative Tree
</TD> <TD align="right">  
78
</TD> </TR>
  <TR> <TD align="right"> 
Preferred Tree
</TD> <TD align="right"> 
275
</TD> </TR>
  <TR> <TD align="right"> 
Suboptimal Tree
</TD> <TD align="right">  
15
</TD> </TR>
  <TR> <TD align="right"> 
Unrated
</TD> <TD align="right"> 
10081
</TD> </TR>
   </TABLE>




It is possible to use the `only_metadata` option with `search_treebase`
as well. While this information is always returned by the query, this is
useful for a quick look at the data matching any search, such as

~~~~ {.r}
      only_metadata 
~~~~

    Error: object 'only_metadata' not found

~~~~ {.r}
    genetrees <- search_treebase( "'Gene Tree'", by='kind.tree', only_metadata=TRUE )
~~~~

which returns just the metadata for the length(genetrees) gene trees in
the database, from which we can look up the corresponding publication
information.

For certain applications a user may wish to download all the available
phylogenies from TreeBASE. Using the `cache_treebase` function allows a
user to download a local copy of all trees. Because direct database
dumps are not available, this function has intentional delays to avoid
overtaxing the TreeBASE servers, and should be allowed a full day to
run.

~~~~ {.r}
    treebase <- cache_treebase()
~~~~

Once run, the cache is saved compactly in memory where it can be easily
and quickly restored. For convenience, the `treebase` package comes with
a copy already cached, which can be loaded into memory.

~~~~ {.r}
      loadcachedtreebase 
~~~~

    Error: object 'loadcachedtreebase' not found

~~~~ {.r}
    data(treebase)
~~~~

Having access to both the metadata from the studies and from the
phylogenies in R lets us quickly combine these data sources in
interesting ways. For instance, with a few commands we can visualize how
the number of taxa on submitted phylogenies has increasing over time,
Figure [fig:2].

~~~~ {.r}
    studyid <- sapply(tree_metadata,`[[`, 'S.id')
    sid <- sapply(metadata, `[[`, 'identifier')
~~~~

    Error: object of type 'symbol' is not subsettable

~~~~ {.r}
    sid <- gsub(".*TB2:S(\\d*)", "\\1", sid)
~~~~

    Error: object 'sid' not found

~~~~ {.r}
    matches <- sapply(sid, match, studyid)
~~~~

    Error: object 'sid' not found

~~~~ {.r}
    Ntaxa <- sapply(matches, function(i)  tree_metadata[[i]]$ntax)
~~~~

    Error: object 'matches' not found

~~~~ {.r}
    Ntaxa[sapply(Ntaxa, is.null)] <- NA
~~~~

    Error: object 'Ntaxa' not found

~~~~ {.r}
    taxa <- data.frame(Ntaxa=as.numeric(unlist(Ntaxa)), meta)
~~~~

    Error: object 'Ntaxa' not found

~~~~ {.r}
    ggplot(taxa, aes(dates, Ntaxa)) + 
      geom_point(position = 'jitter', alpha = .8) + 
      scale_y_log10() + stat_smooth(aes(group = 1))
~~~~

    Error: object 'taxa' not found

Combining the metadata available from publications and from phylogenies
themselves, we can visualize the growth in taxa on published
phylogenies. Note that the maximum size tree deposited each year is
growing far faster than the average number.[fig:2]

The promise of this exponential growth in the sizes of available
phylogenies, with some trees representing


    Error in eval(expr, envir, enclos) : object 'taxa' not found

taxa motivates the more and more ambitious inference methods being
developed which require large trees to have adequate signal
[@Boettiger2012, @FitzJohn2009, @Beaulieu2012]. It will be interesting
to see how long into the future this trend is maintained. These
visualizations help identify research trends and can also help identify
potential data sets for analyses. In this next section we highlight a
few ways in which programmatic access can be leveraged for various
research objectives.

Reproducible research
=====================

Reproducible research has become a topic of increasing concern in recent
years [@Schwab2000, @Gentleman2004, @Peng2011b].\
Access to data and executable scripts that reproduce the results
presented are two central elements of this process which are addressed
by the `treebase` package.

For example, you may like to know whether the shifts in speciation rate
identified by Derryberry et al. generated using methods in the R package
`laser` [@Rabosky2006b] differ from those using the newer methods
presented in @Stadler2011, which can include models of shifts not
available in the earlier package. The `treebase` package can help us
both verify the results presented and test the data against the newer
method with little additional effort.

Obtaining the tree
------------------

By drawing on the rich data manipulation tools available in R which
should be familiar to the large R phylogenetics community, the
`treebase` package allows us to construct richer queries than are
possible through TreeBASE alone. We begin our search by asking for a
phylogenies by one of the paper’s authors:

~~~~ {.r}
derryberry_results <- search_treebase("Derryberry", "author")
~~~~

This shows several results. We would like the phylogeny appearing in
*Evolution* in 2011. Each phylogeny includes a TreeBASE study id number,
stored in the `S.id` element, which we use to look up the metadata for
each paper.

~~~~ {.r}
ids <- lapply(derryberry_results, `[[`, "S.id")
meta <- lapply(ids, metadata)
~~~~

We can then look through the metadata to find the study matching our
description.

~~~~ {.r}
i <- which( sapply(meta, function(x) x$publisher == "Evolution" &&
x$date=="2011") )
derryberry <- derryberry_results[[i]]
~~~~

This is simply one possible path to identify the correct study,
certainly this query could be constructed in other ways, including
direct access by the study identifier.

Having successfully imported the phylogenetic tree corresponding to this
study, we can quickly replicate their analysis of which diversification
process best fits the data. Different diversification models make
different assumptions about the rate of speciation, extinction, and how
these rates may be changing over time.\
The authors consider eight different models, implemented in the laser
package [@Rabosky2006b]. This code fits each of the eight models to that
data:

~~~~ {.r}
library(ape)
bt <- branching.times(derryberry)
library(laser)
models <- list(             yule = pureBirth(bt),  
                     birth_death = bd(bt),     
                     yule.2.rate = yule2rate(bt),
      linear.diversity.dependent = DDL(bt),    
 exponential.diversity.dependent = DDX(bt),
         varying.speciation_rate = fitSPVAR(bt),  
         varying.extinction_rate = fitEXVAR(bt),  
                    varying_both = fitBOTHVAR(bt)  
              )
~~~~

Each of the model estimate includes an AIC score indicating the goodness
of fit, penalized by model complexity (lower scores indicate better
fits) We ask R to tell us which model has the lowest AIC score,

~~~~ {.r}
aics <- sapply(models, `[[`, 'aic')
best_fit <- names(models[which.min(aics)])
~~~~

and confirm the result presented in @Derryberry2011, that the
yule.2.rate model is the best fit to the data.

In this fast-moving field, new methods often become available within the
time-frame that another manuscript is submitted by its authors and the
time at which if first appears in print.\
For instance, the more sophisticated methods available in the more
recent package, `TreePar`, introduced in @Stadler2011 were not used in
this study.

We load the new method and format the data as its manual instructs us

~~~~ {.r}
require(TreePar)
x<-sort(getx(derryberry), decreasing=TRUE)
~~~~

The best-fit model in the laser analysis was a yule (net diversification
rate) models with two separate rates.\
We can ask `TreePar` to see if a model with more rate shifts is favored
over this single shift, a question that was not possible to address
using the tools provided in `laser`. The previous analysis also
considers a birth-death model that allowed speciation and extinction
rates to be estimated separately, but did not allow for a shift in the
rate of such a model.\
Here we consider models that have up to 4 different rates in Yule
models, (The syntax in `TreeParr` is slightly cumbersome, the [[2]]
indicates where this command happens to store the output models.

~~~~ {.r}
yule_models <- bd.shifts.optim(x, sampling = c(1,1,1,1), grid = 5, start = 0, end = 60, yule = TRUE)[[2]]
~~~~

We also want to compare the performance of models which allow up to four
shifts and also estimate extinction and speciation separately:

~~~~ {.r}
birth_death_models <- bd.shifts.optim(x, sampling = c(1,1,1,1), grid = 5, start = 0, end = 60, yule = FALSE)[[2]]
~~~~

The models output by these functions are ordered by increasing number of
shifts.\
We can select the best-fitting model by AIC score,

~~~~ {.r}
yule_aic <- sapply(yule_models, function(pars) 2 * (length(pars) - 1) + 2 * pars[1] )
birth_death_aic <- sapply(birth_death_models, function(pars) 2 * (length(pars) - 1) + 2 * pars[1] )
best_no_of_rates <- list(Yule = which.min(yule_aic), birth.death = which.min(birth_death_aic))
best_model <- which.min(c(min(yule_aic), min(birth_death_aic)))
~~~~

which confirms that the Yule 2-rate\
model is still the best choice based on AIC score.\
Of the eight models in this second analysis, only three were in the
original set considered (Yule 1-rate and 2-rate, and birth-death without
a shift), so we could by no means have been sure ahead of time that a
birth death with a shift, or a Yule model with a greater number of
shifts, would not have fitted better.

This kind of verification of results and validation against alternate
methods will not occur regularly as long as the time required to do so
is not negligible.\
While this kind of analysis already enjoys the benefits of scripted
software implementations of the methods being employed, access to the
actual data has become the rate-limiting step.

Leverging the programmatic access to the phylogenetic data shown in this
example, we can both verify the original result and extend the analysis
to the new method in a few minutes, without waiting for a drawn-out
correspondence to access the data. No additional effort would be
required even if many different phylogenies were involved. If
verification and validation can be performed in minutes instead of days,
they may become routine practices in settings such as journal clubs and
peer-review.

A self-updating meta-analysis?
==============================

Large scale comparative analyses that seek to characterize evolutionary
patterns across many phylogenies increasingly common in phylogenetic
methods p[*e.g.* @McPeek2007, @Phillimore2008, @McPeek2008,
@Quental2010, @Davies2011a].\
Often referred to by their authors as meta-analyses, these approaches
have focused on re-analyzing phylogenetic trees collected from many
different earlier publications.\
This is a more direct approach than the traditional concept of
meta-analysis where statistical results from earlier studies are
weighted by their sample size without actually repeating the statistical
analyses of those papers. Because the identical analysis can be repeated
on the original data from each study, this approach avoids some of the
statistical challenges inherent in traditional meta-analyses summarizing
results across heterogeneous approaches.

To date, researchers have gone through heroic efforts simply to assemble
these data sets from the literature.\
As described in @McPeek2007, (emphasis added) \>One data set was based
on 163 published species-level molecular phylogenies of arthropods,
chordates, and mollusks. [\dots] A PDF format file of each article was
obtained, and a digital snapshot of the figure was taken in Adobe
Acrobat 7.0. This image was transferred to a PowerPoint (Microsoft) file
and printed on a laser printer. The phylogenies included in this study
are listed in the appendix.
\emph{All branch lengths were measured by hand from these  printed sheets using dial calipers.}

Despite the recent appearance of digital tools that could now facilitate
this analysis without mechanical calipers, [*e.g.* treesnatcher,
@Laubach2007], it is easier and less error-prone to pull properly
formatted phylogenies from the database for this purpose. Moreover, as
the available data increases with subsequent publications, updating
earlier meta-analyses can become increasingly tedious. In this section
we describe how `treebase` can help overcome such barriers to discovery
and integration at this large scale.

A central question in many studies that look across a large array of
phylogenies has been to identify how often these trees show changing
rates of speciation and extinction. Understanding these differences in
diversification rates in different taxa is fundamental to explaining the
patterns of diversity we see today.\
In this section we illustrate how we can perform a similar meta-analysis
to the studies such as @McPeek2007, @Phillimore2008, @McPeek2008,
@Quental2010, @Davies2011a across a much larger set of phylogenies and
with just a few lines of R code.\
Because the entire analysis, including the access of the data, is
scriptable, we could simply recompile this document some time in the
future and see how the pattern we find has changed as more data has been
added to TreeBASE.

Testing for constant speciation and extinction rates across all of treebase
---------------------------------------------------------------------------

A standard test of this is the gamma statistic of @Pybus2000 which tests
the null hypothesis that the rates of speciation and extinction are
constant. The gamma statistic is normally distributed about 0 for a pure
birth or birth-death process, values larger than 0 indicate that
internal nodes are closer to the tip then expected, while values smaller
than 0 indicate nodes farther from the tip then expected.\
In this section, we collect all phylogenetic trees from TreeBASE and
select those with branch length data that we can time-calibrate using
tools available in R. We can then calculate the distribution of this
statistic for all available trees, and compare these results with those
from the analyses mentioned above.

The `treebase` package provides a compressed cache of the phylogenies
available in treebase.\
This cache can be automatically updated with the `cache_treebase`
function,

~~~~ {.r}
treebase <- cache_treebase()
~~~~

which may require a day or so to complete, and will save a file in the
working directory named with treebase and the date obtained.\
For convenience, we can load the cached copy distributed with the
`treebase` package:

~~~~ {.r}
data(treebase)
~~~~

We will only be able to use those phylogenies that include branch length
data.\
We drop those that do not from the data set,

~~~~ {.r}
      have <- have_branchlength(treebase)
      branchlengths <- treebase[have]
~~~~

Like most comparative methods, this analysis will require ultrametric
trees (branch lengths proportional to time, rather than to mutational
steps). As most of these phylogenies are calibrated with branch length
proportional to mutational step, we must time-calibrate each of them
first.

~~~~ {.r}
timetree <- function(tree){
    try( chronoMPL(multi2di(tree)) )
}
tt <- drop_nontrees(sapply(branchlengths, timetree))
~~~~

At this point we have 1,217 time-calibrated phylogenies over which we
will apply the diversification rate analysis. Computing the gamma test
statistic to identify devations from the constant-rates model takes a
single line,

~~~~ {.r}
gammas <- sapply(tt,  gammaStat)
~~~~

and the resulting distribution of the statistic across available trees
is shown Fig 3.

~~~~ {.r}
qplot(gammas)
~~~~

![plot of chunk
gammadist](http://farm8.staticflickr.com/7053/7113854271_7d0efd31de_o.png)

As the gamma statistic is normally distributed under the constant-rates
model, we can ask what fraction of trees can reject this model at a
given confidence level by calculating the associated *p* values,

~~~~ {.r}
p_values <- 2 * (1 - pnorm(abs(gammas)))
non_const <- sum(p_values < 0.025, na.rm=TRUE)/length(gammas)
~~~~

wherein we find that 58 % of the trees can reject the constant-rates
model at the 95% confidence level. This supports a broad pattern from
the above literature that finds deviations from the constant-rates
models in smaller phylogentic samples.

Following @McPeek2007 we can investigate if the species richness of a
given phylogeny correlates with diversification rate [@Nee1994a]. Figure
\ref{lambda_ntaxa} shows this analysis, which supports the conclusion
that species richness is not explained by increasing diversification
rate.

The species richness represented in a phylogeny shows no significant
trend with increasing diversification rate

~~~~ {.r}
    xtable::xtable(summary(lm(log(lambda) ~ log(taxa), dat)))
~~~~

recover called non-interactively; frames dumped, use debugger() to view

    Error: error in evaluating the argument 'object' in selecting a method for function 'summary': Error in is.data.frame(data) : object 'dat' not found
    Calls: lm ... model.frame -> model.frame.default -> is.data.frame

Because `treebase` makes it possible to perform this analysis entirely
by scripts using the latest treebase data, it is not only easier to
perform this analysis but also to update it to reflect the latest data.
Note that in this example it is not our objective to provide a thorough
analysis of diversification patterns and their possible interpretations,
as in [@Pybus2000, @McPeek2007, @McPeek2008, @Phillimore2008], but
merely to illustrate how the similar calculations to these can be easily
applied across the much larger datasets in the repository. This example
can be automatically updated to reflect the latest data in TreeBASE
simply by rerunning the code we present above.

Conclusion
==========

While we have focused on examples that require no additional data beyond
the phylogeny, a wide array of methods combine this data with
information about the traits, geography, or ecological community of the
taxa represented. In such cases we would need programmatic access to the
trait data as well as the phylogeny. The Dryad digital repository
([http://datadryad.org](http://datadryad.org)) is a popular host for
such data to support the data archiving requirements mentioned above.
While programmatic access to the repository is possible through the
`rdryad` package [@Chamberlain2012], variation in data formatting must
first be overcome. Dedicated databases such as FishBASE
([http://fishbase.org](http://fishbase.org)) may be another alternative,
where morphological data can be queried for a list of species using the
`rfishbase` package [@rfishbase]. The development of similar software
for programmatic data access will rapidly extend the space and scale of
possible analyses.

The recent advent of mandatory data archiving in many of the major
journals publishing phylognetics-based research [*e.g.* @Fairbairn2010,
@Piwowar2011, @Whitlock2010], is a particularly promising development
that should continue to fuel trend of submissions seen in Fig. [fig:1].
Accompanied by faster and more inexpensive techniques of NextGen
sequencing, and the rapid expansion in phylogenetic applications, we
anticipate this rapid growth in available phylogenies will continue.
Faced with this flood of data, programmatic access becomes not only
increasingly powerful but an increasingly necessary way to ensure we can
still see the forest for all the trees.

Acknowledgements
================

CB wishes to thank S. Price for feedback on the manuscript, the TreeBASE
developer team for building and supporting the repository, and all
contributers to TreeBASE. CB is supported by a Computational Sciences
Graduate Fellowship from the Department of Energy under grant number
DE-FG02-97ER25308.
