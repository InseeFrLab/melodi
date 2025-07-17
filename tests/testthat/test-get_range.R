test_that("get_range returns a data frame with expected columns", {
  result <- get_range("DS_POPULATIONS_REFERENCE")

  expect_s3_class(result, "data.frame")
  expect_true(
    all(
        c("dimension", "dimension_label", "value", "value_label")
        %in% colnames(result)
      )
    )
  expect_true(nrow(result) > 0)
})

