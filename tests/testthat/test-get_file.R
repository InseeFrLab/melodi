vcr::use_cassette("get_file_deces", {
  test_that("get file OK", {
    expect_no_error(
      # small file for tests
      path <- get_file(
        ds_name = "DS_EC_DECES",
        file_name = "T1_DECES_JOUR_NAT_FR",
        download_file_name = "TEST2.XLSX"
      )
    )
    # verification que le nom du fichier correspond à celui demandé
    expect_match(
      object = path,
      regexp = "TEST2.XLSX"
    )
  })
})

vcr::use_cassette("get_file_deces_preserve_filename", {
  test_that("get file OK", {
    expect_no_error(
      # small file for tests
      path <- get_file(
        ds_name = "DS_EC_DECES",
        file_name = "T1_DECES_JOUR_NAT_FR"
      )
    )

    # verification que le nom du fichier correspond à celui de Melodi
    expect_match(
      object = path,
      regexp = "T1_DECES_JOUR_NAT_FR.xlsx"
    )
  })
})
