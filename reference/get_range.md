# Get dataset range (codes and labels)

Retrieves the list of dimensions and all their possible modalities
values (codes and human-readable labels) for a given dataset. For GEO
dimension, it is recommanded to used dedicated function :
get_range_geo()

## Usage

``` r
get_range(
  ds_name,
  base_url_melodi = "https://api.insee.fr/melodi",
  lang = "fr",
  exclusions_list = c("GEO")
)
```

## Arguments

- ds_name:

  dataset name

- base_url_melodi:

  API Melodi URL - default production URL

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
#>              DIM          DIM_LABEL              MOD                 MOD_LABEL
#> 1           FREQ          Fréquence                A                    Annuel
#> 2    TIME_PERIOD Période temporelle             2023                      2023
#> 3 POPREF_MEASURE             Mesure             PCAP Population comptée à part
#> 4 POPREF_MEASURE             Mesure             PMUN     Population municipale
#> 5 POPREF_MEASURE             Mesure             PTOT         Population totale
#> 6        MEASURE             Mesure OBS_VALUE_NIVEAU                    Valeur

get_range(
  ds_name = "DS_POPULATIONS_REFERENCE",
  lang = "en"
)
#> Request dataset range : https://api.insee.fr/melodi/range/DS_POPULATIONS_REFERENCE
#>              DIM   DIM_LABEL              MOD                MOD_LABEL
#> 1           FREQ   Frequency                A                   Annual
#> 2    TIME_PERIOD Time period             2023                     2023
#> 3 POPREF_MEASURE     Measure             PCAP Population counted apart
#> 4 POPREF_MEASURE     Measure             PMUN     Municipal population
#> 5 POPREF_MEASURE     Measure             PTOT         Total population
#> 6        MEASURE     Measure OBS_VALUE_NIVEAU                    Value

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
#> 9           FREQ         Fréquence                M
#> 10          FREQ         Fréquence                D
#> 11     DTH_PLACE     Lieu du décès                4
#> 12     DTH_PLACE     Lieu du décès                5
#> 13     DTH_PLACE     Lieu du décès                1
#> 14     DTH_PLACE     Lieu du décès                2
#> 15     DTH_PLACE     Lieu du décès                3
#> 16     DTH_PLACE     Lieu du décès               _T
#> 17           AGE               Âge           Y_GE85
#> 18           AGE               Âge           Y_LT25
#> 19           AGE               Âge           Y25T49
#> 20           AGE               Âge           Y50T64
#> 21           AGE               Âge           Y65T74
#> 22           AGE               Âge           Y75T84
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
#> 9                                                       Mensuel
#> 10                                                    Quotidien
#> 11                                          Voie ou lieu public
#> 12                                   Autre lieu ou lieu inconnu
#> 13                                                     Domicile
#> 14                                       Établissement de santé
#> 15                                    Ephad, maison de retraite
#> 16                                                        Total
#> 17                                              85 ans ou plus 
#> 18                                              Moins de 25 ans
#> 19                                               De 25 à 49 ans
#> 20                                              De 50 à 64 ans 
#> 21                                               De 65 à 74 ans
#> 22                                               De 75 à 84 ans
#> 23                                                        Total
#> 24                                                       Valeur
#> 25                                                    Définitif
#> 26                                                   Provisoire
```
