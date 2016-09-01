context("Metadata")

test_that("metadata works as expected", {
          skip_on_cran()
          expect_that(is(metadata(), "data.frame"), is_true())
          
          kind <- phylo_metadata("kind")
          type <- phylo_metadata("type") 
          table(kind, type)
          
          
})
