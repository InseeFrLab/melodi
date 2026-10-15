#' Get list of available datasets
#'
#' @param lang lang of metadata informations (default: fr)
#'
#' @return a data.frame containing list of available datasets
#' @export
#'
#' @examples
#' get_catalog()
#' get_catalog(lang = "en")
get_catalog <- function(
  lang = "fr"
) {
  # check parameters
  if (!lang %in% c("fr", "en")) {
    stop("lang must be : fr or en")
  }
  url <- glue::glue("{getOption('rmelodi.base_url_api')}/catalog/all")

  message("Request all catalog : ", url)

  all_dataset <- httr2::request(url) |>
    httr2::req_user_agent(getOption("rmelodi.req_user_agent")) |>
    httr2::req_retry(max_tries = 3, max_seconds = 30, retry_on_failure = TRUE) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = FALSE) |>
    tryCatch(error = \(e) message("Could not get data: ", conditionMessage(e)))
  # API failed gracefully: exit quietly (return() only works inside a function)
  if (is.null(all_dataset)) return(invisible(NULL))

  # extract all informations
  all_dataset_extract <- tibble::tibble(json = all_dataset) |>
    tidyr::unnest_wider(json)

  # basic unfold
  catalog_extract <- all_dataset_extract |>
    dplyr::select(identifier, title, subtitle, description, abstract, scopeNote,
                  issued, modified, temporal, spatialResolution, spatialTemporal,
                  structure, numObservations, numSeries, accessURLParquet,
                  tailleFichierParquetEnOctets, uri, uuid) |>
    dplyr::mutate(spatialResolution = purrr::map_chr(spatialResolution, ~ {
      ids <- purrr::map_chr(.x, ~ toString(purrr::pluck(.x, "id", .default = NA_character_)))
      toString(ids)
    })) |>
    dplyr::mutate(structure = purrr::map_chr(structure, ~ toString(purrr::pluck(.x, "dsd", .default = NA_character_)))) |>
    # multilingual : {content, lang}
    tidyr::unnest_longer(c(title, subtitle, description, abstract, scopeNote),
                         keep_empty = TRUE) |>
    tidyr::unnest_wider(c(title, subtitle, description, abstract, scopeNote),
                        names_sep = "_") |>
    dplyr::filter(title_lang == .env$lang) |>
    dplyr::select(-ends_with("_lang")) |>
    # temporal : objet unique {startPeriod, endPeriod}
    tidyr::unnest_wider(temporal, names_sep = "_") |>
    dplyr::arrange(identifier) |>
    dplyr::mutate(
      issued  = as.Date(issued),
      modified = as.Date(modified),
      temporal_startPeriod = as.Date(temporal_startPeriod),
      temporal_endPeriod   = as.Date(temporal_endPeriod),
      spatialTemporal = format(as.Date(spatialTemporal), "%Y")
    ) |>
    dplyr::rename(
      title = title_content,
      subtitle = subtitle_content,
      description = description_content,
      abstract = abstract_content,
      warning = scopeNote_content, #TODO, format DCAT, simplement renommer note ?
      startPeriod = temporal_startPeriod,
      endPeriod = temporal_endPeriod,
      urlParquet = accessURLParquet,
      sizeParquet = tailleFichierParquetEnOctets,
      dsd = structure
    )

  #complex unfold
  relations_extract <- all_dataset_extract |>
    dplyr::select(identifier, relations) |>
    tidyr::unnest_longer(relations, keep_empty = TRUE) |>
    tidyr::unnest_wider(relations, names_sep = "_") |>
    tidyr::unnest_longer(c(relations_title, relations_titleComplement, relations_url), keep_empty = TRUE) |>
    tidyr::unnest_wider(c(relations_title, relations_titleComplement, relations_url), names_sep = "_") |>
    dplyr::filter(relations_title_lang == .env$lang) |>
    dplyr::mutate(
      dplyr::across(
        .cols = c(relations_title_content, relations_titleComplement_content, relations_url_content),
        .fns = ~ tidyr::replace_na(.x, ""))) |>
    dplyr::mutate(relationsTitle = paste(relations_title_content, relations_titleComplement_content, sep = " ")) |>
    dplyr::summarise(
      relationsTitle = paste(relationsTitle, collapse = ", "),
      relationsUrl = paste(relations_url_content, collapse = ", "),
      .by = identifier
    )

  theme_extract <- all_dataset_extract |>
    dplyr::select(identifier, theme) |>
    tidyr::unnest_longer(theme, keep_empty = TRUE) |>
    tidyr::unnest_wider(theme, names_sep = "_") |>
    dplyr::filter(theme_themeTaxonomy == "inseeTheme") |> # theme sans le chapitrage
    tidyr::unnest_longer(theme_label, keep_empty = TRUE) |>
    tidyr::unnest_wider(theme_label, names_sep = "_") |>
    dplyr::filter(theme_label_lang == .env$lang) |>
    dplyr::summarise(
      theme = paste(theme_label_content, collapse = ", "),
      .by = identifier
    )

  spatial_extract <- all_dataset_extract |>
    dplyr::select(identifier, spatial) |>
    tidyr::unnest_longer(spatial, keep_empty = TRUE) |>
    dplyr::filter(spatial_id == "label") |>
    tidyr::unnest_longer(spatial, keep_empty = TRUE) |>
    tidyr::unnest_wider(spatial, names_sep = "_") |>
    dplyr::filter(spatial_lang == .env$lang) |>
    dplyr::select(identifier, spatial = spatial_content)

  keyword_extract <- all_dataset_extract |>
    dplyr::select(identifier, keyword) |>
    tidyr::unnest_longer(keyword, keep_empty = TRUE) |>
    tidyr::unnest_wider(keyword, names_sep = "_") |>
    tidyr::unnest_longer(keyword_label, keep_empty = TRUE) |>
    tidyr::unnest_wider(keyword_label, names_sep = "_") |>
    dplyr::filter(keyword_label_lang == .env$lang) |>
    dplyr::summarise(
      keyword = paste(keyword_label_content, collapse = ", "),
      .by = identifier
    )

  file_extract <- all_dataset_extract |>
    dplyr::select(identifier, product) |>
    tidyr::unnest_longer(product, keep_empty = TRUE) |>
    tidyr::unnest_wider(product, names_sep = "_") |>
    dplyr::filter(product_format == "CSV") |>
    dplyr::transmute(identifier,
                     urlCSV = product_accessURL,
                     sizeCSV = product_byteSize)

  periodicity_extract <- all_dataset_extract |>
    dplyr::select(identifier, accrualPeriodicity) |>
    tidyr::unnest_wider(accrualPeriodicity, names_sep = "_") |>
    tidyr::unnest_longer(accrualPeriodicity_label, keep_empty = TRUE) |>
    tidyr::unnest_wider(accrualPeriodicity_label, names_sep = "_") |>
    dplyr::filter(accrualPeriodicity_label_lang == .env$lang) |>
    dplyr::transmute(identifier, periodicity = accrualPeriodicity_label_content)

  unit_extract <- all_dataset_extract |>
    dplyr::select(identifier, statisticalUnit) |>
    tidyr::unnest_longer(statisticalUnit, keep_empty = TRUE) |>
    tidyr::unnest_wider(statisticalUnit, names_sep = "_") |>
    tidyr::unnest_longer(statisticalUnit_label, keep_empty = TRUE) |>
    tidyr::unnest_wider(statisticalUnit_label, names_sep = "_") |>
    dplyr::filter(statisticalUnit_label_lang == .env$lang) |>
    dplyr::summarise(
      statisticalUnit = paste(unique(statisticalUnit_label_content), collapse = ", "),
      .by = identifier
    )

  source_extract <- all_dataset_extract |>
    dplyr::select(identifier, wasGeneratedBy) |>
    tidyr::unnest_longer(wasGeneratedBy, keep_empty = TRUE) |>
    tidyr::unnest_wider(wasGeneratedBy, names_sep = "_") |>
    tidyr::unnest_longer(wasGeneratedBy_label, keep_empty = TRUE) |>
    tidyr::unnest_wider(wasGeneratedBy_label, names_sep = "_") |>
    dplyr::filter(wasGeneratedBy_label_lang == .env$lang) |>
    dplyr::summarise(
      source = paste(unique(wasGeneratedBy_label_content), collapse = ", "),
      .by = identifier
    )

  #intern
  ordre_extract <- all_dataset_extract |>
    dplyr::select(identifier, ordreComposants) |>
    dplyr::mutate(ordreComposants = purrr::map_chr(
      ordreComposants, ~ paste(.x, collapse = ", ")))

  raccourcis_extract <- all_dataset_extract |>
    dplyr::select(identifier, raccourcis) |>
    dplyr::mutate(raccourcis = !purrr::map_lgl(raccourcis, ~ identical(.x, NULL)))

  # together ----
  catalog <- catalog_extract |>
    dplyr::left_join(spatial_extract, by = "identifier") |>
    dplyr::left_join(periodicity_extract, by = "identifier") |>
    dplyr::left_join(unit_extract, by = "identifier") |>
    dplyr::left_join(keyword_extract, by = "identifier") |>
    dplyr::left_join(theme_extract, by = "identifier") |>
    dplyr::left_join(source_extract, by = "identifier") |>
    dplyr::left_join(relations_extract, by = "identifier") |>
    dplyr::left_join(file_extract, by = "identifier") |>
    dplyr::relocate(any_of(c("numObservations", "urlCSV", "sizeCSV", "urlParquet", "sizeParquet")),
                    .after = warning) |>
    dplyr::relocate(endPeriod, .after = startPeriod) |>
    dplyr::relocate(periodicity, .before = startPeriod) |>
    dplyr::relocate(any_of(c("numSeries", "dsd", "uri", "uuid")), .after = dplyr::last_col()) |>
    dplyr::left_join(ordre_extract, by = "identifier") |>
    dplyr::left_join(raccourcis_extract, by = "identifier")

  return(catalog)
}
