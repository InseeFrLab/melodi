#' Get a code list by id (id generally starts with 'CL_')
#'
#' @param id id (id generally starts with 'CL_' : 'CL_AGE', 'CL_LEGAL_FORM', etc.)
#' @param lang lang of metadata informations (default: fr)
#'
#' @return a data.frame containing codes and labels
#' @export
#'
#' @examples
#' get_code_list("CL_AGE")
#' get_code_list(id = "CL_AGE", lang = "en")
get_code_list <- function(
  id,
  lang = "fr"
) {
  # check parameters
  if (!lang %in% c("fr", "en")) {
    stop("lang must be : fr or en")
  }
  url <- glue::glue("{getOption('rmelodi.base_url_api')}/rmes/listeCode/{toupper(id)}")

  message("Request code list : ", url)

  code_list <- httr2::request(url) |>
    httr2::req_user_agent(getOption("rmelodi.req_user_agent")) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE)

  codes <- code_list$codes

  if (length(codes) == 0) {
    stop("No result for code list with id : ", id)
  }

  code_list_extract <- code_list$codes |>
    # unnest for variables with list into list
    tidyr::unnest(
      cols = c(
        label
      ),
      names_sep = "_"
    ) |>
    dplyr::arrange(code) |>
    # lines are duplicated (fr and en) : filter and delete lang parameter
    dplyr::filter(label_langue == {{ lang }}) |>
    dplyr::select(-label_langue)

  return(code_list_extract)
}
