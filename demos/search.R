# demos
# the search prints url to the query.  Paste into a commandline to explore in a browser
require(XML)
require(RCurl)
require(ape)
require(treebase)

price_trees <- search_treebase("Price", by="author")

## Note that by must identify each entry type if a Boolean is given
HR_trees <- search_treebase("Ronquist or Hulesenbeck", by=c("author", "author"))
Huelsenbeck <- search_treebase("Huelsenbeck", by="author")

# notice the quotes
dolphins <- search_treebase('"Delphinus"', by="taxon")
humans <- search_treebase('"Homo sapiens"', by="taxon", exact_match=TRUE)

five <- search_treebase(5, by="ntax")

studies <- search_treebase("2377", by="id.study")
tree <- search_treebase("2377", by="id.tree")

#whales <- search_treebase('"Cetecea"', by="taxon")

