# Get dataset's geography : codes and labels

Retrieves the list of geo dimensions and all their possible values
(codes and human-readable labels) for a given dataset.

## Usage

``` r
get_range_geo(ds_name, lang = "fr")
```

## Arguments

- ds_name:

  dataset name

- lang:

  french or english labels - default french ("fr")

## Value

A data frame with columns `GEO_REF`, `GEO_OBJECT`, `GEO_OBJECT_LABEL`,
`GEO`, `GEO_LABEL`

## Details

For other dimensions, refer to get_range()

## Examples

``` r
get_range_geo("DS_POPULATIONS_REFERENCE") |>
  head()
#> Request dataset range : https://api.insee.fr/melodi/range/DS_POPULATIONS_REFERENCE
#> Error: parse error: premature EOF
#>                                        {   "code" : "DS_POPULATIONS_RE
#>                      (right here) ------^
```
