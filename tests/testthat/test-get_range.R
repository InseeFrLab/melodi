vcr::use_cassette("get_range_populations_reference", {
  test_that("get_range returns a data frame with expected columns and values", {
    range <- get_range("DS_POPULATIONS_REFERENCE")

    expect_s3_class(range, "data.frame")
    expect_true(
      all(
        c("DIM", "DIM_LABEL", "MOD", "MOD_LABEL") %in%
          colnames(range)
      )
    )
    expect_true(nrow(range) > 0)
    # Check GEO_REF list
    # # Check one label is OK
    expect_equal(
      object = range %>%
        dplyr::filter(DIM == "POPREF_MEASURE" & MOD == "PTOT") %>%
        dplyr::pull(MOD_LABEL),
      expected = "Population totale"
    )
  })
})
