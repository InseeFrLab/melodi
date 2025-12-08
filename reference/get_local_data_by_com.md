# Get data on every Commune of one territory

Get data on every Commune of one territory

## Usage

``` r
get_local_data_by_com(
  ds_name,
  geo,
  geo_object,
  filter = "",
  base_url_melodi = "https://api.insee.fr/melodi"
)
```

## Arguments

- ds_name:

  Dataset name

- geo:

  Code geo

- geo_object:

  Geo Level

- filter:

  additionnal filter on request - default : ""

- base_url_melodi:

  API Melodi URL - default production URL

## Value

data.frame with data

## Examples

``` r
get_local_data_by_com(
  ds_name = "DS_POPULATIONS_REFERENCE",
  geo = "44",
  geo_object = "DEP"
) |>
head()
#> Total count request : https://api.insee.fr/melodi/data/DS_POPULATIONS_REFERENCE?GEO=DEP-44%2ACOM&totalCount=TRUE&maxResult=0
#> Number of lines : 1 863
#>   GEO_REF GEO_OBJECT   GEO FREQ TIME_PERIOD POPREF_MEASURE OBS_VALUE
#> 1    2024        COM 44130    A        2016           PCAP        96
#> 2    2024        COM 44214    A        2016           PCAP        29
#> 3    2024        COM 44099    A        2016           PMUN      1960
#> 4    2024        COM 44214    A        2016           PTOT      2089
#> 5    2024        COM 44120    A        2016           PMUN      5050
#> 6    2024        COM 44044    A        2016           PCAP        16

get_local_data_by_com(
  ds_name = "DS_POPULATIONS_REFERENCE",
  geo = "44",
  geo_object = "DEP",
  filter = "POPREF_MEASURE=PMUN&TIME_PERIOD=2022"
) |>
head()
#> Total count request : https://api.insee.fr/melodi/data/DS_POPULATIONS_REFERENCE?GEO=DEP-44%2ACOM&POPREF_MEASURE=PMUN&TIME_PERIOD=2022&totalCount=TRUE&maxResult=0
#> Number of lines : 207
#>   GEO_REF GEO_OBJECT   GEO FREQ TIME_PERIOD POPREF_MEASURE OBS_VALUE
#> 1    2024        COM 44217    A        2022           PMUN      6633
#> 2    2024        COM 44179    A        2022           PMUN      5435
#> 3    2024        COM 44086    A        2022           PMUN      1064
#> 4    2024        COM 44162    A        2022           PMUN     50561
#> 5    2024        COM 44055    A        2022           PMUN     16613
#> 6    2024        COM 44119    A        2022           PMUN      2042
```
