#' Get data on every Commune of one territory
#'
#' @param ds_name Dataset name
#' @param geo Code geo
#' @param geo_object Geo Level
#' @param filter additionnal filter on request - default : ""
#' @param base_url_melodi API Melodi URL - default production URL
#'
#' @return data.frame with data
#' @export
#'
#' @examples
#' get_local_data_by_com(
#'   ds_name = "DS_POPULATIONS_REFERENCE",
#'   geo = "44",
#'   geo_object = "DEP"
#' ) |>
#' head()
#'
#' get_local_data_by_com(
#'   ds_name = "DS_RP_POPULATION_PRINC",
#'   geo = "44",
#'   geo_object = "DEP",
#'   filter = "SEX=F&AGE=Y20T64"
#' ) |>
#' head()
get_local_data_by_com <- function(
    ds_name,
    geo,
    geo_object,
    filter= "",
    base_url_melodi = "https://api.insee.fr/melodi"
) {
  if (filter != "") {
    filter <- glue::glue("&{filter}")
  }
  url <-glue::glue("{base_url_melodi}/data/{ds_name}?GEO={geo_object}-{geo}*COM{filter}")

  return (get_data(url))
}
