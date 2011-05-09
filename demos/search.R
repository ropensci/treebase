# demos
# the search prints url to the query.  Paste into a commandline to explore in a browser
require(XML)
require(RCurl)
require(ape)
require(treebase)

price_trees <- search_treebase("Price", by="author", section="study")

Ronquist_trees <- search_treebase("Ronquist", by="author", section="study")

Huelsenbeck <- search_treebase("Huelsenbeck", by="author", section="study")

whales <- search_treebase("Cetecea", by="taxon", section="taxon")

dolphins <- search_treebase("Delphinus", by="taxon", section="taxon")

humans <- search_treebase("Homo sapiens", by="taxon", exact_match=TRUE, section="taxon")
