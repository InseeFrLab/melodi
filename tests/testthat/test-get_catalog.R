vcr::use_cassette("get_catalog_fr", {
  test_that("get catalog OK", {

    expect_no_error(
      list_ds <- get_catalog()
    )

    expect_gt(
      object = nrow(list_ds),
      expected = 0
    )
  })
})

vcr::use_cassette("get_catalog_en", {
  test_that("get catalog lang EN OK", {

    expect_no_error(
      list_ds_en <- get_catalog(lang = "en")
    )

    expect_gt(
      object = nrow(list_ds_en),
      expected = 0
    )
  })
})

vcr::use_cassette("get_catalog_empty", {
  test_that("get catalog lang KO", {

    expect_error(
      object = get_catalog(lang = "nexiste-pas"),
      regexp = "lang must be"
    )
  })
})

# test valable pour toutes les fonctions requetant l'API Melodi
# en cas d'erreur côté API, verifier l'absence d'erreur du package (gestion "gracieuse")
test_that("Error API, OK", {

  #erreur API similee par erreur d'url
  expect_no_error({
    options(rmelodi.base_url_api = "https://apis.insee.fr/melodi")
    list_ds <- get_catalog()
  })

  expect_null(list_ds)
})

