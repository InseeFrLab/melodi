# Get data on one territory

Get data on one territory

## Usage

``` r
get_local_data(ds_name, geo, geo_object, filter = "")
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
#> Number of lines : 3
#>   GEO_REF GEO_OBJECT GEO FREQ TIME_PERIOD POPREF_MEASURE OBS_VALUE
#> 1    2025        DEP  69    A        2023           PMUN   1914667
#> 2    2025        DEP  69    A        2023           PCAP     25348
#> 3    2025        DEP  69    A        2023           PTOT   1940015

get_local_data(
  ds_name = "DS_RP_POPULATION_PRINC",
  geo = "69",
  geo_object = "DEP",
  filter = "SEX=F&AGE=Y20T64"
)
#> Total count request : https://api.insee.fr/melodi/data/DS_RP_POPULATION_PRINC?GEO=DEP-69&SEX=F&AGE=Y20T64&totalCount=TRUE&maxResult=0
#> Number of lines : 3
#>   GEO_REF GEO_OBJECT GEO SEX TIME_PERIOD RP_MEASURE    AGE OBS_VALUE
#> 1    2025        DEP  69   F        2011        POP Y20T64  529046.9
#> 2    2025        DEP  69   F        2022        POP Y20T64  562310.0
#> 3    2025        DEP  69   F        2016        POP Y20T64  544085.5
```
