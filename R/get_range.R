#' Get dataset range (codes and labels)
#'
#' Retrieves the list of dimensions and all their possible modalities values
#' (codes and human-readable labels) for a given dataset.
#' For GEO dimension, it is recommanded to used dedicated function : get_range_geo()
#'
#' @param ds_name dataset name
#' @param base_url_melodi API Melodi URL - default production URL
#' @param lang french or english labels - default french ("fr")
#' @param exclusions_list exclude some dimensions for a faster and light result - default : "GEO"
#'
#' @return A data frame with dimensions and modalities codes and labels
#' @export
#'
#' @examples
#' get_range("DS_POPULATIONS_REFERENCE")
#'
#' get_range(
#'   ds_name = "DS_POPULATIONS_REFERENCE",
#'   lang = "en"
#' )
#'
#' get_range(
#'   ds_name = "DS_EC_DECES",
#'   exclusions_list = c("GEO", "TIME_PERIOD")
#' )
get_range <- function(
  ds_name,
  base_url_melodi = "https://api.insee.fr/melodi",
  lang = "fr",
  exclusions_list = c("GEO")
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
    !(concept_code %in% exclusions_list)
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
        DIM = dimension,
        DIM_LABEL = dimension_label,
        MOD = value,
        MOD_LABEL = value_label
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
