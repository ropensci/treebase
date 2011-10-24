# demos
# the search prints url to the query.  Paste into a commandline to explore in a browser
require(treebase)

# defaults to return phylogeny 
Huelsenbeck <- search_treebase("Huelsenbeck", by="author")

# can ask for character matrices:
wingless <- search_treebase("2907", by="id.matrix", returns="matrix")

## Some nexus matrices don't meet read.nexus.data's strict requirements,
## these aren't returned
H_matrices <- search_treebase("Huelsenbeck", by="author", returns="matrix")

## Use Booleans in search: and, or, not
## Note that by must identify each entry type if a Boolean is given
HR_trees <- search_treebase("Ronquist or Hulesenbeck", by=c("author", "author"))

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
m <- search_metadata("2011-01-01", by="until")
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
dates <- sapply(all, function(x) as.numeric(x$date))
hist(dates, main="TreeBase growth", xlab="Year")


journals <- sapply(all, function(x) x$publisher)
J <- tail(sort(table(as.factor(unlist(journals)))),5)
b<- barplot(as.numeric(J))
text(b, names(J), srt=70, pos=4, xpd=T)



nature <- sapply(all, function(x) length(grep("Nature", x$publisher))>0)
science <- sapply(all, function(x) length(grep("^Science$", x$publisher))>0)


s <- get_study_id( all[nature] )
nature_trees <- sapply(s, function(x) search_treebase(x, "id.study"))
s <- get_study_id(all[science])
science_trees <- sapply(s, function(x) search_treebase(x, "id.study", branch=T))


## some trees have keywords, we can pull these and search for them.
topics <- sapply(all, 
                 function(x){ 
                   w <- match("subject", names(x))
                   x[w]
                   })
all[grep("[Cc]omparative", topics)]

# we can also list topics.  other than "in press", nothing is used frequently
unlist(topics[!sapply(topics, is.null)]) -> topics
#topics[topics != "in press"]


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


## all Systematic Biology trees from the last 2 years with branch lengths
sb <- sapply(all, function(x) length(grep("^Systematic Biology$", x$publisher))>0)
s <- sapply(all[sb], function(x) as.numeric(x$date)>=2010)
sb_2010_2011_trees <- get_study_id(all[sb][s])
sb_trees <- lapply(sb_2010_2011_trees, function(x) search_treebase(x, "id.study", branch=TRUE))


## See long_examples.R for some more research-oriented applications

