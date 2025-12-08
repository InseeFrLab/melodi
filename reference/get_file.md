# Get file attached to a dataset : extract (XLSX), or full CSV file

Get file attached to a dataset : extract (XLSX), or full CSV file

## Usage

``` r
get_file(
  ds_name,
  file_name,
  download_file_name,
  download_directory = tempdir(),
  base_url_melodi = "https://api.insee.fr/melodi"
)
```

## Arguments

- ds_name:

  Dataset name

- file_name:

  File name

- download_file_name:

  Filename on disk after download

- download_directory:

  Download directory - default system tempdir

- base_url_melodi:

  API Melodi URL - default production URL

## Value

downloaded file name on disk

## Examples

``` r
get_file(
ds_name = "DS_EC_DECES",
file_name = "T1_DECES_JOUR_NAT_FR",
download_file_name = "T1_DECES_JOUR_NAT_FR.xlsx"
)
#> Request file : https://api.insee.fr/melodi/file/DS_EC_DECES/T1_DECES_JOUR_NAT_FR
#> Downloaded path : /tmp/RtmpmbQ6Ax/T1_DECES_JOUR_NAT_FR.xlsx
#> [1] "/tmp/RtmpmbQ6Ax/T1_DECES_JOUR_NAT_FR.xlsx"
```
