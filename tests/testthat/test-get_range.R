# Pour les tests, utilisation de DS_SUIVI_DDE_TOUR avec une range plus petite
# (pas de geo)
# pour alléger le dépôt (résultat stocké dans cassette .yml)
vcr::use_cassette("get_range_fr", {
  test_that("get_range returns a data frame with expected columns and values", {
    range <- get_range("DS_SUIVI_DDE_TOUR")

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
      object = range |>
        dplyr::filter(DIM == "TOUR_MEASURE" & MOD == "TRIPS") |>
        dplyr::pull(MOD_LABEL),
      expected = "Nombre de voyages"
    )
  })

  test_that("get_range without filter", {
    range <- get_range(
      ds_name = "DS_SUIVI_DDE_TOUR",
      exclusions_list = c()
    )
    expect_true(nrow(range |> dplyr::filter(DIM == "GEO")) > 0)
  })

  test_that("get_range with filter", {
    range <- get_range(
      ds_name = "DS_SUIVI_DDE_TOUR",
      exclusions_list = c("GEO", "TIME_PERIOD", "FREQ")
    )
    expect_true(nrow(range |> dplyr::filter(DIM == "FREQ")) == 0)
  })
})

vcr::use_cassette("get_range_en", {
  test_that("get_range english", {
    range <- get_range(
      ds_name = "DS_SUIVI_DDE_TOUR",
      lang = "en",
      exclusions_list = c("GEO", "TIME_PERIOD", "FREQ")
    )
    # # Check one label is OK
    expect_equal(
      object = range |>
        dplyr::filter(DIM == "TOUR_MEASURE" & MOD == "TRIPS") |>
        dplyr::pull(MOD_LABEL),
      expected = "Number of trips"
    )
  })
})
