#' Get dataset's geography : codes and labels
#'
#' Retrieves the list of geo dimensions and all their possible values
#' (codes and human-readable labels) for a given dataset.
#'
#' For other dimensions, refer to get_range()
#'
#' @param ds_name dataset name
#' @param base_url_melodi API Melodi URL - default production URL
#' @param lang french or english labels - default french ("fr")
#'
#' @return A data frame with columns `GEO_REF`, `GEO_OBJECT`, `GEO`, `GEO_LABEL`
#' @export
#'
#' @examples
#' get_range_geo("DS_POPULATIONS_REFERENCE")
#' get_range("DS_TICM_PRATIQUES")
get_range_geo <- function(
    ds_name,
    base_url_melodi = "https://api.insee.fr/melodi",
    lang = "fr"
) {
  # check parameters
  if (!lang %in% c("fr", "en")) {
    stop("lang must be : fr or en")
  }
  url <- paste0(base_url_melodi, "/range/", ds_name)

  message("Request dataset range : ", url)

  dataset <- httr2::request(url) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = FALSE)

  range <- dataset[["range"]]

  # Keep GEO only
  range <- Filter(function(x) {
    x[["concept"]][["code"]] == "GEO"
  }, range)

  if (length(range) == 0) {
    stop("Error: 'GEO' dimension is not present in the dataset.")
  }

  # for null cases (English GEO labels...)
  safe_extract <- function(x) {
    if (is.null(x)) NA else x
  }

  codebook_list <- list()

  for (i in seq_along(range)) {
    # concepts returned by the API are effectively dimensions of the dataset
    dimension <- range[[i]][["concept"]][["code"]] |> safe_extract()
    dimension_label <- range[[i]][["concept"]][["label"]][[lang]] |> safe_extract()

    values <- range[[i]][["values"]] |> safe_extract()

    for (j in seq_along(values)) {
      value <- values[[j]][["code"]] |> safe_extract()
      value_label <- values[[j]][["label"]][[lang]] |> safe_extract()
      value_id <- values[[j]][["id"]] |> safe_extract()

      # Créer la liste sans geo_object si dimension_geo est FALSE
      codebook_list[[length(codebook_list) + 1]]  <- list(
        dimension = dimension,
        dimension_label = dimension_label,
        value = value,
        value_label = value_label,
        value_id = value_id)
    }
  }

  codebook_df <- do.call(rbind, lapply(codebook_list, as.data.frame))
  rownames(codebook_df) <- NULL

  codebook_df <- codebook_df |>
    dplyr::arrange(dimension, value) |>
    tidyr::separate(value_id, into = c("GEO_REF", "GEO_OBJECT", "GEO"), sep = "-") |>
    dplyr::mutate(GEO_LABEL = value_label) |>
    dplyr::select(GEO_REF, GEO_OBJECT, GEO, GEO_LABEL) |>
    dplyr::arrange(GEO_OBJECT, GEO)

  return(codebook_df)
}
