vcr::use_cassette("get_local_data_popref", {
  test_that("get local data OK", {
    expect_no_error(
      local_data <- get_local_data(
        ds_name = "DS_POPULATIONS_REFERENCE",
        geo = "69",
        geo_object = "DEP"
      )
    )

    lignes_incorrectes <- local_data |>
      dplyr::filter(GEO != "69" | GEO_OBJECT != "DEP")

    expect_equal(
      object = nrow(lignes_incorrectes),
      expected = 0
    )
  })
})

vcr::use_cassette("get_local_data_filter_popref", {
  test_that("get local data with filter OK", {
    expect_no_error(
      local_data <- get_local_data(
        ds_name = "DS_POPULATIONS_REFERENCE",
        geo = "69",
        geo_object = "DEP",
        filter = "POPREF_MEASURE=PMUN"
      )
    )

    lignes_incorrectes <- local_data |>
      dplyr::filter(GEO != "69" |
        GEO_OBJECT != "DEP" |
        POPREF_MEASURE != "PMUN")

    expect_equal(
      object = nrow(lignes_incorrectes),
      expected = 0
    )
  })
})
