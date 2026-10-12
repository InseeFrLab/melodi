#' Get file attached to a dataset : extract (XLSX), or full CSV file
#'
#' @param ds_name Dataset name
#' @param file_name File name
#' @param download_file_name Filename on disk after download - default
#' system tempfile
#' @param download_directory Download directory - default system tempdir
#' @param keep_original_file_name Keep original file name from Melodi on disk
#' - default FALSE
#'
#' @return downloaded file name on disk
#' @export
#'
#' @examples
#' get_file(
#'   ds_name = "DS_EC_DECES",
#'   file_name = "T1_DECES_JOUR_NAT_FR",
#'   download_file_name = "T1_DECES_JOUR_NAT_FR.xlsx"
#' )
get_file <- function(
  ds_name,
  file_name,
  download_file_name = tempfile(),
  download_directory = tempdir(),
  keep_original_file_name = FALSE
) {
  # Build useful parameters
  url <- glue::glue(
    "{getOption('rmelodi.base_url_api')}/file/{ds_name}/{file_name}"
  )
  path <- file.path(download_directory, download_file_name)

  # Download file
  message("Request file : ", url)
  message("Downloaded path : ", path)

  resp <- httr2::request(url) |>
    httr2::req_user_agent(getOption("rmelodi.req_user_agent")) |>
    httr2::req_progress() |>
    httr2::req_perform(path = path)

  if (keep_original_file_name) {
    # Extract original filename from content-disposition in request
    cd <- httr2::resp_headers(resp)[["content-disposition"]]
    m <- regmatches(cd, regexec('filename\\*?="?([^";]+)"?', cd))
    original_file_name <- if (length(m[[1]]) > 1) m[[1]][2] else basename(tmp)

    # Rename the file on disk with this new name
    renamed_path <- file.path(download_directory, original_file_name)
    file.rename(path, original_file_name)

    return(renamed_path)
  } else {
    return(path)
  }
}
