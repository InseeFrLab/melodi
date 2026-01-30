#' Get dataset metadata
#'
#' @param ds_name Dataset name
#' @param base_url_melodi API Melodi URL - default production URL
#'
#' @return list dataset metadata
#' @export
#'
#' @examples
#' get_metadata("DS_POPULATIONS_REFERENCE")
get_metadata <- function(
  ds_name,
  base_url_melodi = "https://api.insee.fr/melodi"
) {
  url <- glue::glue("{base_url_melodi}/catalog/{ds_name}")

  message("Request dataset : ", url)

  dataset <- httr2::request(url) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE)

  return(dataset)
}
