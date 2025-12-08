# Prise en main

## Parcourir les jeux de données disponibles

La fonction
[`get_catalog()`](https://InseeFrLab.github.io/melodi/reference/get_catalog.md)
permet de lister l’ensemble des jeux de données disponibles [sur le
catalogue de données de l’Insee](https://catalogue-donnees.insee.fr).

Chaque jeux de données (dataset, `DS`) dispose d’un identifiant unique
(`identifier`) qui sera utile au requêtage.

Une séléction de métadonnées est également proposé : description du jeu
de données, date de dernière mise à jour, nombre de lignes…

``` r
get_catalog()
```

## Obtenir des informations sur un jeu de données

Intéressons nous aux données de populations de référence issues du
recensement de la population. L’identifiant du jeu de données est
`DS_POPULATIONS_REFERENCE`.

A l’aide de cet identifiant,
[`get_metadata()`](https://InseeFrLab.github.io/melodi/reference/get_metadata.md)
permet d’obtenir les métadonnées associées à ce jeu de données

``` r
ds_metadata <- get_metadata(ds_name = "DS_POPULATIONS_REFERENCE")
```

## Charger entièrement les données d’un jeu de données

A l’aide de l’identifiant du jeu de données,
[`get_all_data()`](https://InseeFrLab.github.io/melodi/reference/get_all_data.md)
permet d’obtenir sous forme de data.frame le jeu de données dans son
intégralité, non filtré.

``` r
data <- get_all_data(ds_name = "DS_POPULATIONS_REFERENCE")
```

## Filtrer ses données à l’aide de l’explorateur

[Se référer à l’article
dédié](https://InseeFrLab.github.io/melodi/articles/filtre-explorateur.md)

## Filtrer ses données locales sur un territoire

[Se référer à l’article
dédié](https://InseeFrLab.github.io/melodi/articles/donnees-locales.md)
