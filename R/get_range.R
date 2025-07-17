#' Get the dataset's codebook
#'
#' Retrieves the list of dimensions (except GEO) and all their possible values
#' (codes and human-readable labels) for a given dataset.
#' For GEO dimension, refer to get_range_geo()
#'
#' @param ds_name dataset name
#' @param base_url_melodi API Melodi URL - default production URL
#' @param lang french or english labels
#' @param dimension_time_period the TIME_PERIOD dimension can include many entries, ignoring it can simplify the results
#'
#' @return A data frame with columns such as `dimension`, `dimension_label`, `value`, `value_label`
#' @export
#'
#' @examples
#' get_range("DS_POPULATIONS_REFERENCE")
#' get_range("DS_RP_EDUCATION",
#' lang = "en",
#' dimension_time_period = FALSE)
get_range <- function(
    ds_name,
    base_url_melodi = "https://api.insee.fr/melodi",
    lang = "fr",
    dimension_time_period = TRUE
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

  # Keep or exclude TIME_PERIOD, exlude GEO
  range <- Filter(function(x) {
    concept_code <- x[["concept"]][["code"]]
    concept_code != "GEO" &&
      (concept_code != "TIME_PERIOD" || dimension_time_period)
  }, range)

  # for null cases (English GEO labels...)
  safe_extract <- function(x) {
    if (is.null(x)) NA else x
  }

  codebook_list <- list()

  for (i in seq_along(range)) {
    # concepts returned by the API are effectively dimensions of the dataset
    dimension <- range[[i]][["concept"]][["code"]] |> safe_extract()
    dimension_label <- range[[i]][["concept"]][["label"]][[lang]] |> safe_extract()

    values <- range[[i]][["values"]]

    for (j in seq_along(values)) {
      value <- values[[j]][["code"]] |> safe_extract()
      value_label <- values[[j]][["label"]][[lang]] |> safe_extract()

      entry <- list(
        dimension = dimension,
        dimension_label = dimension_label,
        value = value,
        value_label = value_label
      )

      # Ajouter l'entrée au codebook
      codebook_list[[length(codebook_list) + 1]] <- entry
    }
  }

  codebook_df <- do.call(rbind, lapply(codebook_list, as.data.frame))
  rownames(codebook_df) <- NULL

  codebook_df <- codebook_df |>
    dplyr::arrange(dimension, value) # |>
  # dplyr::add_count(dimension, name = "value_count")

  return(codebook_df)
}
