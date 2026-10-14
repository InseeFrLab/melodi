#' Get file attached to a dataset : extract (XLSX), or full CSV file
#'
#' @param ds_name Dataset name
#' @param file_name File name
#' @param download_file_name Filename on disk after download - if not specified,
#' preserve original file name from Melodi - default NULL (preserve original
#' file name)
#' @param download_directory Download directory - default system tempdir
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
  download_file_name = NULL,
  download_directory = tempdir()
) {
  # Build useful parameters
  url <- glue::glue(
    "{getOption('rmelodi.base_url_api')}/file/{ds_name}/{file_name}"
  )

  if (!is.null(download_file_name)) {
    path <- file.path(download_directory, download_file_name)
    message("Downloaded path : ", path)
  } else {
    # if no file name specified : tempfile
    # and then after download, rename with original file name
    path <- tempfile()
    message("Temporary downloaded path : ", path)
  }

  # Download file
  message("Request file : ", url)

  resp <- httr2::request(url) |>
    httr2::req_user_agent(getOption("rmelodi.req_user_agent")) |>
    httr2::req_retry(max_tries = 3, max_seconds = 30, retry_on_failure = TRUE) |>
    httr2::req_progress() |>
    httr2::req_perform(path = path) |>
    tryCatch(error = \(e) message("Could not get data: ", conditionMessage(e)))
  # API failed gracefully: exit quietly (return() only works inside a function)
  if (is.null(resp)) {
    return(invisible(NULL))
  }

  if (is.null(download_file_name)) {
    # Extract original filename from content-disposition in request header
    # Exemple of content-disposition :
    # inline; filename="DS_SRCV_CONFIANCE_2025_CSV_FR.zip"
    cd <- httr2::resp_headers(resp)[["content-disposition"]]
    m <- regmatches(cd, regexec('filename\\*?="?([^";]+)"?', cd))

    if (length(m[[1]]) > 1) {
      original_file_name <- m[[1]][2]
      message("Original file name from Melodi : ", original_file_name)
      # Rename the file on disk with this new name
      renamed_path <- file.path(download_directory, original_file_name)
      message("Move file to path : ", renamed_path)
      file.copy(path, renamed_path)
      message("Remove temporary file : ", path)
      unlink(path)
      return(renamed_path)
    }
    # else : no rename, preserve tempfile name
  }
  return(path)
}
