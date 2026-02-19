#' Get dataset's geography : codes and labels
#'
#' Retrieves the list of geo dimensions and all their possible values
#' (codes and human-readable labels) for a given dataset.
#'
#' For other dimensions, refer to get_range()
#'
#' @param ds_name dataset name
#' @param lang french or english labels - default french ("fr")
#'
#' @return A data frame with columns `GEO_REF`, `GEO_OBJECT`, `GEO_OBJECT_LABEL`, `GEO`, `GEO_LABEL`
#' @export
#'
#' @examples
#' get_range_geo("DS_POPULATIONS_REFERENCE") |>
#'   head()
get_range_geo <- function(
  ds_name,
  lang = "fr"
) {
  # check parameters
  if (!lang %in% c("fr", "en")) {
    stop("lang must be : fr or en")
  }
  url <- glue::glue("{getOption('rmelodi.base_url_api')}/range/{ds_name}")

  message("Request dataset range : ", url)

  dataset <- httr2::request(url) |>
    httr2::req_user_agent(getOption("rmelodi.req_user_agent")) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = FALSE)

  # Keep GEO only
  range_geo <- dataset$range |>
    purrr::keep(\(x) x$concept$code == "GEO") |>
    purrr::pluck(1, "values")

  if (is.null(range_geo) || length(range_geo) == 0) {
    stop("Error: 'GEO' dimension is not present in the dataset.")
  }

  # Unfold
  codebook_df <- tibble::tibble(
    GEO_LABEL        = purrr::map_chr(range_geo, ~ .x$label[[lang]] %||% NA_character_),
    GEO_OBJECT_LABEL = purrr::map_chr(range_geo, ~ .x$type[[lang]] %||% NA_character_),
    value_id         = purrr::map_chr(range_geo, "id", .default = NA_character_)
  ) |>
    tidyr::separate_wider_delim(
      value_id,
      delim = "-",
      names = c("GEO_REF", "GEO_OBJECT", "GEO"),
    ) |>
    dplyr::select(GEO_REF, GEO_OBJECT, GEO_OBJECT_LABEL, GEO, GEO_LABEL) |>
    dplyr::arrange(GEO_OBJECT, GEO)

  return(codebook_df)
}
