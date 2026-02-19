# Get dataset range (codes and labels)

Retrieves the list of dimensions and all their possible modalities
values (codes and human-readable labels) for a given dataset. For GEO
dimension, it is recommanded to used dedicated function :
get_range_geo()

## Usage

``` r
get_range(ds_name, lang = "fr", exclusions_list = c("GEO"))
```

## Arguments

- ds_name:

  dataset name

- lang:

  french or english labels - default french ("fr")

- exclusions_list:

  exclude some dimensions for a faster and light result - default :
  "GEO"

## Value

A data frame with dimensions and modalities codes and labels

## Examples

``` r
get_range("DS_POPULATIONS_REFERENCE")
#> Request dataset range : https://api.insee.fr/melodi/range/DS_POPULATIONS_REFERENCE
#> Error: parse error: premature EOF
#>                                        {   "code" : "DS_POPULATIONS_RE
#>                      (right here) ------^

get_range(
  ds_name = "DS_POPULATIONS_REFERENCE",
  lang = "en"
)
#> Request dataset range : https://api.insee.fr/melodi/range/DS_POPULATIONS_REFERENCE
#> Error: parse error: premature EOF
#>                                        {   "code" : "DS_POPULATIONS_RE
#>                      (right here) ------^

get_range(
  ds_name = "DS_EC_DECES",
  exclusions_list = c("GEO", "TIME_PERIOD")
)
#> Request dataset range : https://api.insee.fr/melodi/range/DS_EC_DECES
#>              DIM         DIM_LABEL              MOD
#> 1     EC_MEASURE Mesure état civil              DTH
#> 2     EC_MEASURE Mesure état civil         DTH_CUMR
#> 3     EC_MEASURE Mesure état civil        DTH_MEAN2
#> 4     EC_MEASURE Mesure état civil        DTH_MEAN1
#> 5            SEX              Sexe                F
#> 6            SEX              Sexe                M
#> 7            SEX              Sexe               _T
#> 8           FREQ         Fréquence                A
#> 9           FREQ         Fréquence                D
#> 10          FREQ         Fréquence                M
#> 11     DTH_PLACE     Lieu du décès                1
#> 12     DTH_PLACE     Lieu du décès                2
#> 13     DTH_PLACE     Lieu du décès                3
#> 14     DTH_PLACE     Lieu du décès                4
#> 15     DTH_PLACE     Lieu du décès                5
#> 16     DTH_PLACE     Lieu du décès               _T
#> 17           AGE               Âge           Y25T49
#> 18           AGE               Âge           Y75T84
#> 19           AGE               Âge           Y65T74
#> 20           AGE               Âge           Y_GE85
#> 21           AGE               Âge           Y_LT25
#> 22           AGE               Âge           Y50T64
#> 23           AGE               Âge               _T
#> 24       MEASURE            Mesure OBS_VALUE_NIVEAU
#> 25 OBS_STATUS_FR           Version                D
#> 26 OBS_STATUS_FR           Version             PROV
#>                                                       MOD_LABEL
#> 1                                               Nombre de décès
#> 2  Nombre de décès du 1er janvier à la fin du mois de référence
#> 3       Nombre moyen de décès par jour sur les 7 derniers jours
#> 4                                Nombre moyen de décès par jour
#> 5                                                         Femme
#> 6                                                         Homme
#> 7                                                         Total
#> 8                                                        Annuel
#> 9                                                     Quotidien
#> 10                                                      Mensuel
#> 11                                                     Domicile
#> 12                                       Établissement de santé
#> 13                                    Ephad, maison de retraite
#> 14                                          Voie ou lieu public
#> 15                                   Autre lieu ou lieu inconnu
#> 16                                                        Total
#> 17                                               De 25 à 49 ans
#> 18                                               De 75 à 84 ans
#> 19                                               De 65 à 74 ans
#> 20                                               85 ans ou plus
#> 21                                              Moins de 25 ans
#> 22                                               De 50 à 64 ans
#> 23                                                        Total
#> 24                                                       Valeur
#> 25                                                    Définitif
#> 26                                                   Provisoire
```
