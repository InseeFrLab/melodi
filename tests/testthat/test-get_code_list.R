vcr::use_cassette("get_code_list_age_fr", {
  test_that("get code list OK", {
    expect_no_error(
      code_list <- get_code_list("CL_AGE")
    )

    expect_gt(
      object = nrow(code_list),
      expected = 0
    )
  })
})

vcr::use_cassette("get_code_list_legal_form_en", {
  test_that("get code list OK", {
    expect_no_error(
      code_list <- get_code_list(
        id = "Cl_Legal_FoRm",
        lang = "en"
      )
    )

    expect_gt(
      object = nrow(code_list),
      expected = 0
    )
  })
})

vcr::use_cassette("get_code_list_ko", {
  test_that("get code list KO", {
    expect_error(
      object = get_code_list("CL_DOESNOTEXIST"),
      regexp = "No result"
    )
  })
})
