# demos
# the search prints url to the query.  Paste into a commandline to explore in a browser
library(treebase)

# Grab all trees by an author.  Can't distinguish between S. Price and R. Price 
#price_trees <- search_treebase("Price", by="author")

## Use Booleans in search: and, or, not
## Note that by must identify each entry type if a Boolean is given
HR_trees <- search_treebase("Ronquist or Hulesenbeck", by=c("author", "author"))
Huelsenbeck <- search_treebase("Huelsenbeck", by="author")

## We'll often use max_trees in the example so that they run quickly, 
# notice the quotes for species.  
dolphins <- search_treebase('"Delphinus"', by="taxon", max_trees=5)

## can do exact matches
humans <- search_treebase('"Homo sapiens"', by="taxon", exact_match=TRUE, max_trees=10)

# all trees with 5 taxa
five <- search_treebase(5, by="ntax", max_trees = 10)

# These are different, a tree id isn't a Study id.  we report both
studies <- search_treebase("2377", by="id.study")
tree <- search_treebase("2377", by="id.tree")
c("TreeID" = tree$Tr.id, "StudyID" = tree$S.id)

# Only results wiht branch lengths
# Has to grab all the trees first, then toss out ones without branch_lengths
Near <- search_treebase("Near", "author", branch_lengths=TRUE)
length(Near)

#### Metadata examples ### 

# Use the OAI-PMH api to check out the metadata from the study in which tree is published:
metadata(Near[[1]]$S.id)
# or manualy give a sudy id
metadata("2377")



# get all trees from a certain depostition date forwards
m <- search_metadata("1996-01-01", by="until")
# extract any metadata, i.e. publication date
dates <- sapply(m, function(x) as.numeric(x$date))
hist(dates, main="TreeBase growth", xlab="Year")



######## Coupling metadata and tree searches ###########

# can search for studies deposited more recently than given date:
m <- search_metadata("2010-01-01", by="from")
# can do richer metadata slicing, i.e. query on date, summarize by author: 
authors <- sapply(m, function(x){
  index <- grep( "creator", names(x))
  x[index] 
  })
a <- as.factor(unlist(authors))
head(summary(a))


# Get metadata for all trees in treebase date 
all <- search_metadata("", by="all")
dates <- sapply(1:length(all), function(i) as.numeric(all[[i]]$date))
hist(dates, main="TreeBase growth", xlab="Year")

# Use that to get all trees "published" after 2010
# publication date is only a year
post2010 <- sapply(dates, function(x) 2010 < as.numeric(x))
s <- get_study_id( all[post2010] )

#out <- lapply(s, function(x) search_treebase(x, "id.study"))

# Grab the trees entered since 2011: (some studies will have multiple trees)
#can compare dates with as.Date("2001-01-01", "%y-%m-%d) < as.Date ...
m <- search_metadata("2011-05-05", by="from")
s <- get_study_id(m)
out <- lapply(s, function(x) search_treebase(x, "id.study"))


# Eventually want to be able to grab corresponding dryad entry ids.  then we could grab ids like:
dryad_metadata("10255/dryad.12")


## See long_examples.R for some more research-oriented applications

