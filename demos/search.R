# demos
# the search prints url to the query.  Paste into a commandline to explore in a browser
require(XML)
require(RCurl)
require(ape)
require(treebase)

price_trees <- search_treebase("Price", by="author")

## Need to say what the multiples are of.  must be in the same section
HR_trees <- search_treebase("Ronquist or Hulesenbeck", by=c("author", "author"))

Huelsenbeck <- search_treebase("Huelsenbeck", by="author")

# notice the quotes
whales <- search_treebase('"Cetecea"', by="taxon")

dolphins <- search_treebase('"Delphinus"', by="taxon")

humans <- search_treebase('"Homo sapiens"', by="taxon", exact_match=TRUE)
