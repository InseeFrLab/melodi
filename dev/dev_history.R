# Commandes à lancer régulièrement pour travailler sur le package

# Au quotidien ------------------------------------------------------------
# Durant le développement pour tester les fonctions
# Au préalable pour repartir d'un environnement vierge
# Ctrl + Maj + F10
# Puis :
devtools::load_all()

# si la documentation des fonctions a été changée
# Actualiser le NAMESPACE et la documentation
devtools::document()

# Exécuter tous les tests d'un coup
# Objectif : tout les tests passants ("PASS")
devtools::test()

# Couverture de test du code du package
# Objectif : 100% !
covr::report()

# Assurer la conformité globale du package
# Un peu long mais à lancer régulièrement pour contrôler les régressions
# Objectif : 0 error, 0 warning, 0 notes !
devtools::check(
  # vignettes gourmandes en requêtes Melodi, à faire à part sinon "429 Too many requests"
  vignettes = FALSE,
  # éviter le test CRAN inutile et qui soulève une note
  cran = FALSE
)

# Créée le site documentaire  --------------
# cette étape est faite par github CI, lancer manuellement au besoin pour voir le resultat
pkgdown::build_site()

# Creer une fonction ------------------------------------------------------
# Pour chaque fonction du package :
usethis::use_r("get_local_data")
usethis::use_test("get_local_data")
# écrire le code de la fonction
# documenter la fonction

# 3.b. Si besoin, déclarer une dépendance
usethis::use_package("stats")
usethis::use_package("data.table")

# Installer le package en cours de developpement -------------------------
# Sur sa machine
devtools::install()

# Vignettes :
# Créer une vignette (= un article)
usethis::use_vignette("nom_vignette")

# Monter de version le package  --------------------------------------------
# Commiter tout au préalable
# puis se laisser guider pour choisir un numéro de version
usethis::use_version(push = FALSE)
# TODO une erreur git à chaque fois... Ce n'est pas génant
# mais il faut donc faire le commit/push après manuellement

# Remplir les actus liées à cette nouvelle version
file.edit('NEWS.md')

# Livrer une version sur un repository ---------------------
# Générer une archive des sources du package
devtools::build()
# Puis le déposer sur un repository
# En interne Insee, se rentre sur https://nexus.insee.fr/#browse/upload:r-local
# Cliquer sur Browse et envoyer le .tar.gz
# Dans Package Path renseigner : "src/contrib"
# C'est tout !
