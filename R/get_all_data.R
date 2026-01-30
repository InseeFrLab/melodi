#' Get all data from a dataset
#'
#' @param ds_name Dataset name - use get_ds_list to find a dataset identifier
#' @param stringsAsFactors if TRUE, strings variables in data.frame are converted to factors - Default FALSE
#' @param download_directory Download directory - default system tempdir
#' @param remove_file Remove downloaded data file after loading data - Default TRUE
#'
#' @return data.frame with data
#' @export
#'
#' @examples
#' data <- get_all_data("DS_TICM_PRATIQUES")
get_all_data <- function(
  ds_name,
  download_directory = tempdir(),
  stringsAsFactors = FALSE,
  remove_file = TRUE
) {
  # lang parameter not exported yet (today most DS only have FR version)
  lang <- "FR"

  # get product url from DS metadata
  ds_products <- get_metadata(
    ds_name = ds_name
  )$product

  csv_list <- ds_products |>
    dplyr::filter(language == lang & format == "CSV")

  if (nrow(csv_list) == 0) {
    stop("No CSV found for ", ds_name)
  } else if (nrow(csv_list) > 1) {
    stop("Error : more than 1 CSV found for ", ds_name)
  }

  # only one URL found : OK
  zip_url <- csv_list |>
    dplyr::pull(accessURL)

  # Download file
  message("Request ZIP CSV file : ", zip_url)
  downloaded_zip_path <- file.path(download_directory, glue::glue("{ds_name}.zip"))

  httr2::request(zip_url) |>
    httr2::req_user_agent(getOption("rmelodi.req_user_agent")) |>
    httr2::req_progress() |>
    httr2::req_perform(downloaded_zip_path)

  files_in_zip <- zip::zip_list(downloaded_zip_path)

  data_filename <- files_in_zip |>
    dplyr::filter(grepl("_data.csv", filename)) |>
    dplyr::pull(filename)

  metadata_filename <- files_in_zip |>
    dplyr::filter(grepl("_metadata.csv", filename)) |>
    dplyr::pull(filename)

  zip::unzip(
    zipfile = downloaded_zip_path,
    exdir = download_directory
  )

  # Load data and metadata
  data_path <- file.path(download_directory, data_filename)
  metadata_path <- file.path(download_directory, metadata_filename)

  data <- data.table::fread(
    input = data_path,
    data.table = FALSE, # in order to have a data.frame
    # TODO ? forcer typage de quelques variables de structure
    # pour eviter de mauvais typage accidentel (exemple : code geo en numerique)
    # colClasses = list(
    #   numeric = "OBS_VALUE",
    #   character = c("TIME_PERIOD", "GEO")
    #   ),
    stringsAsFactors = stringsAsFactors
  )

  metadata <- data.table::fread(input = metadata_path)

  # Use metadata for labels
  metadata_var <- metadata |>
    dplyr::distinct(COD_VAR, LIB_VAR)

  # add missing LIB in meta.csv if exist in data
  if ("OBS_VALUE" %in% colnames(data)) {
    metadata_var <- metadata_var |>
      tibble::add_row(
        COD_VAR = "OBS_VALUE",
        LIB_VAR = "Valeur"
      )
  }

  if ("GEO_OBJECT" %in% colnames(data)) {
    metadata_var <- metadata_var |>
      tibble::add_row(
        COD_VAR = "GEO_OBJECT",
        LIB_VAR = "Niveau geographique"
      )
  }

  # on transforme le DF en liste nommee pour l'appliquer en label
  # clef = nom de variable
  # valeur = libelle de variable
  label_par_variable <- stats::setNames(
    as.list(metadata_var$LIB_VAR),
    metadata_var$COD_VAR
  )

  labelled::var_label(data) <- label_par_variable

  # Remove every downloaded files (useless, data is in memory now)
  if (remove_file) {
    message("Remove downloaded files")
    unlink(
      c(
        downloaded_zip_path,
        data_path,
        metadata_path
      )
    )
  }

  return(data)
}
