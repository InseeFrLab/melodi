# Etapes de création de ce package
# Ces étapes sont faites une fois pour toute :
# les traitements à lancer régulièrement sont dans dev_history.R
# Référence suivie : https://linogaliana.gitlab.io/collaboratif/package.html

# Installation des packages utiles à la création de package
req_pkgs <- c(
  'available',
  'desc',
  'usethis',
  'gitlabr',
  'git2r',
  'devtools',
  'roxygen2',
  'roxygen2md',
  'testthat',
  'covr'
)

lapply(req_pkgs, function(pkg) {
  if (system.file(package = pkg) == '') install.packages(pkg)
})

# 1. Initier un package -------------------------------------
# Étapes à ne faire qu'une seule fois

# 1.a. Choisir un nom
nom <- "melodi"
available::available(nom, browse = FALSE)

# 1.b. Créer un projet RStudio de type "package"
usethis::create_package(file.path("C:/Users/ggj62i/git/melodi", nom))

# 1.c. Renseigner les méta-données du package
# Titre du package
desc::desc_set(
  Title = "Retrieve Data from the Insee Melodi APIs"
)
# Désigner les auteurs, contributeurs et
# les détenteurs des droits de propriété intellectuelle
desc::desc_set_authors(c(
  person(
    "Cédric",
    "Bobinec",
    role = c("aut", "cre"),
    email = "cedric.bobinec@insee.fr"
  ),
  person(
    family = "Institut national de la statistique et des études économiques",
    role = "cph"
  )
))
# Décrire ce que fait le package
desc::desc_set(
  Description = "A wrapper for the Insee Melodi APIs that returns data frames and metadata."
)
# Choisir une licence
usethis::use_mit_license()

# Si la documentation du package est en français
desc::desc_set(Language = "fr")

# 2. Configurer les outils de développement -----------------
# Étapes à ne faire qu'une seule fois

# 2.a. Créer un dépôt dans GitLab, avec le Readme
# Cloner le projet avec RStudio puis rappatrier les éléments de ce projet

# 2.d. Utiliser testthat pour les tests
usethis::use_testthat()

# 2.e. Utiliser l'intégration continue de GitLab
usethis::use_gitlab_ci()

# 2.f. Pour utiliser markdown dans la documentation
usethis::use_roxygen_md()
roxygen2md::roxygen2md()

# pour utiliser %>% dans un package
usethis::use_pipe()

# Ajout au .Rbuildignore des scripts de développement (à ne pas inclure donc)
usethis::use_build_ignore("dev/creation_history.R")
usethis::use_build_ignore("dev/dev_history.R")

# 5. Documenter un package ----------------------------------
# 5.a. Créer un README (obligatoire)
usethis::use_readme_rmd() # ou bien usethis::use_readme_md()

# 5.b. Créer une vignette (fortement recommandé)
usethis::use_vignette(nom)

# 7. Bonnes pratiques ---------------------------------------
# 7.a Créer un changelog (à ne faire qu'une fois)
usethis::use_news_md()
# 7.b. Gérer les versions
usethis::use_version("dev")

# TODO au 25/11/2024 étapes non indispensables, non déroulées pour le moment

# 7.c. Améliorer les tests et la couverture de code
# Si vous avez bien effectué l'étape 2.e,
# le rapport de couverture de code est disponible
# dans GitLab Pages
# Viser une couverture de code de 100%

# Complément pour no visible global function definition for ':='
# https://stackoverflow.com/questions/58026637/no-visible-global-function-definition-for
usethis::use_import_from("rlang", ":=")

# Ajout logo ---------------------------------------
# Création vite fait avec https://connect.thinkr.fr/hexmake/
usethis::use_logo(img = "dev/hex-melodi.png")

# Création du favicon a partir du logo (à faire sinon le CI cherche à le faire à chaque fois)
pkgdown::build_favicons()

# vcr ---------------------------------------------------------------------
# https://docs.ropensci.org/vcr/
vcr::use_vcr()
