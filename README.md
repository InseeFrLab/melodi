# Melodi : Insee open data R package <a href="https://InseeFrLab.github.io/melodi/"><img src="man/figures/logo.png" align="right" height="139" alt="melodi website" /></a>

<!-- badges: start -->
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![License:MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R-CMD-check](https://github.com/InseeFrLab/melodi/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/InseeFrLab/melodi/actions/workflows/R-CMD-check.yaml)
[![CRAN status](https://www.r-pkg.org/badges/version/melodi)](https://cran.r-project.org/package=melodi)
<!-- badges: end -->

🇫🇷 Télécharger, parcourir, filtrer les données et métadonnées diffusées par l'Insee en open data
sur [le catalogue de données de l'Insee (melodi)](https://catalogue-donnees.insee.fr)

🇬🇧 Download, search, filter data and metadata from open data statistical public datasets, from
[Insee Data catalogue (melodi)](https://catalogue-donnees.insee.fr). 

## Installation

Installer la dernière version stable depuis le [CRAN](https://CRAN.R-project.org/package=melodi) :

``` r
install.packages("melodi")
```

### Development

Pour installer une version de développement depuis [GitHub](https://github.com/):

```R
# install.packages("remotes")
remotes::install_github("InseeFrLab/melodi", build_vignettes = TRUE)
```

## Exemples

Lister les jeux de données proposés par l'Insee via Melodi :
```R
get_catalog()
```

Récupérer toutes les données d'un jeu de données par son identifiant :
```R
data <- get_all_data("DS_POPULATIONS_REFERENCE")
```

## Configuration

### Authentification et quota de requêtes
Le package repose sur l'API Melodi, accessible sans authentification.

Son usage est limité à **30 requêtes par minute** : au delà, un code réponse **429** est obtenu.

### Proxy

Dans le cas d'une utilisation du package depuis un réseau d'entreprise, il peut être utile de configurer le proxy d'accès internet de la manière suivante :

```R
Sys.setenv(http_proxy = "my_proxy_server:port")
Sys.setenv(https_proxy = "my_proxy_server:port"")
# Désactiver le proxy sur certaines adresses
#Sys.setenv(no_proxy = "exemple-url-interne.server.fr")
```
