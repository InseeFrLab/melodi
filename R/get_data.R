#' Get Melodi data by URL.
#' This URL can be copy/paste from explorer https://catalogue-donnees.insee.fr
#'
#' @param url URL API data Melodi - Start by "https://api.insee.fr/melodi/data/..."
#'
#' @return data.frame with data
#' @export
#'
#' @examples
#' get_data(
#'     "https://api.insee.fr/melodi/data/DS_POPULATIONS_REFERENCE?POPREF_MEASURE=PMUN&GEO=FRANCE-F"
#' )
get_data <- function(
    url
) {
  # 1 - Count numer of lines of request
  request_count <- httr2::request(url) |>
    # Add Melodi /data parameters to only count lines
    httr2::req_url_query(totalCount = TRUE) |>
    httr2::req_url_query(maxResult = 0)

  message("Total count request : ", request_count$url)

  data_count <- request_count |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE)

  count <- data_count[["paging"]][["count"]]
  message("Number of lines : ", format(count, big.mark = " "))

  if (count == 0) {
    stop("No result for request ", url)
  }

  else if (count > 10000) {
    stop("Request over 10 000 lines not supported yet,
         please filter your request or use get_all_data")
  }

  # 2 - request is OK, get results
  request <- httr2::request(url) |>
    # TODO useless ? this is the default value now
    httr2::req_url_query(idTerritoire = TRUE) |>
    # maximum maxResult authorized by Melodi API
    httr2::req_url_query(maxResult = 10000)

  result <- request |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE)

  # bind datas in one dataframe
  dimensions_obj <- result[["observations"]][["dimensions"]]
  measures_obj <- result[["observations"]][["measures"]][["OBS_VALUE_NIVEAU"]]
  attributes_obj <- result[["observations"]][["attributes"]]
  data <- dplyr::bind_cols(dimensions_obj,
                           attributes_obj,
                           measures_obj)

  # 3 - rename variables to be in Melodi format
  if ("value" %in% colnames(data)) {
    data <- data |>
      dplyr::rename(OBS_VALUE = value)
  }
  if ("GEO" %in% colnames(data)) {
    data <- data |>
      tidyr::separate(GEO, into = c("GEO_REF", "GEO_OBJECT", "GEO"), sep = "-")
  }

  return (data)
}
