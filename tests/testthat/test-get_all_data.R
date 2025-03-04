# TODO VCR does not yet work with httr2 writing to disk
# https://github.com/ropensci/vcr/issues/270
# => no VCR here
test_that("get all data OK", {
  expect_no_error(
    # small DS for tests
    ds <- get_all_data("DS_SRCV_CONFIANCE")
  )

  # vérifie qu'on a bien des lignes de données !
  expect_gt(
    object = nrow(ds),
    expected = 0
  )

  # vérifie que l'ajout des label a été fait
  expect_equal(
    object = labelled::get_variable_labels(ds)$OBS_VALUE,
    expected = "Valeur"
  )

  expect_s3_class(
    object = ds,
    class = "data.frame"
  )

  # verification pas de factor
  expect_type(
    object = ds$OBS_STATUS,
    type = "character"
  )
})

test_that("get stringAsFactor OK", {
  expect_no_error(
    # small DS for tests
    ds <- get_all_data(ds_name = "DS_SRCV_CONFIANCE",
                       stringsAsFactors = TRUE)
  )

  # verification pas de factor
  expect_s3_class(
    object = ds$OBS_STATUS,
    class = "factor"
  )
})

test_that("get all data national sans GEO", {

  expect_no_error(
    # small DS for tests
    ds <- get_all_data("DS_TICM_PRATIQUES")
  )

  # vérifie qu'on a bien des lignes de données !
  expect_gt(
    object = nrow(ds),
    expected = 0
  )

  # vérifie que l'ajout des label a été fait
  expect_equal(
    object = labelled::get_variable_labels(ds)$OBS_VALUE,
    expected = "Valeur"
  )

})

test_that("get all data KO", {

  expect_error(
    ds <- get_all_data("DS_NEXISTEPAS")
  )
})
