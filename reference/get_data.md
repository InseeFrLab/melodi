# Get Melodi data by URL.

URL parameter can be copied/pasted from explorer
https://catalogue-donnees.insee.fr

## Usage

``` r
get_data(url)
```

## Arguments

- url:

  URL API data Melodi - Start by "https://api.insee.fr/melodi/data/..."

## Value

data.frame with data

## Examples

``` r
get_data(
  "https://api.insee.fr/melodi/data/DS_POPULATIONS_REFERENCE?GEO=FRANCE-F"
)
#> Total count request : https://api.insee.fr/melodi/data/DS_POPULATIONS_REFERENCE?GEO=FRANCE-F&totalCount=TRUE&maxResult=0
#> Number of lines : 3
#>   GEO_REF GEO_OBJECT GEO FREQ TIME_PERIOD POPREF_MEASURE OBS_VALUE
#> 1    2025     FRANCE   F    A        2023           PTOT  69294105
#> 2    2025     FRANCE   F    A        2023           PMUN  68094280
#> 3    2025     FRANCE   F    A        2023           PCAP   1199825
```
