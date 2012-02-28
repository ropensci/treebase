\name{search_metadata}
\alias{search_metadata}
\title{Search the metadata on treebase using the OAI-MPH interface}
\usage{
  search_metadata(query = "",
    by = c("all", "until", "from"), curl = getCurlHandle())
}
\arguments{
  \item{query}{a date in format yyyy-mm-dd}

  \item{by}{return all data "until" that date, "from" that
  date to current, or "all"}

  \item{curl}{if calling in series many times, call
  getCurlHandle() first and then pass the return value in
  here. Avoids repeated handshakes with server.}
}
\description{
  Search the metadata on treebase using the OAI-MPH
  interface
}
\details{
  query must be#' search_metadata(2010-01-01, by="until")
  all isn't a real query type, but will return all trees
  regardless of date
}
\examples{
\dontrun{
Near <- search_treebase("Near", "author", max_trees=1)
 metadata(Near[[1]]$S.id)
## or manualy give a sudy id
metadata("2377")

### get all trees from a certain depostition date forwards ##
m <- search_metadata("2009-01-01", by="until")
## extract any metadata, e.g. publication date:
dates <- sapply(m, function(x) as.numeric(x$date))
hist(dates, main="TreeBase growth", xlab="Year")

### show authors with most tree submissions in that date range
authors <- sapply(m, function(x){
   index <- grep( "creator", names(x))
     x[index]
})
a <- as.factor(unlist(authors))
head(summary(a))

## Show growth of TreeBASE
all <- search_metadata("", by="all")
dates <- sapply(all, function(x) as.numeric(x$date))
hist(dates, main="TreeBase growth", xlab="Year")

## make a barplot submission volume by journals
journals <- sapply(all, function(x) x$publisher)
J <- tail(sort(table(as.factor(unlist(journals)))),5)
b<- barplot(as.numeric(J))
text(b, names(J), srt=70, pos=4, xpd=T)
}
}

