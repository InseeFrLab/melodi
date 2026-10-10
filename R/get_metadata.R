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
    httr2::req_user_agent(getOption("rmelodi.req_user_agent")) |>
    httr2::req_retry(max_tries = 3, max_seconds = 30, retry_on_failure = TRUE) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE) |>
    tryCatch(error = \(e) message("Could not get data: ", conditionMessage(e)))
  # API failed gracefully: exit quietly (return() only works inside a function)
  if (is.null(dataset)) return(invisible(NULL))

  return(dataset)
}
