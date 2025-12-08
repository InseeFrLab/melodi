# Get data on one territory

Get data on one territory

## Usage

``` r
get_local_data(
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
get_local_data(
  ds_name = "DS_POPULATIONS_REFERENCE",
  geo = "69",
  geo_object = "DEP"
)
#> Total count request : https://api.insee.fr/melodi/data/DS_POPULATIONS_REFERENCE?GEO=DEP-69&totalCount=TRUE&maxResult=0
#> Number of lines : 9
#>   GEO_REF GEO_OBJECT GEO FREQ TIME_PERIOD POPREF_MEASURE OBS_VALUE
#> 1    2024        DEP  69    A        2022           PCAP     25178
#> 2    2024        DEP  69    A        2022           PMUN   1907982
#> 3    2024        DEP  69    A        2022           PTOT   1933160
#> 4    2024        DEP  69    A        2011           PTOT   1775953
#> 5    2024        DEP  69    A        2011           PCAP     31717
#> 6    2024        DEP  69    A        2011           PMUN   1744236
#> 7    2024        DEP  69    A        2016           PTOT   1864962
#> 8    2024        DEP  69    A        2016           PCAP     29059
#> 9    2024        DEP  69    A        2016           PMUN   1835903

get_local_data(
  ds_name = "DS_POPULATIONS_REFERENCE",
  geo = "69",
  geo_object = "DEP",
  filter = "POPREF_MEASURE=PMUN&TIME_PERIOD=2022"
)
#> Total count request : https://api.insee.fr/melodi/data/DS_POPULATIONS_REFERENCE?GEO=DEP-69&POPREF_MEASURE=PMUN&TIME_PERIOD=2022&totalCount=TRUE&maxResult=0
#> Number of lines : 1
#>   GEO_REF GEO_OBJECT GEO FREQ TIME_PERIOD POPREF_MEASURE OBS_VALUE
#> 1    2024        DEP  69    A        2022           PMUN   1907982
```
