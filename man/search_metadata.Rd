\name{search_metadata}
\alias{search_metadata}
\title{
  Search the TreeBASE metadata by year
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
search_metadata(query, by = c("until", "from", "all"), curl = getCurlHandle())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{query}{
  A date in format "%Y-%m-%d" 
}
  \item{by}{
    until -- all trees deposited up until given date
    from -- all trees deposited from given date on
    all -- all trees (needs no date, give blank or is ignored)
}
  \item{curl}{
    leave as default
}
}
\value{
 Returns a list with all metadata
}
\references{
  Project Development portal: \url{https://github.com/cboettig/treeBASE}
  TreeBASE phylo-ws API: \url{http://sourceforge.net/apps/mediawiki/treebase/index.php?title=API}
  TreeBASE OAI-PMH API: \url{http://sourceforge.net/apps/mediawiki/treebase/index.php?title=OAI-PMH}
  Dryad API: \url{https://datadryad.org/wiki/API}
}
\author{
Carl Boettiger \email{cboettig@gmail.com}
}


\examples{
  \dontrun{
    
# get all trees from a certain depostition date forwards
    m <- search_metadata("1996-01-01", by="until")
# extract any metadata, i.e. publication date
    dates <- sapply(m, function(x) as.numeric(x$date))
    hist(dates, main="TreeBase growth", xlab="Year")

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
# publication date is only a year i
## MANY TREES, may be SLOW
post2010 <- sapply(dates, function(x) 2010 < as.numeric(x))
s <- get_study_id( all[post2010] )
out <- lapply(s, function(x) search_treebase(x, "id.study"))


# Grab the trees entered since 2011: (some studies will have multiple trees)
#can compare dates with as.Date("2001-01-01", "%y-%m-%d) < as.Date ...
m <- search_metadata("2011-05-05", by="from")
s <- get_study_id(m)
out <- lapply(s, function(x) search_treebase(x, "id.study"))



  }
}
