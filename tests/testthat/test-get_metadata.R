vcr::use_cassette("get_metadata_deces", {
  test_that("get ds OK", {
    expect_no_error(ds <- get_metadata("DS_EC_DECES"))

    expect_type(object = ds, type = "list")

  })
})
