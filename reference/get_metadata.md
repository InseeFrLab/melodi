# Get dataset metadata

Get dataset metadata

## Usage

``` r
get_metadata(ds_name, base_url_melodi = "https://api.insee.fr/melodi")
```

## Arguments

- ds_name:

  Dataset name

- base_url_melodi:

  API Melodi URL - default production URL

## Value

list dataset metadata

## Examples

``` r
get_metadata("DS_POPULATIONS_REFERENCE")
#> Request dataset : https://api.insee.fr/melodi/catalog/DS_POPULATIONS_REFERENCE
#> $identifier
#> [1] "DS_POPULATIONS_REFERENCE"
#> 
#> $uri
#> [1] "http://id.insee.fr/catalogues/jeuDeDonnees/c322eb4d-ec91-4723-8804-ea62e492612b"
#> 
#> $title
#>   lang                  content
#> 1   fr Populations de référence
#> 2   en   Reference populations 
#> 
#> $subtitle
#>   lang                      content
#> 1   fr Recensement de la population
#> 2   en                             
#> 
#> $description
#>   lang
#> 1   fr
#> 2   en
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  content
#> 1 La loi du 27 février 2002 relative à la démocratie de proximité fixe comme premier objectif du recensement de la population la publication tous les ans des chiffres des populations de référence (ou populations légales) : population municipale, population comptée à part et population totale. Ces chiffres sont calculés pour la France, toutes ses communes et circonscriptions administratives. La responsabilité du calcul des populations de référence est confiée à l'Insee. \n\nLes données de population au 1er janvier 2023 dans les limites territoriales des communes au 1er janvier 2025 sont officielles et authentifiées par décret. Elles entrent en vigueur au 1er janvier 2026. 
#> 2                                                                                                                                                                                                                                                                      The law of February 27, 2002, concerning local democracy, establishes as the primary objective of the population census the annual publication of legal population figures: municipal population, population counted separately, and total population. These figures are calculated for France, all its municipalities, and administrative districts. The responsibility for calculating legal populations is entrusted to INSEE.
#> 
#> $accessRights
#>   lang content
#> 1   fr   Libre
#> 2   en    Free
#> 
#> $processStep
#>   lang  content
#> 1   fr inseeApi
#> 2   en inseeApi
#> 
#> $confidentialityStatus
#>   lang content
#> 1   fr   Libre
#> 2   en    Free
#> 
#> $type
#>   lang          content
#> 1   fr Données agrégées
#> 2   en  Aggregated data
#> 
#> $issued
#> [1] "2025-12-17T08:35:21"
#> 
#> $creator
#> [1] "Insee"
#> 
#> $modified
#> [1] "2025-12-18T12:00:16"
#> 
#> $publisher
#> $publisher$id
#> [1] "INSEE"
#> 
#> $publisher$label
#>   lang                                                               content
#> 1   fr Institut national de la statistique et des etudes economiques (INSEE)
#> 2   en                 National Institute of Statistics and Economic Studies
#> 
#> 
#> $wasGeneratedBy
#>      id                                                   label
#> 1 s1321 fr, en, Recensement de la population, Population census
#> 2   s21 fr, en, Recensement de la population, Population census
#> 
#> $temporal
#> $temporal$startPeriod
#> [1] "2023-01-01T00:00:00"
#> 
#> $temporal$endPeriod
#> [1] "2023-01-01T00:00:00"
#> 
#> 
#> $temporalResolution
#>                    label
#> 1 fr, en, Annuel, Annual
#> 
#> $accrualPeriodicity
#> $accrualPeriodicity$label
#>   lang content
#> 1   fr  Annuel
#> 2   en  Annual
#> 
#> 
#> $spatial
#> $spatial$id
#> [1] "FEHM"
#> 
#> $spatial$label
#>   lang                  content
#> 1   fr      France hors Mayotte
#> 2   en France excluding Mayotte
#> 
#> 
#> $spatialResolution
#>       id                                                label
#> 1    COM                             fr, en, Commune, Commune
#> 2    ARM fr, en, Arrondissement municipal, Municipal district
#> 3    ARR                     fr, en, Arrondissement, District
#> 4    DEP                      fr, en, Département, Department
#> 5    REG                               fr, en, Région, Region
#> 6 FRANCE                               fr, en, France, France
#> 
#> $spatialTemporal
#> [1] "2025-01-01T01:00:00"
#> 
#> $statisticalUnit
#>                      label
#> 1 fr, en, Individu, Person
#> 
#> $theme
#>                                                                                      label
#> 1                      fr, en, 1.1 Population et immigration, 1.1 Population and migration
#> 2 fr, en, 1. Statistiques démographiques et sociales, 1. Demographic and social statistics
#> 3                                                          fr, en, Démographie, Demography
#>                       themeTaxonomy
#> 1 classificationOfStatisticalDomain
#> 2 classificationOfStatisticalDomain
#> 3                        inseeTheme
#> 
#> $landingPage
#> $landingPage[[1]]
#>   lang url
#> 1   fr    
#> 2   en    
#> 
#> 
#> $structure
#> $structure$dsd
#> [1] "DSD_POPULATIONS_REFERENCE"
#> 
#> 
#> $product
#>                                     id format              issued
#> 1 DS_POPULATIONS_REFERENCE_2023_CSV_FR    CSV 2025-12-17T08:50:56
#>              modified                    title
#> 1 2025-12-17T08:50:56 Populations de référence
#>                                                                                        accessURL
#> 1 https://api.insee.fr/melodi/file/DS_POPULATIONS_REFERENCE/DS_POPULATIONS_REFERENCE_2023_CSV_FR
#>   byteSize   packageFormat mediaType language
#> 1   926388 application/zip  text/csv       FR
#> 
#> $numObservations
#> [1] 106065
#> 
#> $numSeries
#> [1] 0
#> 
#> $keyword
#>                                                         label
#> 1                              fr, en, population, population
#> 2        fr, en, population municipale , municipal population
#> 3 fr, en, population comptée à part, population counted apart
#> 4                 fr, en, population totale, total population
#> 5              fr, en, populations légales, legal populations
#> 6       fr, en, population de référence, reference population
#> 
#> $scopeNote
#>   lang
#> 1   fr
#> 2   en
#>                                                                                                                                                                            content
#> 1                                                                                                                                                                                 
#> 2 The term “reference populations” replaces the former term “legal populations” used until 2021. This change is based on a recommendation from the official statistics authority. 
#> 
#> $relations
#>        title                                      titleComplement
#> 1 fr, en, ,  fr, en, Documentation et données complémentaires, NA
#> 2 fr, en, ,                                          fr, en, , NA
#>                                                        url
#> 1 fr, en, https://www.insee.fr/fr/statistiques/8681011, NA
#> 2                                             fr, en, , NA
#> 
#> $abstract
#>   lang
#> 1   fr
#> 2   en
#>                                                                                                                                                                                                                                                                                                                                                                                                                          content
#> 1                                                                                                                                                                                                       Données de populations de référence : population municipale, population comptée à part et population totale pour les différentes circonscriptions administratives : régions, départements, arrondissements et communes. 
#> 2 The population data as of January 1, 2022, within the territorial boundaries of the municipalities as of January 1, 2024, is official and authenticated by decree. This data will take effect on January 1, 2025. The population figures are available for the various administrative divisions as of January 1, 2024, based on their territorial boundaries on that date: regions, departments, districts, and municipalities
#> 
```
