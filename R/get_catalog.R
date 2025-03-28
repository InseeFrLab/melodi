#' Get list of available datasets
#'
#' @param lang lang of metadata informations (default: fr)
#' @param base_url_melodi API URL (default: https://api.insee.fr)
#'
#' @return a data.frame containing list of available datasets
#' @export
#'
#' @examples
#' get_catalog()
#' get_catalog(lang = "en")
get_catalog <- function(
    lang = "fr",
    base_url_melodi = "https://api.insee.fr/melodi"
    ) {
  # check parameters
  if (!lang %in% c("fr", "en")) {
    stop("lang must be : fr or en")
  }
  url <- glue::glue("{base_url_melodi}/catalog/all")

  message("Request all catalog : ", url)
  all_dataset <- httr2::request(url) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE)

  # extract only usefull informations
  all_dataset_extract <- all_dataset |>
    dplyr::select(identifier,
                  title, subtitle, description, abstract,
                  temporal, modified, spatialResolution, spatialTemporal,
                  numObservations, numSeries) |>
    # spatialResolution is a dataframe into dataframe... extract only ids
    dplyr::mutate(spatialResolution =
                    lapply(
                      spatialResolution,
                      function(x) toString(x$id)
                      )
                  ) |>
    # unnest for variables with list into list
    tidyr::unnest(cols = c(title, subtitle, description, abstract, temporal,
                           spatialResolution),
                  names_sep = "_") |>
    dplyr::arrange(identifier) |>
    # lines are duplicated (fr and en) : filter and delete lang parameter
    dplyr::filter(title_lang == {{ lang }}) |>
    dplyr::select(-title_lang, -subtitle_lang, -description_lang, -abstract_lang) |>
    dplyr::mutate(
      modified = as.Date(modified),
      temporal_startPeriod = as.Date(temporal_startPeriod),
      temporal_endPeriod = as.Date(temporal_endPeriod),
      # reformat spatial temporal : only a year
      spatialTemporal = dplyr::if_else(
                          is.na(spatialTemporal),
                          NA,
                          as.integer(substr(spatialTemporal, 0, 4))
      )
    )

  return (all_dataset_extract)
}
