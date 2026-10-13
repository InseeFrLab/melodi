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
  # erreur API simulee par erreur d'url
  options(rmelodi.base_url_api = "https://url-qui-n-existe-pas.com")

  expect_message(
    object = get_catalog(),
    regexp = "Could not get data"
  )

  # on remet l'option par défaut pour que les autres tests passent
  options(rmelodi.base_url_api = "https://api.insee.fr/melodi")
})
