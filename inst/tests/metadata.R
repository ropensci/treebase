context("Metadata")

test_that("metadata works as expected", {
          expect_that(is(metadata(), "data.frame"), is_true())
})
