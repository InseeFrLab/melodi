# Travailler avec les libellés (range)

## Travailler avec les libellés : la range

### Cas général : get_range

A chaque jeu de données est associée une “range”, c’est à dire
l’ensemble des codes et libellés présents dans le jeu de données. Ainsi,
récupérer la range d’un jeu de données permet de récupérer les libellés
associés aux codes du jeu de données.

``` r
data <- get_all_data("DS_POPULATIONS_REFERENCE")
range <- get_range("DS_POPULATIONS_REFERENCE")

# Récupérons par exemples les libellés des codes de "POPREF_MEASURE" : 
# "Population municipale", "Population totale", etc. 
data |> 
  left_join(
    y = range,
    by = join_by(POPREF_MEASURE == MOD)
  )
# la variable supplémentaire MOD_LABEL contient ainsi le libellé de la mesure
```

### La géographie : get_range_geo

L’usage le plus courant consiste à récupérer les libellés des codes
géographiques.

Exemple : “Nantes” pour la commune (GEO_OBJECT=‘COM’) dont le code GEO
est ‘44109’.

Pour cela, une fonction dédiée a été créée, permettant d’obtenir codes
et libellés de tous les territoires du jeu de données passé en paramètre
: `get_range_geo`

``` r
get_range_geo("DS_POPULATIONS_REFERENCE")
# GEO_LABEL contient le libellé associé aux codes GEO et GEO_OBJECT identifiant
# un territoire dans le DS concerné
```
