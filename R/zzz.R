.onLoad <- function(libname, pkgname) {
  op <- options()

  op.rmelodi(
    # Beginning of API URL (change only for developpement/internal use)
    rmelodi.base_url_api = "https://api.insee.fr/melodi",
    # Maximum maxResult allowed by Melodi API (change only if API improvement)
    rmelodi.max_result_api = 100000,
    # Define user agent sent in headers with every requests
    # (default : 'RMelodi/1.0.0')
    rmelodi.req_user_agent = glue::glue(
      "RMelodi/{utils::packageVersion('melodi')}"
    )
  )

  # Restauration des options à la sortie de la fonction (même en cas d'erreur)
  # Bonne pratique :
  # Réinitialiser à leur état d'origine lorsque le package est détaché
  on.exit(
    options(old_options),
    add = TRUE
  )
}
