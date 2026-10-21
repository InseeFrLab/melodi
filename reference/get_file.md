# Get file attached to a dataset : extract (XLSX), or full CSV file

Get file attached to a dataset : extract (XLSX), or full CSV file

## Usage

``` r
get_file(
  ds_name,
  file_name,
  download_file_name = NULL,
  download_directory = tempdir()
)
```

## Arguments

- ds_name:

  Dataset name

- file_name:

  File name

- download_file_name:

  Filename on disk after download - if not specified, preserve original
  file name from Melodi - default NULL (preserve original file name)

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
#> Downloaded path : /tmp/RtmpBsasAG/T1_DECES_JOUR_NAT_FR.xlsx
#> Request file : https://api.insee.fr/melodi/file/DS_EC_DECES/T1_DECES_JOUR_NAT_FR
#> [1] "/tmp/RtmpBsasAG/T1_DECES_JOUR_NAT_FR.xlsx"
```
