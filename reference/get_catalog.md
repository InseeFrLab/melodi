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
#> # A tibble: 163 × 31
#>    identifier title subtitle description abstract warning numObservations csvUrl
#>    <chr>      <chr> <chr>    <chr>       <chr>    <chr>             <int> <chr> 
#>  1 DD_CNA_AG… Prod… Comptes… "Le produi… Données… "Les d…          228727 https…
#>  2 DD_CNA_APU Comp… Comptes… "Le secteu… Données… "Les d…          627596 https…
#>  3 DD_CNA_BR… Acti… Comptes… "Données a… Données… ""               444052 https…
#>  4 DD_CNA_CO… Cons… Comptes… "Données a… Données… "La da…          258305 https…
#>  5 DD_CNA_CO… Cons… Comptes… "Données a… Données… ""              1032294 https…
#>  6 DD_CNA_EC… Écha… Comptes… "Données a… Données… ""                74771 https…
#>  7 DD_CNA_PA… Comp… Comptes… "Le patrim… Données… "30/07…          251012 https…
#>  8 DD_CNA_PA… Comp… Comptes… "Le patrim… Données… "30/07…          936227 https…
#>  9 DD_CNA_RE… Ress… Comptes… ""          Données… ""               293699 https…
#> 10 DD_CNA_SUT Tabl… Comptes… "Le tablea… Données… ""               357816 https…
#> # ℹ 153 more rows
#> # ℹ 23 more variables: csvSize <int>, parquetUrl <chr>, parquetSize <int>,
#> #   issued <date>, modified <date>, periodicity <chr>, startPeriod <date>,
#> #   endPeriod <date>, spatialResolution <chr>, spatialTemporal <chr>,
#> #   spatial <chr>, statisticalUnit <chr>, keyword <chr>, theme <chr>,
#> #   source <chr>, relationsTitle <chr>, relationsUrl <chr>, numSeries <int>,
#> #   dsd <chr>, uri <chr>, uuid <chr>, ordreComposants <chr>, raccourcis <lgl>
get_catalog(lang = "en")
#> Request all catalog : https://api.insee.fr/melodi/catalog/all
#> # A tibble: 163 × 31
#>    identifier title subtitle description abstract warning numObservations csvUrl
#>    <chr>      <chr> <chr>    <chr>       <chr>    <chr>             <int> <chr> 
#>  1 DD_CNA_AG… Gros… Base 20… "Gross dom… Annual … "The d…          228727 https…
#>  2 DD_CNA_APU Gene… Annual … "The gener… Data de… "The d…          627596 https…
#>  3 DD_CNA_BR… Prod… Nationa… "Annual da… Annual … ""               444052 https…
#>  4 DD_CNA_CO… Hous… Nationa… "Annual da… Annual … "The u…          258305 https…
#>  5 DD_CNA_CO… Hous… Nationa… "Annual da… Annual … ""              1032294 https…
#>  6 DD_CNA_EC… Fore… Nationa… "Annual da… Annual … ""                74771 https…
#>  7 DD_CNA_PA… Bala… Nationa… "National … This da… "07/30…          251012 https…
#>  8 DD_CNA_PA… Bala… Nationa… "National … This da… "07/30…          936227 https…
#>  9 DD_CNA_RE… Good… Base 20… ""          Yearly … ""               293699 https…
#> 10 DD_CNA_SUT Supp… Base 20… "The input… Data fr… ""               357816 https…
#> # ℹ 153 more rows
#> # ℹ 23 more variables: csvSize <int>, parquetUrl <chr>, parquetSize <int>,
#> #   issued <date>, modified <date>, periodicity <chr>, startPeriod <date>,
#> #   endPeriod <date>, spatialResolution <chr>, spatialTemporal <chr>,
#> #   spatial <chr>, statisticalUnit <chr>, keyword <chr>, theme <chr>,
#> #   source <chr>, relationsTitle <chr>, relationsUrl <chr>, numSeries <int>,
#> #   dsd <chr>, uri <chr>, uuid <chr>, ordreComposants <chr>, raccourcis <lgl>
```
