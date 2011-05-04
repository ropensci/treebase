# treebase.R 
# 
   

mycon = url("http://purl.org/phylo/treebase/phylows/tree/TB2:Tr2026?format=nexus")

mydat = read.nexus(mycon)

close(mycon)


library(XML)

# doc returns an object of class XMLInternalDocument which can be read by xpaths
firstdoc = xmlParse(readLines(url("http://treebase.org/treebase-web/search/studySearch.html?query=dcterms.contributor=Bininda-Emonds&format=rss1&recordSchema=tree")))

cts = xmlParse(readLines(url("http://treebase.org/treebase-web/search/studySearch.html?query=tb.type.matrix=Continuous&format=rss1&recordSchema=tree")))

characterfiles <- xpathApply(cts, "//rdf:li",
  function(x)
  {
    # First, we need to follow the links
    #  Returns a named character vector of name-value pairs of attribute
    thepage <- xmlAttrs(x, "rdf:resource")
    
    ## This is equivalent to clicking on each link to a data file returned by the search
    seconddoc <- xmlParse(readLines(url(thepage)))
    
    ## On that page, again use xpathApply to find and return the nexus files
    node <- xpathApply(seconddoc, "//x:item[x:title='Nexus file']", namespaces=c(x="http://purl.org/rss/1.0/"),
      fun = function(x)
      {
        if(is.list(x))
          x = x[[1]]
        read.table(url(xmlValue(x[["link"]])))
      })
    
  })


# use an expath apply to extract nexus files
# specify document, 
nexusfiles <- xpathApply(firstdoc, "//rdf:li",
  function(x)
  {
    # First, we need to follow the links
    #  Returns a named character vector of name-value pairs of attribute
    thepage <- xmlAttrs(x, "rdf:resource")
    
    ## This is equivalent to clicking on each link to a data file returned by the search
    seconddoc <- xmlParse(readLines(url(thepage)))
    
    ## On that page, again use xpathApply to find and return the nexus files
    node <- xpathApply(seconddoc, "//x:item[x:title='Nexus file']", namespaces=c(x="http://purl.org/rss/1.0/"),
      fun = function(x)
      {
        if(is.list(x))
          x = x[[1]]
        read.nexus(url(xmlValue(x[["link"]])))
      })
    
  })


#exploring to write the above.
#seconddoc = xmlParse(readLines(url(items[1])))

#node = xpathSApply(seconddoc, "//x:item[x:title='Nexus file']", namespaces=c(x="http://purl.org/rss/1.0/"))
