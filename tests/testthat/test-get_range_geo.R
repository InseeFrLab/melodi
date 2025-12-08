vcr::use_cassette("get_range_geo_ec_deces", {
  test_that("get_range_geo returns a data frame with expected columns and values", {
    range_geo <- get_range_geo("DS_EC_DECES")

    expect_s3_class(range_geo, "data.frame")
    expect_true(
      all(
        c("GEO_REF", "GEO_OBJECT", "GEO", "GEO_LABEL") %in%
          colnames(range_geo)
      )
      )
    expect_true(nrow(range_geo) > 0)
    # Check GEO_REF list
    expect_equal(
      object = unique(range_geo$GEO_REF),
      expected = c("2022")
    )
    # Check GEO_OBJECT list
    expect_equal(
      object = unique(range_geo$GEO_OBJECT),
      expected = c("DEP", "FRANCE", "OTHER", "REG")
    )
    # Check one label is OK
    expect_equal(
      object = range_geo %>%
        dplyr::filter(GEO == "44" & GEO_OBJECT == "DEP") %>%
        dplyr::pull(GEO_LABEL),
      expected = "Loire-Atlantique"
    )
  })
})

vcr::use_cassette("get_range_geo_DS_IPCH_M", {
  test_that("get_range_geo with DS without geography", {
    expect_error(
      object = get_range_geo("DS_IPCH_M"),
      regexp = "'GEO' dimension is not present in the dataset"
    )
  })
})
