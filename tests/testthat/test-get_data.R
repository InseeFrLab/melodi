vcr::use_cassette("get_data_popref_nantes", {
  test_that("get data OK", {
    expect_no_error(
      data <- get_data(
        "https://api.insee.fr/melodi/data/DS_POPULATIONS_REFERENCE?FREQ=A&GEO=COM-44109"
      )
    )

    # vérifie qu'on a bien des lignes de données !
    expect_gt(
      object = nrow(data),
      expected = 0
    )
  })
})

vcr::use_cassette("get_data_popref_empty", {
  test_that("get data 0 values", {
    expect_error(
      object = get_data(
        "https://api.insee.fr/melodi/data/DS_POPULATIONS_REFERENCE?TIME_PERIOD=1900&GEO=COM-44109"
      ),
      regexp = "No result for request"
    )
  })
})

vcr::use_cassette("get_data_popref_over", {
  test_that("get data over limit", {
    expect_error(
      object = get_data(
        "https://api.insee.fr/melodi/data/DS_POPULATIONS_REFERENCE"
      ),
      regexp = "please filter your request"
    )
  })
})

vcr::use_cassette("get_data_not_exist", {
  test_that("get data DS not exists", {
    expect_error(
      object = get_data(
        "https://api.insee.fr/melodi/data/DS_NEXISTEPAS"
      )
    )
  })
})

vcr::use_cassette("get_data_obs_value_indice_prix", {
  # Reproduction du bug lorsque le retour n'est pas OBS_VALUE_NIVEAU
  test_that("get data OBS_VALUE_INDICE_DE_PRIX", {
    expect_no_error(
      data <- get_data(
        "https://api.insee.fr/melodi/data/DS_IPC_PRINC?IND_TYPE=IX&GEO=DEP-974&TIME_PERIOD=2026-01&PRODUCT_GROUP=4000"
      )
    )

    # TODO test verifier OBS_VALUE
  })
})
