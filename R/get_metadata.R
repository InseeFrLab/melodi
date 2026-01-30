#' Get dataset metadata
#'
#' @param ds_name Dataset name
#'
#' @return list dataset metadata
#' @export
#'
#' @examples
#' get_metadata("DS_POPULATIONS_REFERENCE")
get_metadata <- function(
  ds_name
) {
  url <- glue::glue("{getOption('rmelodi.base_url_api')}/catalog/{ds_name}")

  message("Request dataset : ", url)

  dataset <- httr2::request(url) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE)

  return(dataset)
}
