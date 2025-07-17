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

  test_that("get_range without filter", {
    range <- get_range(
      ds_name = "DS_POPULATIONS_REFERENCE",
      exclusions_list = c()
    )
    expect_true(nrow(range %>% dplyr::filter(DIM == "GEO")) > 0)
  })

  test_that("get_range with filter", {
    range <- get_range(
      ds_name = "DS_POPULATIONS_REFERENCE",
      exclusions_list = c("GEO", "TIME_PERIOD", "FREQ")
    )
    expect_true(nrow(range %>% dplyr::filter(DIM == "FREQ")) == 0)
  })
})

vcr::use_cassette("get_range_populations_reference_en", {
  test_that("get_range english", {
    range <- get_range(
      ds_name = "DS_POPULATIONS_REFERENCE",
      lang = "en",
      exclusions_list = c("GEO", "TIME_PERIOD", "FREQ")
    )
    # # Check one label is OK
    expect_equal(
      object = range %>%
        dplyr::filter(DIM == "POPREF_MEASURE" & MOD == "PTOT") %>%
        dplyr::pull(MOD_LABEL),
      expected = "Total population"
    )
  })
})
