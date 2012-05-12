<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="Content-Style-Type" content="text/css" />
  <meta name="generator" content="pandoc" />
  <title></title>
  <style type="text/css">
table.sourceCode, tr.sourceCode, td.lineNumbers, td.sourceCode {
  margin: 0; padding: 0; vertical-align: baseline; border: none; }
table.sourceCode { width: 100%; }
td.lineNumbers { text-align: right; padding-right: 4px; padding-left: 4px; color: #aaaaaa; border-right: 1px solid #aaaaaa; }
td.sourceCode { padding-left: 5px; }
code > span.kw { color: #007020; font-weight: bold; }
code > span.dt { color: #902000; }
code > span.dv { color: #40a070; }
code > span.bn { color: #40a070; }
code > span.fl { color: #40a070; }
code > span.ch { color: #4070a0; }
code > span.st { color: #4070a0; }
code > span.co { color: #60a0b0; font-style: italic; }
code > span.ot { color: #007020; }
code > span.al { color: #ff0000; font-weight: bold; }
code > span.fu { color: #06287e; }
code > span.er { color: #ff0000; font-weight: bold; }
  </style>
</head>
<body>
<p>cboettig@ucdavis.edu</p>
<p>[cor1]Corresponding author.</p>
<ol style="list-style-type: decimal">
<li><p>TreeBASE is an important and rapidly growing repository of phylogenetic data. The R statistical environment has become a primary tool for the applied phylogenetic analyses that use this kind of data for across a range of questions, from comparative evolution to community ecology to conservation planning.</p></li>
<li><p>We have developed <code>treebase</code>, an open-source package (freely available from <a href="http://cran.r-project.org/web/packages/treebase">http://cran.r-project.org/web/packages/treebase</a>) for the R environment, providing simplified, programmatic and interactive access to phylogenetic data in the TreeBASE repository.</p></li>
<li><p>We illustrate how this package creates a bridge between the repository and the rapidly growing ecosystem of R packages for phylogenetics that can reduce barriers to discovery and integration across phylogenetic research.</p></li>
<li><p>We show how the <code>treebase</code> package can be used to facilitate replication of previous studies and testing of methods and hypotheses across a large sample of phylogenies, which may help make these practices more common.</p></li>
</ol>
<h4 id="keywords">Keywords</h4>
<p>R, software, API, TreeBASE, database, e-science</p>
<h1 id="introduction">Introduction</h1>
<p>Applications that use phylogenetic information as part of their analyses are becoming increasingly central to both evolutionary and ecological research. The exponential growth in genetic sequence data available for all forms of life has driven rapid advances in the methods that can infer the phylogenetic relationships and divergence times across different taxa <span class="citation">(Huelsenbeck and Ronquist 2001; Stamatakis 2006; Drummond and Rambaut 2007)</span>. just as the availability of sequence data has led to the subsequent explosion of phylogenetic methods, and many other avenues of research, this rapid expanse of phylogenetic data now primes new innovations across ecology and evolution. Once again the product of one field has become the raw data of the next. Unfortunately, while the discipline of bioinformatics has emerged to help harness and curate the wealth of genetic data with cutting edge computer science, statistics, and internet technology, its counterpart in evolutionary informatics remains “scattered, poorly documented, and in formats that impede discovery and integration” <span class="citation">(Parr et al. 2011)</span>. Our goal when developing the <code>treebase</code> package was to address this gap by providing how programmatic and interactive access between the repositories that store this data and the software tools commonly used to analyze them.</p>
<p>In this paper we focus on applications which use rather than generate phylogenetic data. Such approaches stand to benefit substantially from this programmatic and interactive access to TreeBASE. While the task of inferring phylogenies from sequence data remains dominated by dedicated compiled software such as MrBayes <span class="citation">(Huelsenbeck and Ronquist 2001)</span>, BEAST <span class="citation">(Drummond and Rambaut 2007)</span>, RAXML <span class="citation">(Stamatakis 2006)</span>, the ever-growing suite of research methods that use these phylogenies as input data are largely based in R. The R statistical environment <span class="citation">(R Development Core Team 2012)</span> has become a dominant platform for researchers using phylogenetic data to address a rapidly expanding set of questions in ecological and evolutionary processes. These methods include but are not limited to ancestral state reconstruction <span class="citation">(Paradis 2004; Butler and King 2004)</span>, diversification analysis <span class="citation">(Paradis 2004; Rabosky 2006; Harmon et al. 2008; FitzJohn, Maddison, and Otto 2009; Fitzjohn 2010; Goldberg, Lancaster, and Ree 2011; Stadler 2011b)</span>, quantifying the rate and tempo of trait evolution <span class="citation">(Butler and King 2004; Paradis 2004; Harmon et al. 2008; Hipp and Escudero 2010; Revell et al. 2011; Eastman et al. 2011)</span>, identifying evolutionary influences and proxies for community ecology <span class="citation">(Webb, Ackerly, and Kembel 2008; Kembel et al. 2010)</span>, performing phyloclimatic modelling <span class="citation">(Warren, Glor, and Turelli 2008; Evans et al. 2009)</span>, and simulation of speciation and character evolution <span class="citation">(Harmon et al. 2008; Stadler 2011a; Boettiger, Coop, and Ralph 2012)</span>, as well as various manipulation and visualization of phylogenetic data <span class="citation">(Paradis 2004; Schliep 2010; Jombart, Balloux, and Dray 2010; Revell et al. 2011)</span>. A more comprehensive list of R packages by analysis type is available on the phylogenetics taskview, <a href="http://cran.r-project.org/web/views/Phylogenetics.html">http://cran.r-project.org/web/views/Phylogenetics.html</a>. Several programs exist outside the R language for applied phylogenetic methods, incuding Java <span class="citation">(Maddison and Maddison 2011)</span>, MATLAB <span class="citation">(Blomberg, Garland, and Ives 2003)</span> and Python <span class="citation">(sukumaran and holder 2010)</span> and online interfaces <span class="citation">(Martins 2004)</span>.</p>
<p>TreeBASE (<a href="http://treebase.org">http://treebase.org</a>) is an online repository of phylogenetic data (e.g. trees of species, populations, or genes) that have been published in a peer-reviewed academic journal, book, thesis or conference proceedings <span class="citation">(Sanderson et al. 1994; Morell 1996)</span>. The database can be searched through an online interface which allows users to find a phylogenetic tree from a particular publication, author or taxa of interest. TreeBASE provides an application programming interface (API) that lets computer applications make queries to the database. Our <code>treebase</code> package uses this API to create a direct link between this data and the R language. This has several immediate and important benefits:</p>
<ol style="list-style-type: decimal">
<li><p><em>Data discovery.</em> Users can leverage the rich statstical environment provided by the R language to better identify data sets appropriate for their research.</p></li>
<li><p><em>Programmatic data access.</em> Many tasks that are theoretically made possible by the creation of the TreeBASE repository are not pursued because they would be too laborious for an exploratory analysis. The ability to use loops to automatically download and perform a systematic analysis using the rich set of tools available in R opens up new avenues for research.</p></li>
<li><p><em>Automatic updating</em>. The TreeBASE repository is expanding rapidly. The scriptable nature of analyses run in with our <code>treebase</code> package means that a study can be rerun on the latest version of the repository without additional effort.</p></li>
</ol>
<h2 id="basic-queries">Basic queries</h2>
<p>The basic functions of the TreeBASE API allow search queries through two separate interfaces. The <code>OAI-PMH</code> interface provides the metadata associated with the publications from which the phylogenies have been taken, while the <code>Phylo-WS</code> interface provides information and access to the phylogenetic data itself. These interfaces are well-documented on the TreeBASE website. The <code>treebase</code> package allows these queries to be made directly from R, just as a user would make them from the browser. Because the queries can be implemented programmatically in R, a user can construct more complicated filters than permitted by the web interface, and can maintain a record of the queries they used to collect their data as an R script. The ability to script this data-gathering step of research can go a long way to reducing errors and ensuring that an analysis can be replicated later, by the author or other groups <span class="citation">(Peng et al. 2011)</span>.</p>
<p>Any of the queries available on the web interface can now be made directly from R, including downloading and importing the phylogeny into the R interface. For instance, one can search for phylogenies containing dolphin taxa, “Delphinus,” or all phylogenies submitted by a given author, “Huelsenbeck”,</p>
<pre class="sourceCode r"><code class="sourceCode r">    <span class="kw">search_treebase</span>(<span class="st">&quot;Delphinus&quot;</span>, <span class="dt">by=</span><span class="st">&quot;taxon&quot;</span>)
    <span class="kw">search_treebase</span>(<span class="st">&quot;Huelsenbeck&quot;</span>, <span class="dt">by=</span><span class="st">&quot;author&quot;</span>)</code></pre>
<p>This function loads the matching phylogenies into R, ready for analysis. The package documentation provides many examples of possible queries. The <code>search_treebase</code> function is the heart of the <code>treebase</code> package. Table 1 lists each of the types of queries available through the <code>search_treebase</code> function. This list can also be found in the function documentation, <code>?search_treebase</code>.</p>
<table>
<caption>Queries available in <code>search_treebase</code></caption>
<thead>
<tr class="header">
<th align="left">search “by=”</th>
<th align="left">description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">abstract</td>
<td align="left">search terms in the publication abstract</td>
</tr>
<tr class="even">
<td align="left">author</td>
<td align="left">match authors in the publication</td>
</tr>
<tr class="odd">
<td align="left">subject</td>
<td align="left">Matches in the subject terms</td>
</tr>
<tr class="even">
<td align="left">doi</td>
<td align="left">The unique object identifier for the publication</td>
</tr>
<tr class="odd">
<td align="left">ncbi</td>
<td align="left">NCBI identifier number for the taxon</td>
</tr>
<tr class="even">
<td align="left">kind.tree</td>
<td align="left">Kind of tree (Gene tree, species tree, barcode tree)</td>
</tr>
<tr class="odd">
<td align="left">type.tree</td>
<td align="left">Type of tree (Consensus or Single)</td>
</tr>
<tr class="even">
<td align="left">ntax</td>
<td align="left">Number of taxa in the matrix</td>
</tr>
<tr class="odd">
<td align="left">quality</td>
<td align="left">A quality score for the tree, if it has been rated.</td>
</tr>
<tr class="even">
<td align="left">study</td>
<td align="left">Match words in the title of the study or publication</td>
</tr>
<tr class="odd">
<td align="left">taxon</td>
<td align="left">Taxon scientific name</td>
</tr>
<tr class="even">
<td align="left">id.study</td>
<td align="left">TreeBASE study ID</td>
</tr>
<tr class="odd">
<td align="left">id.tree</td>
<td align="left">TreeBASE’s unique tree identifier (Tr.id)</td>
</tr>
<tr class="even">
<td align="left">id.taxon</td>
<td align="left">Taxon identifier number from TreeBase</td>
</tr>
<tr class="odd">
<td align="left">tree</td>
<td align="left">The title for the tree</td>
</tr>
</tbody>
</table>
<h1 id="data-discovery-in-treebase">Data discovery in TreeBASE</h1>
<p>The <code>treebase</code> package provides access to the metadata of all publications containing trees deposited in TreeBASE using a separate API built on the OAI-PMH protocol, an international web standard such data. This can help the user discover phylogenies of interest and also allows the user to perform statistical analyses on the data deposition itself, which could identify trends or biases in the phylogenetics literature.</p>
<p>This publication metadata is accessed by <code>search_metadata</code> function, which can download the metadata for all publications associated with TreeBASE.</p>
<pre class="sourceCode r"><code class="sourceCode r">    oai.md &lt;- <span class="kw">search_metadata</span>() </code></pre>
<p>This returns an R list object, in which each element is an entry with bibliographic information corresponding to a published study that has deposited data in TreeBASE. From the length of this list we see that there are currently 3105 published studies in the database.</p>
<p>The <code>oai_metadata</code> function facilitates extracting the different meta-data fields. For instance, to obtain a list of all the dates of publication &amp; names of the journals (publishers) that have submitted data:</p>
<pre class="sourceCode r"><code class="sourceCode r">    dates &lt;- <span class="kw">oai_metadata</span>(<span class="st">&quot;date&quot;</span>, oai.md) 
    pub &lt;- <span class="kw">oai_metadata</span>(<span class="st">&quot;publisher&quot;</span>, oai.md)</code></pre>
<p>Many journals have only a few submissions, so we will classify any not in the top ten contributing journals as “Other”:</p>
<pre class="sourceCode r"><code class="sourceCode r">    topten &lt;- <span class="kw">sort</span>(<span class="kw">table</span>(pub), <span class="dt">decreasing=</span><span class="ot">TRUE</span>)[<span class="dv">1</span>:<span class="dv">10</span>]
    pub[!(pub %in% <span class="kw">names</span>(topten))] &lt;- <span class="st">&quot;Other&quot;</span></code></pre>
<p>We plot the distribution of publication years for phylogenies deposited in TreeBASE, color coding by publisher in Fig [fig:1].</p>
<pre class="sourceCode r"><code class="sourceCode r">    meta &lt;- <span class="kw">data.frame</span>(<span class="dt">pub =</span> pub, <span class="dt">dates =</span> dates)
    <span class="kw">ggplot</span>(meta) + <span class="kw">geom_bar</span>(<span class="kw">aes</span>(dates, <span class="dt">fill =</span> publisher))</code></pre>
<pre><code>Error: could not find function &quot;ggplot&quot;</code></pre>
<p>Typically we are more interested in the metadata describing the phylogenies themselves rather than the publications in which they appeared, such as the number of taxa in the tree, a quality score (if available), kind of tree (gene tree, species tree, or barcode tree) or whether the phylogeny represents a consensus tree from a distribution or just a single estimate. The <code>cache_treebase</code> function is used to download all available phylogenies from TreeBASE. Here, we call the function with an optional argument that will return only the metadata just listed for all available phylogenies, which runs much more quickly.</p>
<pre class="sourceCode r"><code class="sourceCode r">    phylo.md &lt;- <span class="kw">cache_treebase</span>(<span class="dt">only_metadata=</span><span class="ot">TRUE</span>)</code></pre>
<p>We can summarize how these 10,555 trees break out by kind or type (The <code>xtable</code> command formats this as a table) using the <code>phylo_metadata</code> function to extract the kind of tree (gene/species/barcode) and type (single or consensus):</p>
<pre class="sourceCode r"><code class="sourceCode r"> output &lt;- <span class="kw">table</span>(<span class="kw">phylo_metadata</span>(<span class="st">&quot;kind&quot;</span>, phylo.md), <span class="kw">phylo_metadata</span>(<span class="st">&quot;type&quot;</span>, phylo.md))
 xtable::<span class="kw">xtable</span>(output)</code></pre>
<!-- html table generated in R 2.15.0 by xtable 1.7-0 package -->
<!-- Sat May 12 14:33:29 2012 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> 
Consensus
</TH> <TH> 
Single
</TH>  </TR>
  <TR> <TD align="right"> 
Barcode Tree
</TD> <TD align="right">   
1
</TD> <TD align="right">  
11
</TD> </TR>
  <TR> <TD align="right"> 
Gene Tree
</TD> <TD align="right"> 
123
</TD> <TD align="right"> 
214
</TD> </TR>
  <TR> <TD align="right"> 
Species Tree
</TD> <TD align="right"> 
2952
</TD> <TD align="right"> 
7239
</TD> </TR>
   </TABLE>




<p>For certain applications a user may wish to download all the available phylogenies from TreeBASE. Using the <code>cache_treebase</code> function allows a user to download a local copy of all trees. Because direct database dumps are not available, this function has intentional delays to avoid overtaxing the TreeBASE servers, and should be allowed a full day to run.</p>
<pre class="sourceCode r"><code class="sourceCode r">    treebase &lt;- <span class="kw">cache_treebase</span>()</code></pre>
<p>Once run, the cache is saved compactly in memory where it can be easily and quickly restored. For convenience, the <code>treebase</code> package comes with a copy already cached, which can be loaded into memory.</p>
<pre class="sourceCode r"><code class="sourceCode r">    <span class="kw">data</span>(treebase)</code></pre>
<p>Having access to both the metadata from the studies and from the phylogenies in R lets us quickly combine these data sources in interesting ways. For instance, with a few commands we can visualize how the number of taxa on submitted phylogenies has increasing over time, Figure [fig:2].</p>
<pre class="sourceCode r"><code class="sourceCode r">    phylo.id &lt;- <span class="kw">phylo_metadata</span>(<span class="st">&quot;Study.id&quot;</span>, phylo.md)
    oai.id &lt;- <span class="kw">oai_metadata</span>(<span class="st">&quot;Study.id&quot;</span>, oai.md)
    matches &lt;- <span class="kw">sapply</span>(oai.id, match, phylo.id)
    Ntaxa &lt;- <span class="kw">phylo_metadata</span>(<span class="st">&quot;ntaxa&quot;</span>,  phylo.md[matches])
    Ntaxa[<span class="kw">sapply</span>(Ntaxa, is.null)] &lt;- <span class="ot">NA</span>
    taxa &lt;- <span class="kw">data.frame</span>(<span class="dt">Ntaxa=</span><span class="kw">as.numeric</span>(<span class="kw">unlist</span>(Ntaxa)), meta)
    <span class="kw">ggplot</span>(taxa, <span class="kw">aes</span>(dates, Ntaxa)) + 
      <span class="kw">geom_point</span>(<span class="dt">position =</span> <span class="st">&#39;jitter&#39;</span>, <span class="dt">alpha =</span> .<span class="dv">8</span>) + 
      <span class="kw">scale_y_log10</span>() + <span class="kw">stat_smooth</span>(<span class="kw">aes</span>(<span class="dt">group =</span> <span class="dv">1</span>))</code></pre>
<div class="figure">
<img src="http://farm8.staticflickr.com/7242/7184238818_6564ca0e1c_o.png" alt="Combining the metadata available from publications and from phylogenies themselves, we can visualize the growth in taxa on published phylogenies. Note that the maximum size tree deposited each year is growing far faster than the average number." /><p class="caption">Combining the metadata available from publications and from phylogenies themselves, we can visualize the growth in taxa on published phylogenies. Note that the maximum size tree deposited each year is growing far faster than the average number.</p>
</div>
<p>The promise of this exponential growth in the sizes of available phylogenies, with some trees representing 2,957 taxa motivates the more and more ambitious inference methods being developed which require large trees to have adequate signal <span class="citation">(Boettiger, Coop, and Ralph 2012; FitzJohn, Maddison, and Otto 2009; Beaulieu et al. 2012)</span>.</p>
<h1 id="reproducible-research">Reproducible research</h1>
<p>Reproducible research has become a topic of increasing concern in recent years, and facilitating access to data and using scripts that can replicate analyses can help lower barriers to the replication of statistical and computational results <span class="citation">(Schwab, Karrenbach, and Claerbout 2000; Gentleman and Temple Lang 2004; Peng 2011)</span>. The <code>treebase</code> package facilitates this process, as we illustrate in a simple example.</p>
<p>Consider the shifts in speciation rate identified by Derryberry et al. <span class="citation">(2011)</span> on a phylogeny of ovenbirds and treecreapers, which uses the methods provided in the R package <code>laser</code> <span class="citation">(Rabosky 2006)</span>. We will seek to not only replicate the results, but also compare them against methods presented in Stadler <span class="citation">(2011b)</span> in the package <code>TreePar</code>, which permits speciation models that were not available to Derryberry et al. <span class="citation">(2011)</span> at the time of their study.</p>
<h2 id="obtaining-the-tree">Obtaining the tree</h2>
<p>By drawing on the rich data manipulation tools available in R which should be familiar to the large R phylogenetics community, the <code>treebase</code> package allows us to construct richer queries than are possible through TreeBASE alone.</p>
<p>The fastest way to identify the data uses the digital object identifer (doi) printed on the top of the article,</p>
<pre class="sourceCode r"><code class="sourceCode r">results &lt;- <span class="kw">search_treebase</span>(<span class="st">&quot;10.1111/j.1558-5646.2011.01374.x&quot;</span>, <span class="st">&quot;doi&quot;</span>)</code></pre>
<p>The search returns a list, since some studies contain many trees</p>
<pre class="sourceCode r"><code class="sourceCode r">results </code></pre>
<pre><code>[[1]]

Phylogenetic tree with 297 tips and 296 internal nodes.

Tip labels:
    Formicarius_colma, Glyphorynchus_spirurus, Dendrocolaptes_platyrostris, Dendrocolaptes_picumnus, Dendrocolaptes_hoffmannsi, Dendrocolaptes_certhia_concolor, ...

Rooted; includes branch lengths.
</code></pre>
<p>In this case the single item in the list is the one we want:</p>
<pre class="sourceCode r"><code class="sourceCode r">derryberry &lt;- results[[<span class="dv">1</span>]]</code></pre>
<p>Having successfully imported the phylogenetic tree corresponding to this study, we can quickly replicate their analysis of which diversification process best fits the data. These steps can be easily implemented using the phylogenetics packages we have just mentioned. As a comparison of speciation models is not the focus of this paper, the complete code and explanation for these steps is provided as an appendix. Happily, this analysis confirms the author’s original conclusions, even when the more general model of Stadler <span class="citation">(2011b)</span> is considered.</p>
<h1 id="analyses-across-many-phylogenies">Analyses across many phylogenies</h1>
<p>Large scale comparative analyses that seek to characterize evolutionary patterns across many phylogenies increasingly common in phylogenetic methods <span class="citation">(<em>e.g.</em> McPeek and Brown 2007; Phillimore and Price 2008; McPeek 2008; Quental and Marshall 2010; Davies et al. 2011)</span>.<br />Sometimes referred to by their authors as meta-analyses, these approaches have focused on re-analyzing phylogenetic trees collected from many different earlier publications.<br />This is a more direct approach than the traditional concept of meta-analysis where statistical results from earlier studies are weighted by their sample size without actually repeating the statistical analyses of those papers. Because the identical analysis can be repeated on the original data from each study, this approach avoids some of the statistical challenges inherent in traditional meta-analyses summarizing results across heterogeneous approaches.</p>
<p>To date, researchers have gone through heroic efforts simply to assemble these data sets from the literature.<br />As described in McPeek and Brown <span class="citation">(2007)</span>; (emphasis added) &gt; One data set was based on 163 published species-level molecular phylogenies &gt; of arthropods, chordates, and mollusks. A PDF format file of each article &gt; was obtained, and a digital snapshot of the figure was taken in Adobe Acrobat &gt; 7.0. This image was transferred to a PowerPoint (Microsoft) file and printed &gt; on a laser printer. The phylogenies included in this study are listed in the &gt; appendix. <em>All branch lengths were measured by hand from these printed sheets &gt; using dial calipers.</em></p>
<p>Despite the recent appearance of digital tools that could now facilitate this analysis without mechanical calipers, <span class="citation">(<em>e.g.</em> treesnatcher, Laubach and von Haeseler 2007)</span>, it is easier and less error-prone to pull properly formatted phylogenies from the database for this purpose. Moreover, as the available data increases with subsequent publications, updating earlier meta-analyses can become increasingly tedious. Using our package, a user can apply any analysis they have written for a single phylogeny across the entire collection of suitable phylogenies in TreeBASE, which can help overcome such barriers to discovery and integration at this large scale. Using the functions we introduce aboved, we provide in the Appendix a simple example that computes the gamma statistic of Pybus and Harvey <span class="citation">(2000)</span>, which provides an measure of when speciation patterns differ from the popular birth-death model. We see that many phylogenies fall outside the distribution of the statistic expected under that model.</p>
<h1 id="conclusion">Conclusion</h1>
<p>While we have focused on examples that require no additional data beyond the phylogeny, a wide array of methods combine this data with information about the traits, geography, or ecological community of the taxa represented. In such cases we would need programmatic access to the trait data as well as the phylogeny. The Dryad digital repository (<a href="http://datadryad.org">http://datadryad.org</a>) is a popular host for such data to support the data archiving requirements mentioned above. While programmatic access to the repository is possible through the <code>rdryad</code> package <span class="citation">(Chamberlain, Boettiger, and Ram 2012)</span>, variation in data formatting must first be overcome. Dedicated databases such as FishBASE (<a href="http://fishbase.org">http://fishbase.org</a>) may be another alternative, where morphological data can be queried for a list of species using the <code>rfishbase</code> package <span class="citation">(Boettiger)</span>. The development of similar software for programmatic data access will rapidly extend the space and scale of possible analyses.</p>
<p>The recent advent of mandatory data archiving in many of the major journals publishing phylognetics-based research <span class="citation">(<em>e.g.</em> Fairbairn 2010; Piwowar, Vision, and Whitlock 2011; Whitlock et al. 2010)</span>, is a particularly promising development that should continue to fuel trend of submissions seen in Fig. 1. Accompanied by faster and more inexpensive techniques of NextGen sequencing, and the rapid expansion in phylogenetic applications, we anticipate this rapid growth in available phylogenies will continue. Faced with this flood of data, programmatic access becomes not only increasingly powerful but an increasingly necessary way to ensure we can still see the forest for all the trees.</p>
<h1 id="acknowledgements">Acknowledgements</h1>
<p>CB wishes to thank S. Price for feedback on the manuscript, the TreeBASE developer team for building and supporting the repository, and all contributers to TreeBASE. CB is supported by a Computational Sciences Graduate Fellowship from the Department of Energy under grant number DE-FG02-97ER25308.</p>
<h1 id="references">References</h1>
<h1 id="appendix">Appendix</h1>
<h2 id="reproducible-research-a-diversification-rate-analysis">Reproducible Research: A diversification rate analysis</h2>
<p>Different diversification models make different assumptions about the rate of speciation, extinction, and how these rates may be changing over time. The authors consider eight different models, implemented in the laser package <span class="citation">(Rabosky 2006)</span>. This code fits each of the eight models to that data:</p>
<pre class="sourceCode r"><code class="sourceCode r"><span class="kw">library</span>(ape)
bt &lt;- <span class="kw">branching.times</span>(derryberry)
<span class="kw">library</span>(laser)
models &lt;- <span class="kw">list</span>(             <span class="dt">yule =</span> <span class="kw">pureBirth</span>(bt),  
                     <span class="dt">birth_death =</span> <span class="kw">bd</span>(bt),     
                     <span class="dt">yule.2.rate =</span> <span class="kw">yule2rate</span>(bt),
      <span class="dt">linear.diversity.dependent =</span> <span class="kw">DDL</span>(bt),    
 <span class="dt">exponential.diversity.dependent =</span> <span class="kw">DDX</span>(bt),
         <span class="dt">varying.speciation_rate =</span> <span class="kw">fitSPVAR</span>(bt),  
         <span class="dt">varying.extinction_rate =</span> <span class="kw">fitEXVAR</span>(bt),  
                    <span class="dt">varying_both =</span> <span class="kw">fitBOTHVAR</span>(bt)  
              )</code></pre>
<p>Each of the model estimate includes an AIC score indicating the goodness of fit, penalized by model complexity (lower scores indicate better fits) We ask R to tell us which model has the lowest AIC score,</p>
<pre class="sourceCode r"><code class="sourceCode r">aics &lt;- <span class="kw">sapply</span>(models, <span class="st">`</span><span class="dt">[[</span><span class="st">`</span>, <span class="st">&#39;aic&#39;</span>)
best_fit &lt;- <span class="kw">names</span>(models[<span class="kw">which.min</span>(aics)])</code></pre>
<p>and confirm the result presented in Derryberry et al. <span class="citation">(2011)</span>; that the yule.2.rate model is the best fit to the data.</p>
<p>In this fast-moving field, new methods often become available within the time-frame that another manuscript is submitted by its authors and the time at which if first appears in print. For instance, the more sophisticated methods available in the more recent package, <code>TreePar</code>, introduced in Stadler <span class="citation">(2011b)</span> were not used in this study.</p>
<p>We load the new method and format the data as its manual instructs us</p>
<pre class="sourceCode r"><code class="sourceCode r"><span class="kw">require</span>(TreePar)
x&lt;-<span class="kw">sort</span>(<span class="kw">getx</span>(derryberry), <span class="dt">decreasing=</span><span class="ot">TRUE</span>)</code></pre>
<p>The best-fit model in the laser analysis was a yule (net diversification rate) models with two separate rates. We can ask <code>TreePar</code> to see if a model with more rate shifts is favored over this single shift, a question that was not possible to address using the tools provided in <code>laser</code>. The previous analysis also considers a birth-death model that allowed speciation and extinction rates to be estimated separately, but did not allow for a shift in the rate of such a model. Here we consider models that have up to 4 different rates in Yule models, (The syntax in <code>TreeParr</code> is slightly cumbersome, the [[2]] indicates where this command happens to store the output models.)</p>
<pre class="sourceCode r"><code class="sourceCode r">yule_models &lt;- <span class="kw">bd.shifts.optim</span>(x, <span class="dt">sampling =</span> <span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">1</span>,<span class="dv">1</span>,<span class="dv">1</span>), 
  <span class="dt">grid =</span> <span class="dv">5</span>, <span class="dt">start =</span> <span class="dv">0</span>, <span class="dt">end =</span> <span class="dv">60</span>, <span class="dt">yule =</span> <span class="ot">TRUE</span>)[[<span class="dv">2</span>]]</code></pre>
<p>We also want to compare the performance of models which allow up to four shifts and also estimate extinction and speciation separately:</p>
<pre class="sourceCode r"><code class="sourceCode r">birth_death_models &lt;- <span class="kw">bd.shifts.optim</span>(x, <span class="dt">sampling =</span> <span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">1</span>,<span class="dv">1</span>,<span class="dv">1</span>), 
  <span class="dt">grid =</span> <span class="dv">5</span>, <span class="dt">start =</span> <span class="dv">0</span>, <span class="dt">end =</span> <span class="dv">60</span>, <span class="dt">yule =</span> <span class="ot">FALSE</span>)[[<span class="dv">2</span>]]</code></pre>
<p>The models output by these functions are ordered by increasing number of shifts.<br />We can select the best-fitting model by AIC score,</p>
<pre class="sourceCode r"><code class="sourceCode r">yule_aic &lt;- <span class="kw">sapply</span>(yule_models, function(pars) <span class="dv">2</span> * (<span class="kw">length</span>(pars) - <span class="dv">1</span>) + <span class="dv">2</span> * pars[<span class="dv">1</span>] )
birth_death_aic &lt;- <span class="kw">sapply</span>(birth_death_models, function(pars) <span class="dv">2</span> * (<span class="kw">length</span>(pars) - <span class="dv">1</span>) + <span class="dv">2</span> * pars[<span class="dv">1</span>] )
best_no_of_rates &lt;- <span class="kw">list</span>(<span class="dt">Yule =</span> <span class="kw">which.min</span>(yule_aic), <span class="dt">birth.death =</span> <span class="kw">which.min</span>(birth_death_aic))
best_model &lt;- <span class="kw">which.min</span>(<span class="kw">c</span>(<span class="kw">min</span>(yule_aic), <span class="kw">min</span>(birth_death_aic)))</code></pre>
<p>which confirms that the Yule 2-rate<br />model is still the best choice based on AIC score.<br />Of the eight models in this second analysis, only three were in the original set considered (Yule 1-rate and 2-rate, and birth-death without a shift), so we could by no means have been sure ahead of time that a birth death with a shift, or a Yule model with a greater number of shifts, would not have fitted better.</p>
<table>
<thead>
<tr class="header">
<th align="left">Testing for constant speciation and extinction rates across many phylogenies</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
<p>A standard test of this is the gamma statistic of Pybus and Harvey <span class="citation">(2000)</span> which tests the null hypothesis that the rates of speciation and extinction are constant. The gamma statistic is normally distributed about 0 for a pure birth or birth-death process, values larger than 0 indicate that internal nodes are closer to the tip then expected, while values smaller than 0 indicate nodes farther from the tip then expected. In this section, we collect all phylogenetic trees from TreeBASE and select those with branch length data that we can time-calibrate using tools available in R. We can then calculate the distribution of this statistic for all available trees, and compare these results with those from the analyses mentioned above.</p>
<p>The <code>treebase</code> package provides a compressed cache of the phylogenies available in treebase. This cache can be automatically updated with the <code>cache_treebase</code> function,</p>
<pre class="sourceCode r"><code class="sourceCode r">treebase &lt;- <span class="kw">cache_treebase</span>()</code></pre>
<p>which may require a day or so to complete, and will save a file in the working directory named with treebase and the date obtained. For convenience, we can load the cached copy distributed with the <code>treebase</code> package:</p>
<pre class="sourceCode r"><code class="sourceCode r"><span class="kw">data</span>(treebase)</code></pre>
<p>We will only be able to use those phylogenies that include branch length data. We drop those that do not from the data set,</p>
<pre class="sourceCode r"><code class="sourceCode r">      have &lt;- <span class="kw">have_branchlength</span>(treebase)
      branchlengths &lt;- treebase[have]</code></pre>
<p>Like most comparative methods, this analysis will require ultrametric trees (branch lengths proportional to time, rather than to mutational steps). As most of these phylogenies are calibrated with branch length proportional to mutational step, we must time-calibrate each of them first.</p>
<pre class="sourceCode r"><code class="sourceCode r">timetree &lt;- function(tree){
    <span class="kw">try</span>( <span class="kw">chronoMPL</span>(<span class="kw">multi2di</span>(tree)) )
}
tt &lt;- <span class="kw">drop_nontrees</span>(<span class="kw">sapply</span>(branchlengths, timetree))</code></pre>
<p>At this point we have 1,217 time-calibrated phylogenies over which we will apply the diversification rate analysis. Computing the gamma test statistic to identify devations from the constant-rates model takes a single line,</p>
<pre class="sourceCode r"><code class="sourceCode r">gammas &lt;- <span class="kw">sapply</span>(tt,  gammaStat)</code></pre>
<p>and the resulting distribution of the statistic across available trees is shown Fig 3.</p>
<pre class="sourceCode r"><code class="sourceCode r"><span class="kw">qplot</span>(gammas)</code></pre>
<div class="figure">
<img src="http://farm9.staticflickr.com/8025/7184300690_57eb8fff25_o.png" alt="plot of chunk gammadist" /><p class="caption">plot of chunk gammadist</p>
</div>
<p>Because <code>treebase</code> makes it possible to perform this analysis entirely by scripts using the latest treebase data, it is not only easier to perform this analysis but also to update it to reflect the latest data. Note that in this example it is not our objective to provide a thorough analysis of diversification patterns and their possible interpretations, as in Pybus and Harvey <span class="citation">(2000)</span>; McPeek and Brown <span class="citation">(2007)</span>; McPeek <span class="citation">(2008)</span>; and Phillimore and Price <span class="citation">(2008)</span>; but merely to illustrate how the similar calculations to these can be easily applied across the much larger datasets in the repository. This example can be automatically updated to reflect the latest data in TreeBASE simply by rerunning the code we present above.</p>
<p>Beaulieu, Jeremy M., Dwueng-Chwuan Jhwueng, Carl Boettiger, and Brian C. O’Meara. 2012. “Modeling Stabilizing Selection: Expanding the Ornstein-Uhlenbeck Model of Adaptive Evolution.” <em>Evolution</em> (mar). doi:10.1111/j.1558-5646.2012.01619.x. <a href="http://doi.wiley.com/10.1111/j.1558-5646.2012.01619.x" title="http://doi.wiley.com/10.1111/j.1558-5646.2012.01619.x">http://doi.wiley.com/10.1111/j.1558-5646.2012.01619.x</a>.</p>
<p>Blomberg, S. P., JR Theodore Garland, and A. R. Ives. 2003. “Testing for phylogenetic signal in comparative data: behavioral traits are more labile.” <em>Evolution</em> 57: 717–745. <a href="http://www3.interscience.wiley.com/journal/118867878/abstract" title="http://www3.interscience.wiley.com/journal/118867878/abstract">http://www3.interscience.wiley.com/journal/118867878/abstract</a>.</p>
<p>Boettiger, Carl. “rfishbase: R Interface to FishBASE.”</p>
<p>Boettiger, Carl, Graham Coop, and Peter Ralph. 2012. “Is your phylogeny informative? Measuring the power of comparative methods.” <em>Evolution</em> (jan). doi:10.1111/j.1558-5646.2012.01574.x. <a href="http://doi.wiley.com/10.1111/j.1558-5646.2012.01574.x" title="http://doi.wiley.com/10.1111/j.1558-5646.2012.01574.x">http://doi.wiley.com/10.1111/j.1558-5646.2012.01574.x</a>.</p>
<p>Butler, Marguerite A., and Aaron A. King. 2004. “Phylogenetic Comparative Analysis: A Modeling Approach for Adaptive Evolution.” <em>The American Naturalist</em> 164 (dec): 683–695. doi:10.1086/426002. <a href="http://www.jstor.org/stable/10.1086/426002" title="http://www.jstor.org/stable/10.1086/426002">http://www.jstor.org/stable/10.1086/426002</a>.</p>
<p>Chamberlain, Scott, Carl Boettiger, and Karthik Ram. 2012. “rdryad: Dryad API interface.” <a href="http://www.github.com/ropensci/rdryad " title="http://www.github.com/ropensci/rdryad ">http://www.github.com/ropensci/rdryad </a>.</p>
<p>Davies, T. Jonathan, Andrew P. Allen, Luís Borda-de-Água, Jim Regetz, and Carlos J. Melián. 2011. “NEUTRAL BIODIVERSITY THEORY CAN EXPLAIN THE IMBALANCE OF PHYLOGENETIC TREES BUT NOT THE TEMPO OF THEIR DIVERSIFICATION.” <em>Evolution</em> 65 (jul): 1841–1850. doi:10.1111/j.1558-5646.2011.01265.x. <a href="http://doi.wiley.com/10.1111/j.1558-5646.2011.01265.x http://www.ncbi.nlm.nih.gov/pubmed/21729042" title="http://doi.wiley.com/10.1111/j.1558-5646.2011.01265.x http://www.ncbi.nlm.nih.gov/pubmed/21729042">http://doi.wiley.com/10.1111/j.1558-5646.2011.01265.x http://www.ncbi.nlm.nih.gov/pubmed/21729042</a>.</p>
<p>Derryberry, Elizabeth P., Santiago Claramunt, Graham Derryberry, R. Terry Chesser, Joel Cracraft, Alexandre Aleixo, Jorge Pérez-Emán, J. V. Remsen Jr, and Robb T. Brumfield. 2011. “LINEAGE DIVERSIFICATION AND MORPHOLOGICAL EVOLUTION IN A LARGE-SCALE CONTINENTAL RADIATION: THE NEOTROPICAL OVENBIRDS AND WOODCREEPERS (AVES: FURNARIIDAE).” <em>Evolution</em> (jul). doi:10.1111/j.1558-5646.2011.01374.x. <a href="http://doi.wiley.com/10.1111/j.1558-5646.2011.01374.x" title="http://doi.wiley.com/10.1111/j.1558-5646.2011.01374.x">http://doi.wiley.com/10.1111/j.1558-5646.2011.01374.x</a>.</p>
<p>Drummond, Alexei J., and Andrew Rambaut. 2007. “BEAST: Bayesian evolutionary analysis by sampling trees.” <em>BMC evolutionary biology</em> 7 (jan): 214. doi:10.1186/1471-2148-7-214. <a href="http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2247476\&amp;tool=pmcentrez\&amp;rendertype=abstract" title="http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2247476\&amp;tool=pmcentrez\&amp;rendertype=abstract">http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2247476\&amp;tool=pmcentrez\&amp;rendertype=abstract</a>.</p>
<p>Eastman, Jonathan M., Michael E. Alfaro, Paul Joyce, Andrew L. Hipp, and Luke J. Harmon. 2011. “A NOVEL COMPARATIVE METHOD FOR IDENTIFYING SHIFTS IN THE RATE OF CHARACTER EVOLUTION ON TREES.” <em>Evolution</em> 65 (jul): 3578–3589. doi:10.1111/j.1558-5646.2011.01401.x. <a href="http://doi.wiley.com/10.1111/j.1558-5646.2011.01401.x" title="http://doi.wiley.com/10.1111/j.1558-5646.2011.01401.x">http://doi.wiley.com/10.1111/j.1558-5646.2011.01401.x</a>.</p>
<p>Evans, Margaret E. K., Stephen a Smith, Rachel S. Flynn, and Michael J. Donoghue. 2009. “Climate, niche evolution, and diversification of the ‘bird-cage’ evening primroses (Oenothera, sections Anogra and Kleinia).” <em>The American naturalist</em> 173 (feb): 225–40. doi:10.1086/595757. <a href="http://www.ncbi.nlm.nih.gov/pubmed/19072708" title="http://www.ncbi.nlm.nih.gov/pubmed/19072708">http://www.ncbi.nlm.nih.gov/pubmed/19072708</a>.</p>
<p>Fairbairn, Daphne J. 2010. “THE ADVENT OF MANDATORY DATA ARCHIVING.” <em>Evolution</em> (nov). doi:10.1111/j.1558-5646.2010.01182.x. <a href="http://doi.wiley.com/10.1111/j.1558-5646.2010.01182.x" title="http://doi.wiley.com/10.1111/j.1558-5646.2010.01182.x">http://doi.wiley.com/10.1111/j.1558-5646.2010.01182.x</a>.</p>
<p>FitzJohn, Richard G., Wayne P. Maddison, and Sarah P. Otto. 2009. “Estimating trait-dependent speciation and extinction rates from incompletely resolved phylogenies.” <em>Systematic biology</em> 58 (dec): 595–611. doi:10.1093/sysbio/syp067. <a href="http://www.ncbi.nlm.nih.gov/pubmed/20525612" title="http://www.ncbi.nlm.nih.gov/pubmed/20525612">http://www.ncbi.nlm.nih.gov/pubmed/20525612</a>.</p>
<p>Fitzjohn, Richard G. 2010. “Quantitative Traits and Diversification.” <em>Systematic biology</em> 59 (sep): 619–633. doi:10.1093/sysbio/syq053. <a href="http://www.ncbi.nlm.nih.gov/pubmed/20884813" title="http://www.ncbi.nlm.nih.gov/pubmed/20884813">http://www.ncbi.nlm.nih.gov/pubmed/20884813</a>.</p>
<p>Gentleman, Robert, and D. Temple Lang. 2004. “Statistical analyses and reproducible research.” <em>Bioconductor Project Working Papers</em>: 2. <a href="http://www.bepress.com/cgi/viewcontent.cgi?article=1001\&amp;amp;context=bioconductor" title="http://www.bepress.com/cgi/viewcontent.cgi?article=1001\&amp;amp;context=bioconductor">http://www.bepress.com/cgi/viewcontent.cgi?article=1001\&amp;amp;context=bioconductor</a>.</p>
<p>Goldberg, Emma E., Lesley T. Lancaster, and Richard H. Ree. 2011. “Phylogenetic Inference of Reciprocal Effects between Geographic Range Evolution and Diversification.” <em>Systematic biology</em> 60 (may): 451–465. doi:10.1093/sysbio/syr046. <a href="http://www.ncbi.nlm.nih.gov/pubmed/21551125" title="http://www.ncbi.nlm.nih.gov/pubmed/21551125">http://www.ncbi.nlm.nih.gov/pubmed/21551125</a>.</p>
<p>Harmon, Luke J., Jason T. Weir, Chad D. Brock, Richard E. Glor, and Wendell Challenger. 2008. “Geiger: investigating evolutionary radiations.” <em>Bioinformatics</em> 24: 129–131. doi:10.1093/bioinformatics/btm538.</p>
<p>Hipp, Andrew L., and Marcial Escudero. 2010. “MATICCE: mapping transitions in continuous character evolution.” <em>Bioinformatics</em> 26: 132–3. doi:10.1093/bioinformatics/btp625. <a href="http://www.ncbi.nlm.nih.gov/pubmed/19880368" title="http://www.ncbi.nlm.nih.gov/pubmed/19880368">http://www.ncbi.nlm.nih.gov/pubmed/19880368</a>.</p>
<p>Huelsenbeck, John P., and Fredrik Ronquist. 2001. “MRBAYES: Bayesian inference of phylogenetic trees.” <em>Bioinformatics (Oxford, England)</em> 17 (aug): 754–5. doi:10.1093/bioinformatics/17.8.754. <a href="http://www.ncbi.nlm.nih.gov/pubmed/11524383" title="http://www.ncbi.nlm.nih.gov/pubmed/11524383">http://www.ncbi.nlm.nih.gov/pubmed/11524383</a>.</p>
<p>Jombart, Thibaut, François Balloux, and Stéphane Dray. 2010. “Adephylo: New Tools for Investigating the Phylogenetic Signal in Biological Traits.” <em>Bioinformatics (Oxford, England)</em> 26 (aug): 1907–9. doi:10.1093/bioinformatics/btq292. <a href="http://www.ncbi.nlm.nih.gov/pubmed/20525823" title="http://www.ncbi.nlm.nih.gov/pubmed/20525823">http://www.ncbi.nlm.nih.gov/pubmed/20525823</a>.</p>
<p>Kembel, Steven W., Peter D. Cowan, Matthew R. Helmus, William K. Cornwell, Helene Morlon, David D. Ackerly, Simon P. Blomberg, and Campbell O. Webb. 2010. “Picante: R tools for integrating phylogenies and ecology.” <em>Bioinformatics (Oxford, England)</em> 26 (jun): 1463–4. doi:10.1093/bioinformatics/btq166. <a href="http://www.ncbi.nlm.nih.gov/pubmed/20395285" title="http://www.ncbi.nlm.nih.gov/pubmed/20395285">http://www.ncbi.nlm.nih.gov/pubmed/20395285</a>.</p>
<p>Laubach, Thomas, and Arndt von Haeseler. 2007. “TreeSnatcher: coding trees from images.” <em>Bioinformatics (Oxford, England)</em> 23 (dec): 3384–5. doi:10.1093/bioinformatics/btm438. <a href="http://www.ncbi.nlm.nih.gov/pubmed/17893085" title="http://www.ncbi.nlm.nih.gov/pubmed/17893085">http://www.ncbi.nlm.nih.gov/pubmed/17893085</a>.</p>
<p>Maddison, W. P., and D. R. Maddison. 2011. “Mesquite: a modular system for evolutionary analysis.” <a href="http://mesquiteproject.org" title="http://mesquiteproject.org">http://mesquiteproject.org</a>.</p>
<p>Martins, E. P. 2004. “COMPARE, version Computer programs for the statistical analysis of comparative data.” Bloomington IN.: Department of Biology, Indiana University. <a href="http://compare.bio.indiana.edu/" title="http://compare.bio.indiana.edu/">http://compare.bio.indiana.edu/</a>.</p>
<p>McPeek, Mark a. 2008. “The ecological dynamics of clade diversification and community assembly.” <em>The American naturalist</em> 172 (dec): 270. doi:10.1086/593137. <a href="http://www.ncbi.nlm.nih.gov/pubmed/18851684" title="http://www.ncbi.nlm.nih.gov/pubmed/18851684">http://www.ncbi.nlm.nih.gov/pubmed/18851684</a>.</p>
<p>McPeek, Mark a, and Jonathan M. Brown. 2007. “Clade age and not diversification rate explains species richness among animal taxa.” <em>The American naturalist</em> 169 (apr): 97. doi:10.1086/512135. <a href="http://www.ncbi.nlm.nih.gov/pubmed/17427118" title="http://www.ncbi.nlm.nih.gov/pubmed/17427118">http://www.ncbi.nlm.nih.gov/pubmed/17427118</a>.</p>
<p>Morell, V. 1996. “TreeBASE: the roots of phylogeny.” <em>Science</em> 273: 569. doi:10.1126/science.273.5275.569. <a href="http://www.sciencemag.org/cgi/doi/10.1126/science.273.5275.569" title="http://www.sciencemag.org/cgi/doi/10.1126/science.273.5275.569">http://www.sciencemag.org/cgi/doi/10.1126/science.273.5275.569</a>.</p>
<p>Paradis, Emmanuel. 2004. “APE: Analyses of Phylogenetics and Evolution in R language.” <em>Bioinformatics</em> 20: 289–290. doi:10.1093/bioinformatics/btg412. <a href="http://www.bioinformatics.oupjournals.org/cgi/doi/10.1093/bioinformatics/btg412" title="http://www.bioinformatics.oupjournals.org/cgi/doi/10.1093/bioinformatics/btg412">http://www.bioinformatics.oupjournals.org/cgi/doi/10.1093/bioinformatics/btg412</a>.</p>
<p>Parr, Cynthia S., Robert Guralnick, Nico Cellinese, and Roderic D. M. Page. 2011. “Evolutionary informatics: unifying knowledge about the diversity of life.” <em>Trends in ecology &amp; evolution</em> 27 (dec): 94–103. doi:10.1016/j.tree.2011.11.001. <a href="http://www.ncbi.nlm.nih.gov/pubmed/22154516" title="http://www.ncbi.nlm.nih.gov/pubmed/22154516">http://www.ncbi.nlm.nih.gov/pubmed/22154516</a>.</p>
<p>Peng, Changhui, Joel Guiot, Haibin Wu, Hong Jiang, and Yiqi Luo. 2011. “Integrating models with data in ecology and palaeoecology: advances towards a model-data fusion approach.” <em>Ecology letters</em> (mar). doi:10.1111/j.1461-0248.2011.01603.x. <a href="http://www.ncbi.nlm.nih.gov/pubmed/21366814" title="http://www.ncbi.nlm.nih.gov/pubmed/21366814">http://www.ncbi.nlm.nih.gov/pubmed/21366814</a>.</p>
<p>Peng, R. D. 2011. “Reproducible Research in Computational Science.” <em>Science</em> 334 (dec): 1226–1227. doi:10.1126/science.1213847. <a href="http://www.sciencemag.org/cgi/doi/10.1126/science.1213847" title="http://www.sciencemag.org/cgi/doi/10.1126/science.1213847">http://www.sciencemag.org/cgi/doi/10.1126/science.1213847</a>.</p>
<p>Phillimore, Albert B., and Trevor D. Price. 2008. “Density-dependent cladogenesis in birds.” <em>PLoS biology</em> 6 (mar): 71. doi:10.1371/journal.pbio.0060071. <a href="http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2270327\&amp;tool=pmcentrez\&amp;rendertype=abstract" title="http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2270327\&amp;tool=pmcentrez\&amp;rendertype=abstract">http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2270327\&amp;tool=pmcentrez\&amp;rendertype=abstract</a>.</p>
<p>Piwowar, Heather A., Todd J. Vision, and Michael C. Whitlock. 2011. “Data archiving is a good investment.” <em>Nature</em> 473 (may): 285–285. doi:10.1038/473285a. <a href="http://www.nature.com/doifinder/10.1038/473285a" title="http://www.nature.com/doifinder/10.1038/473285a">http://www.nature.com/doifinder/10.1038/473285a</a>.</p>
<p>Pybus, O. G., and P. H. Harvey. 2000. “Testing macro-evolutionary models using incomplete molecular phylogenies.” <em>Proceedings of The Royal Society B</em> 267 (nov): 2267–72. doi:10.1098/rspb.2000.1278. <a href="http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=1690817\&amp;tool=pmcentrez\&amp;rendertype=abstract" title="http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=1690817\&amp;tool=pmcentrez\&amp;rendertype=abstract">http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=1690817\&amp;tool=pmcentrez\&amp;rendertype=abstract</a>.</p>
<p>Quental, Tiago B., and Charles R. Marshall. 2010. “Diversity dynamics: molecular phylogenies need the fossil record.” <em>Trends in Ecology &amp; Evolution</em> (jun): 1–8. doi:10.1016/j.tree.2010.05.002. <a href="http://linkinghub.elsevier.com/retrieve/pii/S0169534710001011" title="http://linkinghub.elsevier.com/retrieve/pii/S0169534710001011">http://linkinghub.elsevier.com/retrieve/pii/S0169534710001011</a>.</p>
<p>R Development Core Team, The. 2012. “R: A language and environment for statistical computing.” Vienna, Austria: R Foundation for Statistical Computing. <a href="http://www.r-project.org/" title="http://www.r-project.org/">http://www.r-project.org/</a>.</p>
<p>Rabosky, Daniel L. 2006. “LASER: a maximum likelihood toolkit for detecting temporal shifts in diversification rates from molecular phylogenies.” <em>Evolutionary bioinformatics online</em> 2 (jan): 273–6. <a href="http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2674670\&amp;tool=pmcentrez\&amp;rendertype=abstract" title="http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2674670\&amp;tool=pmcentrez\&amp;rendertype=abstract">http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2674670\&amp;tool=pmcentrez\&amp;rendertype=abstract</a>.</p>
<p>Revell, Liam J., D. Luke Mahler, Pedro R. Peres-Neto, and Benjamin D. Redelings. 2011. “a New Phylogenetic Method for Identifying Exceptional Phenotypic Diversification.” <em>Evolution</em> (aug). doi:10.1111/j.1558-5646.2011.01435.x. <a href="http://doi.wiley.com/10.1111/j.1558-5646.2011.01435.x" title="http://doi.wiley.com/10.1111/j.1558-5646.2011.01435.x">http://doi.wiley.com/10.1111/j.1558-5646.2011.01435.x</a>.</p>
<p>Sanderson, M. J., M. J. Donoghue, W. Piel, and T. Eriksson. 1994. “TreeBASE: a prototype database of phylogenetic analyses and an interactive tool for browsing the phylogeny of life.” <em>American Journal of Botany</em> 81: 183.</p>
<p>Schliep, Klaus Peter. 2010. “phangorn: Phylogenetic analysis in R.” <em>Bioinformatics (Oxford, England)</em> 27 (dec): 592–593. doi:10.1093/bioinformatics/btq706. <a href="http://www.ncbi.nlm.nih.gov/pubmed/21169378" title="http://www.ncbi.nlm.nih.gov/pubmed/21169378">http://www.ncbi.nlm.nih.gov/pubmed/21169378</a>.</p>
<p>Schwab, M., N. Karrenbach, and J. Claerbout. 2000. “Making scientific computations reproducible.” <em>Computing in Science &amp; Engineering</em> 2: 61–67. <a href="http://ieeexplore.ieee.org/lpdocs/epic03/wrapper.htm?arnumber=881708" title="http://ieeexplore.ieee.org/lpdocs/epic03/wrapper.htm?arnumber=881708">http://ieeexplore.ieee.org/lpdocs/epic03/wrapper.htm?arnumber=881708</a>.</p>
<p>Stadler, Tanja. 2011a. “Simulating Trees with a Fixed Number of Extant Species.” <em>Systematic biology</em> (apr). doi:10.1093/sysbio/syr029. <a href="http://www.ncbi.nlm.nih.gov/pubmed/21482552" title="http://www.ncbi.nlm.nih.gov/pubmed/21482552">http://www.ncbi.nlm.nih.gov/pubmed/21482552</a>.</p>
<p>———. 2011b. “Mammalian phylogeny reveals recent diversification rate shifts.” <em>Proceedings of the National Academy of Sciences</em> 2011 (mar). doi:10.1073/pnas.1016876108. <a href="http://www.pnas.org/cgi/doi/10.1073/pnas.1016876108" title="http://www.pnas.org/cgi/doi/10.1073/pnas.1016876108">http://www.pnas.org/cgi/doi/10.1073/pnas.1016876108</a>.</p>
<p>Stamatakis, Alexandros. 2006. “RAxML-VI-HPC: maximum likelihood-based phylogenetic analyses with thousands of taxa and mixed models.” <em>Bioinformatics (Oxford, England)</em> 22 (nov): 2688–90. doi:10.1093/bioinformatics/btl446. <a href="http://www.ncbi.nlm.nih.gov/pubmed/16928733" title="http://www.ncbi.nlm.nih.gov/pubmed/16928733">http://www.ncbi.nlm.nih.gov/pubmed/16928733</a>.</p>
<p>Warren, Dan L., Richard E. Glor, and Michael Turelli. 2008. “Environmental niche equivalency versus conservatism: quantitative approaches to niche evolution.” <em>Evolution</em> 62 (nov): 2868–83. doi:10.1111/j.1558-5646.2008.00482.x. <a href="http://www.ncbi.nlm.nih.gov/pubmed/18752605" title="http://www.ncbi.nlm.nih.gov/pubmed/18752605">http://www.ncbi.nlm.nih.gov/pubmed/18752605</a>.</p>
<p>Webb, Campbell O., David D. Ackerly, and Steven W. Kembel. 2008. “Phylocom: software for the analysis of phylogenetic community structure and trait evolution.” <em>Bioinformatics (Oxford, England)</em> 24 (sep): 2098–100. doi:10.1093/bioinformatics/btn358. <a href="http://www.ncbi.nlm.nih.gov/pubmed/18678590" title="http://www.ncbi.nlm.nih.gov/pubmed/18678590">http://www.ncbi.nlm.nih.gov/pubmed/18678590</a>.</p>
<p>Whitlock, Michael C., Mark a McPeek, Mark D. Rausher, Loren Rieseberg, and Allen J. Moore. 2010. “Data archiving.” <em>The American naturalist</em> 175 (mar): 145–6. doi:10.1086/650340. <a href="http://www.ncbi.nlm.nih.gov/pubmed/20073990" title="http://www.ncbi.nlm.nih.gov/pubmed/20073990">http://www.ncbi.nlm.nih.gov/pubmed/20073990</a>.</p>
<p>sukumaran, and mark t holder. 2010. “DendroPy: A Python Library for Phylogenetic Computing.” <em>Bioinformatics</em> 26 (apr): 1569–1571. doi:10.1093/bioinformatics/btq228. <a href="http://www.ncbi.nlm.nih.gov/pubmed/20421198" title="http://www.ncbi.nlm.nih.gov/pubmed/20421198">http://www.ncbi.nlm.nih.gov/pubmed/20421198</a>.</p>
</body>
</html>
