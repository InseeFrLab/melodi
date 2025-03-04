vcr::use_cassette("get_local_data_by_com_popref", {
  test_that("get local data OK", {

    expect_no_error(
      # Toutes les communes de Nantes Métropole
      local_data <- get_local_data_by_com(
        ds_name = "DS_POPULATIONS_REFERENCE",
        geo = "244400404",
        geo_object = "EPCI"
      )
    )

    lignes_incorrectes <- local_data |>
      dplyr::filter(substr(GEO, 1, 2) != "44" | GEO_OBJECT != "COM")

    expect_equal(
      object = nrow(lignes_incorrectes),
      expected = 0
    )
  })
})

vcr::use_cassette("get_local_data_filter_by_com_popref", {
  test_that("get local data with filter OK", {

    expect_no_error(
      # Toutes les communes de Nantes Métropole
      local_data <- get_local_data_by_com(
        ds_name = "DS_POPULATIONS_REFERENCE",
        geo = "244400404",
        geo_object = "EPCI",
        filter = "POPREF_MEASURE=PMUN"
      )
    )

    lignes_incorrectes <- local_data |>
      dplyr::filter(substr(GEO, 1, 2) != "44" |
                      GEO_OBJECT != "COM" |
                      POPREF_MEASURE != "PMUN")

    expect_equal(
      object = nrow(lignes_incorrectes),
      expected = 0
    )
  })
})
