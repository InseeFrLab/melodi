# Melodi : Insee open data R package

🇫🇷 Télécharger, parcourir, filtrer les données et métadonnées diffusées
par l’Insee en open data sur [le catalogue de données de l’Insee
(melodi)](https://catalogue-donnees.insee.fr)

🇬🇧 Download, search, filter data and metadata from open data statistical
public datasets, from [Insee Data catalogue
(melodi)](https://catalogue-donnees.insee.fr).

## Installation

Installer la dernière version stable depuis le CRAN :

``` r
install.packages("melodi")
```

### Development

Pour installer une version de développement depuis
[GitHub](https://github.com/):

``` r
# install.packages("remotes")
remotes::install_github("InseeFrLab/melodi", build_vignettes = TRUE)
```

## Exemples

Lister les jeux de données proposés par l’Insee via Melodi :

``` r
get_catalog()
```

Récupérer toutes les données d’un jeu de données par son identifiant :

``` r
data <- get_all_data("DS_POPULATIONS_REFERENCE")
```

## Configuration

### Authentification et quota de requêtes

Le package repose sur l’API Melodi, accessible sans authentification.

Son usage est limité à **30 requêtes par minute** : au delà, un code
réponse **429** est obtenu.

### Proxy

Dans le cas d’une utilisation du package depuis un réseau d’entreprise,
il peut être utile de configurer le proxy d’accès internet de la manière
suivante :

``` r
Sys.setenv(http_proxy = "my_proxy_server:port")
Sys.setenv(https_proxy = "my_proxy_server:port"")
# Désactiver le proxy sur certaines adresses
#Sys.setenv(no_proxy = "exemple-url-interne.server.fr")
```
