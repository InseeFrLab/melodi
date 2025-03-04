#' Get all data from a dataset
#'
#' @param ds_name Dataset name - use get_ds_list to find a dataset identifier
#' @param base_url_melodi API Melodi URL - default production URL
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
    base_url_melodi = "https://api.insee.fr/melodi",
    download_directory = tempdir(),
    stringsAsFactors = FALSE,
    remove_file = TRUE
) {
  # lang parameter not exported yet (today most DS only have FR version)
  lang <- "FR"

  downloaded_zip_path <- get_file(
    ds_name = ds_name,
    file_name = glue::glue("{ds_name}_CSV_{lang}"),
    download_file_name = glue::glue("{ds_name}.zip"),
    base_url_melodi = base_url_melodi,
    download_directory = download_directory
  )

  zip::unzip(zipfile = downloaded_zip_path,
             exdir = download_directory)

  # Load data and metadata
  data_path <- file.path(download_directory, glue::glue("{ds_name}_data.csv"))
  metadata_path <- file.path(download_directory, glue::glue("{ds_name}_metadata.csv"))

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

  return (data)
}
