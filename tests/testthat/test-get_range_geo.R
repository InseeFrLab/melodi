test_that("get_range_geo returns a data frame with expected columns", {
  result <- get_range_geo("DS_POPULATIONS_REFERENCE")

  expect_s3_class(result, "data.frame")
  expect_true(
    all(
      c("GEO_REF", "GEO_OBJECT", "GEO", "GEO_LABEL")
                    %in% colnames(result)
    )
    )
  expect_true(nrow(result) > 0)
})
