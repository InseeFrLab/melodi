# Get data on every Commune of one territory

Get data on every Commune of one territory

## Usage

``` r
get_local_data_by_com(ds_name, geo, geo_object, filter = "")
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
get_local_data_by_com(
  ds_name = "DS_POPULATIONS_REFERENCE",
  geo = "44",
  geo_object = "DEP"
) |>
  head()
#> Total count request : https://api.insee.fr/melodi/data/DS_POPULATIONS_REFERENCE?GEO=DEP-44%2ACOM&totalCount=TRUE&maxResult=0
#> Number of lines : 615
#>   GEO_REF GEO_OBJECT   GEO FREQ TIME_PERIOD POPREF_MEASURE OBS_VALUE
#> 1    2025        COM 44141    A        2023           PCAP        24
#> 2    2025        COM 44129    A        2023           PCAP       324
#> 3    2025        COM 44007    A        2023           PTOT      2513
#> 4    2025        COM 44043    A        2023           PMUN      7452
#> 5    2025        COM 44136    A        2023           PMUN      1321
#> 6    2025        COM 44179    A        2023           PMUN      5523

get_local_data_by_com(
  ds_name = "DS_RP_POPULATION_PRINC",
  geo = "44",
  geo_object = "DEP",
  filter = "SEX=F&AGE=Y20T64"
) |>
  head()
#> Total count request : https://api.insee.fr/melodi/data/DS_RP_POPULATION_PRINC?GEO=DEP-44%2ACOM&SEX=F&AGE=Y20T64&totalCount=TRUE&maxResult=0
#> Number of lines : 615
#>   GEO_REF GEO_OBJECT   GEO SEX TIME_PERIOD RP_MEASURE    AGE OBS_VALUE
#> 1    2025        COM 44003   F        2022        POP Y20T64 3046.6872
#> 2    2025        COM 44069   F        2022        POP Y20T64 4605.4263
#> 3    2025        COM 44220   F        2022        POP Y20T64  514.5749
#> 4    2025        COM 44129   F        2022        POP Y20T64 3038.7726
#> 5    2025        COM 44188   F        2022        POP Y20T64 2603.6244
#> 6    2025        COM 44132   F        2022        POP Y20T64 3101.0829
```
