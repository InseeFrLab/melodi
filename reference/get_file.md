# Get file attached to a dataset : extract (XLSX), or full CSV file

Get file attached to a dataset : extract (XLSX), or full CSV file

## Usage

``` r
get_file(
  ds_name,
  file_name,
  download_file_name,
  download_directory = tempdir()
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
#> Downloaded path : /tmp/RtmpI0nkW8/T1_DECES_JOUR_NAT_FR.xlsx
#> [1] "/tmp/RtmpI0nkW8/T1_DECES_JOUR_NAT_FR.xlsx"
```
