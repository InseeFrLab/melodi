# Get dataset metadata

Get dataset metadata

## Usage

``` r
get_metadata(ds_name)
```

## Arguments

- ds_name:

  Dataset name

## Value

list dataset metadata

## Examples

``` r
get_metadata("DS_POPULATIONS_REFERENCE")
#> Request dataset : https://api.insee.fr/melodi/catalog/DS_POPULATIONS_REFERENCE
#> $abstract
#>                                                                                                                                                                                                                                                                                                                                                                                                                          content
#> 1                                                                                                                                                                                                       Données de populations de référence : population municipale, population comptée à part et population totale pour les différentes circonscriptions administratives : régions, départements, arrondissements et communes. 
#> 2 The population data as of January 1, 2022, within the territorial boundaries of the municipalities as of January 1, 2024, is official and authenticated by decree. This data will take effect on January 1, 2025. The population figures are available for the various administrative divisions as of January 1, 2024, based on their territorial boundaries on that date: regions, departments, districts, and municipalities
#>   lang
#> 1   fr
#> 2   en
#> 
#> $accessRights
#>   content lang
#> 1   Libre   fr
#> 2    Free   en
#> 
#> $accrualPeriodicity
#> $accrualPeriodicity$label
#>   content lang
#> 1  Annuel   fr
#> 2  Annual   en
#> 
#> 
#> $confidentialityStatus
#>   content lang
#> 1   Libre   fr
#> 2    Free   en
#> 
#> $creator
#> [1] "Insee"
#> 
#> $description
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  content
#> 1 La loi du 27 février 2002 relative à la démocratie de proximité fixe comme premier objectif du recensement de la population la publication tous les ans des chiffres des populations de référence (ou populations légales) : population municipale, population comptée à part et population totale. Ces chiffres sont calculés pour la France, toutes ses communes et circonscriptions administratives. La responsabilité du calcul des populations de référence est confiée à l'Insee. \n\nLes données de population au 1er janvier 2023 dans les limites territoriales des communes au 1er janvier 2025 sont officielles et authentifiées par décret. Elles entrent en vigueur au 1er janvier 2026. 
#> 2                                                                                                                                                                                                                                                                      The law of February 27, 2002, concerning local democracy, establishes as the primary objective of the population census the annual publication of legal population figures: municipal population, population counted separately, and total population. These figures are calculated for France, all its municipalities, and administrative districts. The responsibility for calculating legal populations is entrusted to INSEE.
#>   lang
#> 1   fr
#> 2   en
#> 
#> $identifier
#> [1] "DS_POPULATIONS_REFERENCE"
#> 
#> $issued
#> [1] "2025-12-17T08:35:21.000297779"
#> 
#> $keyword
#>                                                         label
#> 1                              population, population, fr, en
#> 2        population municipale , municipal population, fr, en
#> 3 population comptée à part, population counted apart, fr, en
#> 4                 population totale, total population, fr, en
#> 5              populations légales, legal populations, fr, en
#> 6       population de référence, reference population, fr, en
#> 
#> $landingPage
#> $landingPage[[1]]
#>   lang url
#> 1   fr    
#> 2   en    
#> 
#> 
#> $modified
#> [1] "2025-12-18T12:00:16.299984912"
#> 
#> $numObservations
#> [1] 106065
#> 
#> $numSeries
#> [1] 0
#> 
#> $processStep
#>    content lang
#> 1 inseeApi   fr
#> 2 inseeApi   en
#> 
#> $product
#>                                                                                        accessURL
#> 1 https://api.insee.fr/melodi/file/DS_POPULATIONS_REFERENCE/DS_POPULATIONS_REFERENCE_2023_CSV_FR
#>   byteSize format                                   id              issued
#> 1   926388    CSV DS_POPULATIONS_REFERENCE_2023_CSV_FR 2025-12-17T08:50:56
#>   language mediaType            modified   packageFormat
#> 1       FR  text/csv 2025-12-17T08:50:56 application/zip
#>                      title
#> 1 Populations de référence
#> 
#> $publisher
#> $publisher$id
#> [1] "INSEE"
#> 
#> $publisher$label
#>                                                                 content lang
#> 1 Institut national de la statistique et des etudes economiques (INSEE)   fr
#> 2                 National Institute of Statistics and Economic Studies   en
#> 
#> 
#> $relations
#>        title                                      titleComplement
#> 1 , , fr, en Documentation et données complémentaires, NA, fr, en
#> 2 , , fr, en                                         , NA, fr, en
#>                                                        url
#> 1 https://www.insee.fr/fr/statistiques/8681011, NA, fr, en
#> 2                                             , NA, fr, en
#> 
#> $scopeNote
#>                                                                                                                                                                            content
#> 1                                                                                                                                                                                 
#> 2 The term “reference populations” replaces the former term “legal populations” used until 2021. This change is based on a recommendation from the official statistics authority. 
#>   lang
#> 1   fr
#> 2   en
#> 
#> $spatial
#> $spatial$id
#> [1] "FEHM"
#> 
#> $spatial$label
#>                    content lang
#> 1      France hors Mayotte   fr
#> 2 France excluding Mayotte   en
#> 
#> 
#> $spatialResolution
#>       id                                                label
#> 1    COM                             Commune, Commune, fr, en
#> 2    ARM Arrondissement municipal, Municipal district, fr, en
#> 3    ARR                     Arrondissement, District, fr, en
#> 4    DEP                      Département, Department, fr, en
#> 5    REG                               Région, Region, fr, en
#> 6 FRANCE                               France, France, fr, en
#> 
#> $spatialTemporal
#> [1] "2025-01-01T01:00:00"
#> 
#> $statisticalUnit
#>                      label
#> 1 Individu, Person, fr, en
#> 
#> $structure
#> $structure$dsd
#> [1] "DSD_POPULATIONS_REFERENCE"
#> 
#> 
#> $subtitle
#>                        content lang
#> 1 Recensement de la population   fr
#> 2                                en
#> 
#> $temporal
#> $temporal$endPeriod
#> [1] "2023-01-01T00:00:00"
#> 
#> $temporal$startPeriod
#> [1] "2023-01-01T00:00:00"
#> 
#> 
#> $temporalResolution
#>                    label
#> 1 Annuel, Annual, fr, en
#> 
#> $theme
#>                                                                                      label
#> 1                      1.1 Population et immigration, 1.1 Population and migration, fr, en
#> 2 1. Statistiques démographiques et sociales, 1. Demographic and social statistics, fr, en
#> 3                                                          Démographie, Demography, fr, en
#>                       themeTaxonomy
#> 1 classificationOfStatisticalDomain
#> 2 classificationOfStatisticalDomain
#> 3                        inseeTheme
#> 
#> $title
#>                    content lang
#> 1 Populations de référence   fr
#> 2   Reference populations    en
#> 
#> $type
#>            content lang
#> 1 Données agrégées   fr
#> 2  Aggregated data   en
#> 
#> $uri
#> [1] "http://id.insee.fr/catalogues/jeuDeDonnees/c322eb4d-ec91-4723-8804-ea62e492612b"
#> 
#> $uuid
#> [1] "1d485ee2-734b-fd75-1bdf-43dacf2465a8"
#> 
#> $wasGeneratedBy
#>      id                                                   label
#> 1 s1321 Recensement de la population, Population census, fr, en
#> 2   s21 Recensement de la population, Population census, fr, en
#> 
```
