# Get list of available datasets

Get list of available datasets

## Usage

``` r
get_catalog(lang = "fr")
```

## Arguments

- lang:

  lang of metadata informations (default: fr)

## Value

a data.frame containing list of available datasets

## Examples

``` r
get_catalog()
#> Request all catalog : https://api.insee.fr/melodi/catalog/all
#> # A tibble: 106 × 12
#>    identifier                 title_content subtitle_content description_content
#>    <chr>                      <chr>         <chr>            <chr>              
#>  1 DD_CNA_AGREGATS            Produit Inté… Comptes nationa… "Le produit intéri…
#>  2 DD_CNA_APU                 Comptes des … Comptes nationa… "Le secteur instit…
#>  3 DD_CNA_BRANCHES            Activité des… Comptes nationa… "Données annuelles…
#>  4 DD_CNA_CONSO_MENAGES_COIC… Consommation… Comptes nationa… "Données annuelles…
#>  5 DD_CNA_CONSO_MENAGES_PROD… Consommation… Comptes nationa… "Données annuelles…
#>  6 DD_CNA_ECH_EXT             Échanges ext… Comptes nationa… "Données annuelles…
#>  7 DD_CNA_PATRIMOINE          Comptes de p… Comptes nationa… "Le patrimoine nat…
#>  8 DD_CNA_PATRIMOINE_BRANCHES Comptes de p… Comptes nationa… "Le patrimoine nat…
#>  9 DD_CNA_REBS                Ressources e… Comptes nationa… ""                 
#> 10 DD_CNA_SUT                 Tableau des … Comptes nationa… "Le tableau des en…
#> # ℹ 96 more rows
#> # ℹ 8 more variables: abstract_content <chr>, temporal_endPeriod <date>,
#> #   temporal_startPeriod <date>, modified <date>, spatialResolution <chr>,
#> #   spatialTemporal <int>, numObservations <int>, numSeries <int>
get_catalog(lang = "en")
#> Request all catalog : https://api.insee.fr/melodi/catalog/all
#> # A tibble: 106 × 12
#>    identifier                 title_content subtitle_content description_content
#>    <chr>                      <chr>         <chr>            <chr>              
#>  1 DD_CNA_AGREGATS            Gross domest… Base 2020 - Ann… "Gross domestic pr…
#>  2 DD_CNA_APU                 General gove… Annual national… "The general gover…
#>  3 DD_CNA_BRANCHES            Production a… National accoun… "Annual data on th…
#>  4 DD_CNA_CONSO_MENAGES_COIC… Households c… National accoun… "Annual data on ac…
#>  5 DD_CNA_CONSO_MENAGES_PROD… Household co… National accoun… "Annual data on ac…
#>  6 DD_CNA_ECH_EXT             Foreign exch… National Accoun… "Annual data on Fr…
#>  7 DD_CNA_PATRIMOINE          Balance sheet National accoun… "National wealth r…
#>  8 DD_CNA_PATRIMOINE_BRANCHES Balance shee… National Accoun… "National wealth r…
#>  9 DD_CNA_REBS                Goods and se… Base 2020 - Ann… ""                 
#> 10 DD_CNA_SUT                 Supply and u… Base 2020 - Ann… "The input-output …
#> # ℹ 96 more rows
#> # ℹ 8 more variables: abstract_content <chr>, temporal_endPeriod <date>,
#> #   temporal_startPeriod <date>, modified <date>, spatialResolution <chr>,
#> #   spatialTemporal <int>, numObservations <int>, numSeries <int>
```
