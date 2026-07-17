.onLoad <- function(libname, pkgname) {
  options(
    # Beginning of API URL (change only for developpement/internal use)
    rmelodi.base_url_api = "https://api.insee.fr/melodi",
    # Maximum maxResult allowed by Melodi API (change only if API improvement)
    rmelodi.max_result_api = 100000,
    # Define user agent sent in headers with every requests (default : 'RMelodi/1.0.0')
    rmelodi.req_user_agent = glue::glue("RMelodi/{utils::packageVersion('melodi')}")
  )
}
