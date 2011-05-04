
# User Interface -- a series of prompts to select the search options
# Sketching out only, not developed
search_interface <- function(){
  print("enter Study ID (TreeBASEII)")
  id <- scan
  cat("Select an option to search  \n
       1. Author
       2. Abstract 
       3. Bibliographic citation 
       4. Subject \n ")
  id <- scan(n=1)

# Searches can be done by study, taxon, tree, or matrix (tabs on treebase)
  cat("Author?\n")
  input <- scan(n=1)
# grep/gsub  for any formating corrections (remove spaces, etc)
}

