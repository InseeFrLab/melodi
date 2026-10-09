# Get all data from a dataset

Get all data from a dataset

## Usage

``` r
get_all_data(
  ds_name,
  download_directory = tempdir(),
  stringsAsFactors = FALSE,
  remove_file = TRUE
)
```

## Arguments

- ds_name:

  Dataset name - use get_ds_list to find a dataset identifier

- download_directory:

  Download directory - default system tempdir

- stringsAsFactors:

  if TRUE, strings variables in data.frame are converted to factors -
  Default FALSE

- remove_file:

  Remove downloaded data file after loading data

  - Default TRUE

## Value

data.frame with data

## Examples

``` r
data <- get_all_data("DS_TICM_PRATIQUES")
#> Request dataset : https://api.insee.fr/melodi/catalog/DS_TICM_PRATIQUES
#> Request ZIP CSV file : https://api-diffusion-catalogue-donnees-externe.insee.fr/file/DS_TICM_PRATIQUES/DS_TICM_PRATIQUES_CSV_FR
#> Error in httr2::req_perform(httr2::req_progress(httr2::req_user_agent(httr2::request(zip_url),     getOption("rmelodi.req_user_agent"))), downloaded_zip_path): Failed to perform HTTP request.
#> Caused by error in `curl::curl_fetch_disk()`:
#> ! Couldn't resolve host name [api-diffusion-catalogue-donnees-externe.insee.fr]:
#> Could not resolve host: api-diffusion-catalogue-donnees-externe.insee.fr
```
