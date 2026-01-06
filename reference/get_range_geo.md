# Get dataset's geography : codes and labels

Retrieves the list of geo dimensions and all their possible values
(codes and human-readable labels) for a given dataset.

## Usage

``` r
get_range_geo(
  ds_name,
  base_url_melodi = "https://api.insee.fr/melodi",
  lang = "fr"
)
```

## Arguments

- ds_name:

  dataset name

- base_url_melodi:

  API Melodi URL - default production URL

- lang:

  french or english labels - default french ("fr")

## Value

A data frame with columns `GEO_REF`, `GEO_OBJECT`, `GEO`, `GEO_LABEL`

## Details

For other dimensions, refer to get_range()

## Examples

``` r
get_range_geo("DS_POPULATIONS_REFERENCE") |>
head()
#> Request dataset range : https://api.insee.fr/melodi/range/DS_POPULATIONS_REFERENCE
#>   GEO_REF GEO_OBJECT   GEO                    GEO_LABEL
#> 1    2025        ARM 13201 Marseille 1er Arrondissement
#> 2    2025        ARM 13202  Marseille 2e Arrondissement
#> 3    2025        ARM 13203  Marseille 3e Arrondissement
#> 4    2025        ARM 13204  Marseille 4e Arrondissement
#> 5    2025        ARM 13205  Marseille 5e Arrondissement
#> 6    2025        ARM 13206  Marseille 6e Arrondissement
```
