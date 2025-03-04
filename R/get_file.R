#' Get file attached to a dataset : extract (XLSX), or full CSV file
#'
#' @param ds_name Dataset name
#' @param file_name File name
#' @param download_file_name Filename on disk after download
#' @param download_directory Download directory - default system tempdir
#' @param base_url_melodi API Melodi URL - default production URL
#'
#' @return downloaded file name on disk
#' @export
#'
#' @examples
#' get_file(
#' ds_name = "DS_EC_DECES",
#' file_name = "T1_DECES_JOUR_NAT_FR",
#' download_file_name = "T1_DECES_JOUR_NAT_FR.xlsx"
#' )
get_file <- function(
    ds_name,
    file_name,
    download_file_name,
    download_directory = tempdir(),
    base_url_melodi = "https://api.insee.fr/melodi"
) {
  # Build useful parameters
  url <- glue::glue("{base_url_melodi}/file/{ds_name}/{file_name}")
  path <- file.path(download_directory, download_file_name)

  # Download file
  message("Request file : ", url)
  message("Downloaded path : ", path)

  httr2::request(url) |>
    httr2::req_progress() |>
    httr2::req_perform(path = path)

  return (path)
}
