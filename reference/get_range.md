# Get dataset range (codes and labels)

Retrieves the list of dimensions and all their possible modalities
values (codes and human-readable labels) for a given dataset. For GEO
dimension, it is recommanded to used dedicated function :
get_range_geo()

## Usage

``` r
get_range(
  ds_name,
  base_url_melodi = "https://api.insee.fr/melodi",
  lang = "fr",
  exclusions_list = c("GEO")
)
```

## Arguments

- ds_name:

  dataset name

- base_url_melodi:

  API Melodi URL - default production URL

- lang:

  french or english labels - default french ("fr")

- exclusions_list:

  exclude some dimensions for a faster and light result - default :
  "GEO", "TIME_PERIOD"

## Value

A data frame with dimensions and modalities codes and labels

## Examples

``` r
get_range("DS_POPULATIONS_REFERENCE")
#> Request dataset range : https://api.insee.fr/melodi/range/DS_POPULATIONS_REFERENCE
#>              DIM          DIM_LABEL              MOD                 MOD_LABEL
#> 1           FREQ          Fréquence                A                    Annuel
#> 2    TIME_PERIOD Période temporelle             2016                      2016
#> 3    TIME_PERIOD Période temporelle             2022                      2022
#> 4    TIME_PERIOD Période temporelle             2011                      2011
#> 5 POPREF_MEASURE             Mesure             PTOT         Population totale
#> 6 POPREF_MEASURE             Mesure             PMUN     Population municipale
#> 7 POPREF_MEASURE             Mesure             PCAP Population comptée à part
#> 8        MEASURE             Mesure OBS_VALUE_NIVEAU                    Valeur
get_range(ds_name = "DS_EC_DECES", lang = "en")
#> Request dataset range : https://api.insee.fr/melodi/range/DS_EC_DECES
#>               DIM            DIM_LABEL              MOD
#> 1      EC_MEASURE Civil status measure              DTH
#> 2      EC_MEASURE Civil status measure         DTH_CUMR
#> 3      EC_MEASURE Civil status measure        DTH_MEAN2
#> 4      EC_MEASURE Civil status measure        DTH_MEAN1
#> 5             SEX                  Sex                F
#> 6             SEX                  Sex                M
#> 7             SEX                  Sex               _T
#> 8            FREQ            Frequency                A
#> 9            FREQ            Frequency                M
#> 10           FREQ            Frequency                D
#> 11      DTH_PLACE       Place of death                4
#> 12      DTH_PLACE       Place of death                5
#> 13      DTH_PLACE       Place of death                1
#> 14      DTH_PLACE       Place of death                2
#> 15      DTH_PLACE       Place of death                3
#> 16      DTH_PLACE       Place of death               _T
#> 17    TIME_PERIOD          Time period             2024
#> 18    TIME_PERIOD          Time period             2018
#> 19    TIME_PERIOD          Time period             2019
#> 20    TIME_PERIOD          Time period             2015
#> 21    TIME_PERIOD          Time period             2020
#> 22    TIME_PERIOD          Time period             2023
#> 23    TIME_PERIOD          Time period             2016
#> 24    TIME_PERIOD          Time period          2024-01
#> 25    TIME_PERIOD          Time period          2024-02
#> 26    TIME_PERIOD          Time period          2024-03
#> 27    TIME_PERIOD          Time period          2024-04
#> 28    TIME_PERIOD          Time period          2024-05
#> 29    TIME_PERIOD          Time period          2024-06
#> 30    TIME_PERIOD          Time period          2024-07
#> 31    TIME_PERIOD          Time period          2024-08
#> 32    TIME_PERIOD          Time period          2024-09
#> 33    TIME_PERIOD          Time period          2024-10
#> 34    TIME_PERIOD          Time period          2024-11
#> 35    TIME_PERIOD          Time period          2024-12
#> 36    TIME_PERIOD          Time period          2025-01
#> 37    TIME_PERIOD          Time period          2025-02
#> 38    TIME_PERIOD          Time period          2025-03
#> 39    TIME_PERIOD          Time period          2025-04
#> 40    TIME_PERIOD          Time period          2025-05
#> 41    TIME_PERIOD          Time period          2025-06
#> 42    TIME_PERIOD          Time period          2025-07
#> 43    TIME_PERIOD          Time period          2025-08
#> 44    TIME_PERIOD          Time period          2025-09
#> 45    TIME_PERIOD          Time period          2025-10
#> 46    TIME_PERIOD          Time period             2017
#> 47    TIME_PERIOD          Time period             2021
#> 48    TIME_PERIOD          Time period             2022
#> 49    TIME_PERIOD          Time period          2020-09
#> 50    TIME_PERIOD          Time period          2020-10
#> 51    TIME_PERIOD          Time period          2020-11
#> 52    TIME_PERIOD          Time period          2020-12
#> 53    TIME_PERIOD          Time period          2020-01
#> 54    TIME_PERIOD          Time period          2020-02
#> 55    TIME_PERIOD          Time period          2020-03
#> 56    TIME_PERIOD          Time period          2020-04
#> 57    TIME_PERIOD          Time period          2020-05
#> 58    TIME_PERIOD          Time period          2020-06
#> 59    TIME_PERIOD          Time period          2020-07
#> 60    TIME_PERIOD          Time period          2020-08
#> 61    TIME_PERIOD          Time period          2021-01
#> 62    TIME_PERIOD          Time period          2021-02
#> 63    TIME_PERIOD          Time period          2021-03
#> 64    TIME_PERIOD          Time period          2021-04
#> 65    TIME_PERIOD          Time period          2021-05
#> 66    TIME_PERIOD          Time period          2021-06
#> 67    TIME_PERIOD          Time period          2021-07
#> 68    TIME_PERIOD          Time period          2021-08
#> 69    TIME_PERIOD          Time period          2021-09
#> 70    TIME_PERIOD          Time period          2021-10
#> 71    TIME_PERIOD          Time period          2021-11
#> 72    TIME_PERIOD          Time period          2021-12
#> 73    TIME_PERIOD          Time period          2022-01
#> 74    TIME_PERIOD          Time period          2022-02
#> 75    TIME_PERIOD          Time period          2022-03
#> 76    TIME_PERIOD          Time period          2022-04
#> 77    TIME_PERIOD          Time period          2022-05
#> 78    TIME_PERIOD          Time period          2022-06
#> 79    TIME_PERIOD          Time period          2022-07
#> 80    TIME_PERIOD          Time period          2022-08
#> 81    TIME_PERIOD          Time period          2022-09
#> 82    TIME_PERIOD          Time period          2022-10
#> 83    TIME_PERIOD          Time period          2022-11
#> 84    TIME_PERIOD          Time period          2022-12
#> 85    TIME_PERIOD          Time period          2023-05
#> 86    TIME_PERIOD          Time period          2023-06
#> 87    TIME_PERIOD          Time period          2023-07
#> 88    TIME_PERIOD          Time period          2023-08
#> 89    TIME_PERIOD          Time period          2023-09
#> 90    TIME_PERIOD          Time period          2023-10
#> 91    TIME_PERIOD          Time period          2023-11
#> 92    TIME_PERIOD          Time period          2023-12
#> 93    TIME_PERIOD          Time period          2023-01
#> 94    TIME_PERIOD          Time period          2023-02
#> 95    TIME_PERIOD          Time period          2023-03
#> 96    TIME_PERIOD          Time period          2023-04
#> 97    TIME_PERIOD          Time period       2024-01-01
#> 98    TIME_PERIOD          Time period       2024-01-02
#> 99    TIME_PERIOD          Time period       2024-01-03
#> 100   TIME_PERIOD          Time period       2024-01-04
#> 101   TIME_PERIOD          Time period       2024-01-05
#> 102   TIME_PERIOD          Time period       2024-01-06
#> 103   TIME_PERIOD          Time period       2024-01-07
#> 104   TIME_PERIOD          Time period       2024-01-08
#> 105   TIME_PERIOD          Time period       2024-01-09
#> 106   TIME_PERIOD          Time period       2024-03-14
#> 107   TIME_PERIOD          Time period       2024-01-10
#> 108   TIME_PERIOD          Time period       2024-03-15
#> 109   TIME_PERIOD          Time period       2024-01-11
#> 110   TIME_PERIOD          Time period       2024-03-16
#> 111   TIME_PERIOD          Time period       2024-01-12
#> 112   TIME_PERIOD          Time period       2024-01-13
#> 113   TIME_PERIOD          Time period       2024-03-17
#> 114   TIME_PERIOD          Time period       2024-01-14
#> 115   TIME_PERIOD          Time period       2024-01-15
#> 116   TIME_PERIOD          Time period       2024-03-18
#> 117   TIME_PERIOD          Time period       2024-01-16
#> 118   TIME_PERIOD          Time period       2024-03-19
#> 119   TIME_PERIOD          Time period       2024-01-17
#> 120   TIME_PERIOD          Time period       2024-03-20
#> 121   TIME_PERIOD          Time period       2024-01-18
#> 122   TIME_PERIOD          Time period       2024-03-21
#> 123   TIME_PERIOD          Time period       2024-03-22
#> 124   TIME_PERIOD          Time period       2024-01-19
#> 125   TIME_PERIOD          Time period       2024-01-20
#> 126   TIME_PERIOD          Time period       2024-03-23
#> 127   TIME_PERIOD          Time period       2024-01-21
#> 128   TIME_PERIOD          Time period       2024-03-24
#> 129   TIME_PERIOD          Time period       2024-03-25
#> 130   TIME_PERIOD          Time period       2024-03-26
#> 131   TIME_PERIOD          Time period       2024-01-22
#> 132   TIME_PERIOD          Time period       2024-03-27
#> 133   TIME_PERIOD          Time period       2024-01-23
#> 134   TIME_PERIOD          Time period       2024-03-28
#> 135   TIME_PERIOD          Time period       2024-01-24
#> 136   TIME_PERIOD          Time period       2024-03-29
#> 137   TIME_PERIOD          Time period       2024-03-30
#> 138   TIME_PERIOD          Time period       2024-01-25
#> 139   TIME_PERIOD          Time period       2024-03-31
#> 140   TIME_PERIOD          Time period       2024-01-26
#> 141   TIME_PERIOD          Time period       2024-04-01
#> 142   TIME_PERIOD          Time period       2024-01-27
#> 143   TIME_PERIOD          Time period       2024-04-02
#> 144   TIME_PERIOD          Time period       2024-01-28
#> 145   TIME_PERIOD          Time period       2024-04-03
#> 146   TIME_PERIOD          Time period       2024-01-29
#> 147   TIME_PERIOD          Time period       2024-04-04
#> 148   TIME_PERIOD          Time period       2024-01-30
#> 149   TIME_PERIOD          Time period       2024-04-05
#> 150   TIME_PERIOD          Time period       2024-04-06
#> 151   TIME_PERIOD          Time period       2024-01-31
#> 152   TIME_PERIOD          Time period       2024-02-01
#> 153   TIME_PERIOD          Time period       2024-04-07
#> 154   TIME_PERIOD          Time period       2024-02-02
#> 155   TIME_PERIOD          Time period       2024-04-08
#> 156   TIME_PERIOD          Time period       2024-06-01
#> 157   TIME_PERIOD          Time period       2024-02-03
#> 158   TIME_PERIOD          Time period       2024-04-09
#> 159   TIME_PERIOD          Time period       2024-04-10
#> 160   TIME_PERIOD          Time period       2024-06-02
#> 161   TIME_PERIOD          Time period       2024-02-04
#> 162   TIME_PERIOD          Time period       2024-06-03
#> 163   TIME_PERIOD          Time period       2024-04-11
#> 164   TIME_PERIOD          Time period       2024-02-05
#> 165   TIME_PERIOD          Time period       2024-06-04
#> 166   TIME_PERIOD          Time period       2024-04-12
#> 167   TIME_PERIOD          Time period       2024-02-06
#> 168   TIME_PERIOD          Time period       2024-06-05
#> 169   TIME_PERIOD          Time period       2024-02-07
#> 170   TIME_PERIOD          Time period       2024-04-13
#> 171   TIME_PERIOD          Time period       2024-06-06
#> 172   TIME_PERIOD          Time period       2024-02-08
#> 173   TIME_PERIOD          Time period       2024-04-14
#> 174   TIME_PERIOD          Time period       2024-06-07
#> 175   TIME_PERIOD          Time period       2024-02-09
#> 176   TIME_PERIOD          Time period       2024-04-15
#> 177   TIME_PERIOD          Time period       2024-06-08
#> 178   TIME_PERIOD          Time period       2024-02-10
#> 179   TIME_PERIOD          Time period       2024-04-16
#> 180   TIME_PERIOD          Time period       2024-06-09
#> 181   TIME_PERIOD          Time period       2024-02-11
#> 182   TIME_PERIOD          Time period       2024-04-17
#> 183   TIME_PERIOD          Time period       2024-06-10
#> 184   TIME_PERIOD          Time period       2024-02-12
#> 185   TIME_PERIOD          Time period       2024-06-11
#> 186   TIME_PERIOD          Time period       2024-02-13
#> 187   TIME_PERIOD          Time period       2024-04-18
#> 188   TIME_PERIOD          Time period       2024-06-12
#> 189   TIME_PERIOD          Time period       2024-02-14
#> 190   TIME_PERIOD          Time period       2024-08-15
#> 191   TIME_PERIOD          Time period       2024-06-13
#> 192   TIME_PERIOD          Time period       2024-04-19
#> 193   TIME_PERIOD          Time period       2024-02-15
#> 194   TIME_PERIOD          Time period       2024-08-16
#> 195   TIME_PERIOD          Time period       2024-06-14
#> 196   TIME_PERIOD          Time period       2024-04-20
#> 197   TIME_PERIOD          Time period       2024-02-16
#> 198   TIME_PERIOD          Time period       2024-08-17
#> 199   TIME_PERIOD          Time period       2024-06-15
#> 200   TIME_PERIOD          Time period       2024-04-21
#> 201   TIME_PERIOD          Time period       2024-02-17
#> 202   TIME_PERIOD          Time period       2024-08-18
#> 203   TIME_PERIOD          Time period       2024-04-22
#> 204   TIME_PERIOD          Time period       2024-06-16
#> 205   TIME_PERIOD          Time period       2024-02-18
#> 206   TIME_PERIOD          Time period       2024-06-17
#> 207   TIME_PERIOD          Time period       2024-02-19
#> 208   TIME_PERIOD          Time period       2024-08-19
#> 209   TIME_PERIOD          Time period       2024-04-23
#> 210   TIME_PERIOD          Time period       2024-06-18
#> 211   TIME_PERIOD          Time period       2024-02-20
#> 212   TIME_PERIOD          Time period       2024-06-19
#> 213   TIME_PERIOD          Time period       2024-08-20
#> 214   TIME_PERIOD          Time period       2024-04-24
#> 215   TIME_PERIOD          Time period       2024-06-20
#> 216   TIME_PERIOD          Time period       2024-08-21
#> 217   TIME_PERIOD          Time period       2024-02-21
#> 218   TIME_PERIOD          Time period       2024-04-25
#> 219   TIME_PERIOD          Time period       2024-06-21
#> 220   TIME_PERIOD          Time period       2024-02-22
#> 221   TIME_PERIOD          Time period       2024-04-26
#> 222   TIME_PERIOD          Time period       2024-08-22
#> 223   TIME_PERIOD          Time period       2024-06-22
#> 224   TIME_PERIOD          Time period       2024-04-27
#> 225   TIME_PERIOD          Time period       2024-02-23
#> 226   TIME_PERIOD          Time period       2024-08-23
#> 227   TIME_PERIOD          Time period       2024-06-23
#> 228   TIME_PERIOD          Time period       2024-04-28
#> 229   TIME_PERIOD          Time period       2024-08-24
#> 230   TIME_PERIOD          Time period       2024-02-24
#> 231   TIME_PERIOD          Time period       2024-06-24
#> 232   TIME_PERIOD          Time period       2024-08-25
#> 233   TIME_PERIOD          Time period       2024-10-31
#> 234   TIME_PERIOD          Time period       2024-04-29
#> 235   TIME_PERIOD          Time period       2024-11-01
#> 236   TIME_PERIOD          Time period       2024-06-25
#> 237   TIME_PERIOD          Time period       2024-02-25
#> 238   TIME_PERIOD          Time period       2024-08-26
#> 239   TIME_PERIOD          Time period       2024-02-26
#> 240   TIME_PERIOD          Time period       2024-06-26
#> 241   TIME_PERIOD          Time period       2024-11-02
#> 242   TIME_PERIOD          Time period       2024-04-30
#> 243   TIME_PERIOD          Time period       2024-08-27
#> 244   TIME_PERIOD          Time period       2024-02-27
#> 245   TIME_PERIOD          Time period       2024-06-27
#> 246   TIME_PERIOD          Time period       2024-08-28
#> 247   TIME_PERIOD          Time period       2024-02-28
#> 248   TIME_PERIOD          Time period       2024-05-01
#> 249   TIME_PERIOD          Time period       2024-06-28
#> 250   TIME_PERIOD          Time period       2024-08-29
#> 251   TIME_PERIOD          Time period       2024-11-03
#> 252   TIME_PERIOD          Time period       2024-05-02
#> 253   TIME_PERIOD          Time period       2024-02-29
#> 254   TIME_PERIOD          Time period       2024-06-29
#> 255   TIME_PERIOD          Time period       2024-08-30
#> 256   TIME_PERIOD          Time period       2024-03-01
#> 257   TIME_PERIOD          Time period       2024-11-04
#> 258   TIME_PERIOD          Time period       2024-05-03
#> 259   TIME_PERIOD          Time period       2024-08-31
#> 260   TIME_PERIOD          Time period       2024-06-30
#> 261   TIME_PERIOD          Time period       2024-03-02
#> 262   TIME_PERIOD          Time period       2024-07-01
#> 263   TIME_PERIOD          Time period       2024-09-01
#> 264   TIME_PERIOD          Time period       2024-05-04
#> 265   TIME_PERIOD          Time period       2024-07-02
#> 266   TIME_PERIOD          Time period       2024-11-05
#> 267   TIME_PERIOD          Time period       2024-05-05
#> 268   TIME_PERIOD          Time period       2024-03-03
#> 269   TIME_PERIOD          Time period       2024-07-03
#> 270   TIME_PERIOD          Time period       2024-09-02
#> 271   TIME_PERIOD          Time period       2024-11-06
#> 272   TIME_PERIOD          Time period       2024-09-03
#> 273   TIME_PERIOD          Time period       2024-03-04
#> 274   TIME_PERIOD          Time period       2024-05-06
#> 275   TIME_PERIOD          Time period       2024-07-04
#> 276   TIME_PERIOD          Time period       2024-11-07
#> 277   TIME_PERIOD          Time period       2024-03-05
#> 278   TIME_PERIOD          Time period       2024-05-07
#> 279   TIME_PERIOD          Time period       2024-09-04
#> 280   TIME_PERIOD          Time period       2024-07-05
#> 281   TIME_PERIOD          Time period       2024-11-08
#> 282   TIME_PERIOD          Time period       2025-01-15
#> 283   TIME_PERIOD          Time period       2024-07-06
#> 284   TIME_PERIOD          Time period       2024-05-08
#> 285   TIME_PERIOD          Time period       2024-09-05
#> 286   TIME_PERIOD          Time period       2024-03-06
#> 287   TIME_PERIOD          Time period       2024-07-07
#> 288   TIME_PERIOD          Time period       2024-09-06
#> 289   TIME_PERIOD          Time period       2024-11-09
#> 290   TIME_PERIOD          Time period       2025-01-16
#> 291   TIME_PERIOD          Time period       2024-05-09
#> 292   TIME_PERIOD          Time period       2024-09-07
#> 293   TIME_PERIOD          Time period       2024-07-08
#> 294   TIME_PERIOD          Time period       2024-11-10
#> 295   TIME_PERIOD          Time period       2025-01-17
#> 296   TIME_PERIOD          Time period       2024-07-09
#> 297   TIME_PERIOD          Time period       2024-03-07
#> 298   TIME_PERIOD          Time period       2024-05-10
#> 299   TIME_PERIOD          Time period       2024-09-08
#> 300   TIME_PERIOD          Time period       2025-01-18
#> 301   TIME_PERIOD          Time period       2024-07-10
#> 302   TIME_PERIOD          Time period       2024-03-08
#> 303   TIME_PERIOD          Time period       2024-11-11
#> 304   TIME_PERIOD          Time period       2024-05-11
#> 305   TIME_PERIOD          Time period       2024-09-09
#> 306   TIME_PERIOD          Time period       2025-01-19
#> 307   TIME_PERIOD          Time period       2024-07-11
#> 308   TIME_PERIOD          Time period       2024-03-09
#> 309   TIME_PERIOD          Time period       2024-11-12
#> 310   TIME_PERIOD          Time period       2025-01-20
#> 311   TIME_PERIOD          Time period       2024-07-12
#> 312   TIME_PERIOD          Time period       2024-09-10
#> 313   TIME_PERIOD          Time period       2024-05-12
#> 314   TIME_PERIOD          Time period       2024-09-11
#> 315   TIME_PERIOD          Time period       2025-01-21
#> 316   TIME_PERIOD          Time period       2024-03-10
#> 317   TIME_PERIOD          Time period       2024-07-13
#> 318   TIME_PERIOD          Time period       2024-05-13
#> 319   TIME_PERIOD          Time period       2024-11-13
#> 320   TIME_PERIOD          Time period       2024-05-14
#> 321   TIME_PERIOD          Time period       2024-03-11
#> 322   TIME_PERIOD          Time period       2025-01-22
#> 323   TIME_PERIOD          Time period       2024-07-14
#> 324   TIME_PERIOD          Time period       2024-09-12
#> 325   TIME_PERIOD          Time period       2025-01-23
#> 326   TIME_PERIOD          Time period       2024-05-15
#> 327   TIME_PERIOD          Time period       2024-03-12
#> 328   TIME_PERIOD          Time period       2024-11-14
#> 329   TIME_PERIOD          Time period       2024-07-15
#> 330   TIME_PERIOD          Time period       2025-01-24
#> 331   TIME_PERIOD          Time period       2024-09-13
#> 332   TIME_PERIOD          Time period       2024-05-16
#> 333   TIME_PERIOD          Time period       2024-07-16
#> 334   TIME_PERIOD          Time period       2024-03-13
#> 335   TIME_PERIOD          Time period       2025-01-25
#> 336   TIME_PERIOD          Time period       2024-11-15
#> 337   TIME_PERIOD          Time period       2024-07-17
#> 338   TIME_PERIOD          Time period       2024-09-14
#> 339   TIME_PERIOD          Time period       2024-05-17
#> 340   TIME_PERIOD          Time period       2024-11-16
#> 341   TIME_PERIOD          Time period       2025-04-04
#> 342   TIME_PERIOD          Time period       2024-07-18
#> 343   TIME_PERIOD          Time period       2025-01-26
#> 344   TIME_PERIOD          Time period       2024-05-18
#> 345   TIME_PERIOD          Time period       2024-11-17
#> 346   TIME_PERIOD          Time period       2025-04-05
#> 347   TIME_PERIOD          Time period       2024-09-15
#> 348   TIME_PERIOD          Time period       2024-07-19
#> 349   TIME_PERIOD          Time period       2024-05-19
#> 350   TIME_PERIOD          Time period       2025-01-27
#> 351   TIME_PERIOD          Time period       2025-04-06
#> 352   TIME_PERIOD          Time period       2024-07-20
#> 353   TIME_PERIOD          Time period       2024-11-18
#> 354   TIME_PERIOD          Time period       2024-05-20
#> 355   TIME_PERIOD          Time period       2025-01-28
#> 356   TIME_PERIOD          Time period       2024-09-16
#> 357   TIME_PERIOD          Time period       2025-04-07
#> 358   TIME_PERIOD          Time period       2024-07-21
#> 359   TIME_PERIOD          Time period       2024-05-21
#> 360   TIME_PERIOD          Time period       2025-01-29
#> 361   TIME_PERIOD          Time period       2024-07-22
#> 362   TIME_PERIOD          Time period       2024-09-17
#> 363   TIME_PERIOD          Time period       2024-11-19
#> 364   TIME_PERIOD          Time period       2024-05-22
#> 365   TIME_PERIOD          Time period       2025-04-08
#> 366   TIME_PERIOD          Time period       2024-07-23
#> 367   TIME_PERIOD          Time period       2024-09-18
#> 368   TIME_PERIOD          Time period       2025-01-30
#> 369   TIME_PERIOD          Time period       2024-05-23
#> 370   TIME_PERIOD          Time period       2025-04-09
#> 371   TIME_PERIOD          Time period       2024-11-20
#> 372   TIME_PERIOD          Time period       2024-07-24
#> 373   TIME_PERIOD          Time period       2025-04-10
#> 374   TIME_PERIOD          Time period       2024-05-24
#> 375   TIME_PERIOD          Time period       2024-09-19
#> 376   TIME_PERIOD          Time period       2024-07-25
#> 377   TIME_PERIOD          Time period       2024-05-25
#> 378   TIME_PERIOD          Time period       2024-11-21
#> 379   TIME_PERIOD          Time period       2025-01-31
#> 380   TIME_PERIOD          Time period       2024-09-20
#> 381   TIME_PERIOD          Time period       2025-04-11
#> 382   TIME_PERIOD          Time period       2024-05-26
#> 383   TIME_PERIOD          Time period       2025-02-01
#> 384   TIME_PERIOD          Time period       2024-09-21
#> 385   TIME_PERIOD          Time period       2025-02-02
#> 386   TIME_PERIOD          Time period       2024-05-27
#> 387   TIME_PERIOD          Time period       2025-04-12
#> 388   TIME_PERIOD          Time period       2024-09-22
#> 389   TIME_PERIOD          Time period       2025-02-03
#> 390   TIME_PERIOD          Time period       2024-05-28
#> 391   TIME_PERIOD          Time period       2025-02-04
#> 392   TIME_PERIOD          Time period       2024-09-23
#> 393   TIME_PERIOD          Time period       2025-04-13
#> 394   TIME_PERIOD          Time period       2024-05-29
#> 395   TIME_PERIOD          Time period       2025-02-05
#> 396   TIME_PERIOD          Time period       2024-09-24
#> 397   TIME_PERIOD          Time period       2025-04-14
#> 398   TIME_PERIOD          Time period       2024-05-30
#> 399   TIME_PERIOD          Time period       2025-02-06
#> 400   TIME_PERIOD          Time period       2024-09-25
#> 401   TIME_PERIOD          Time period       2025-04-15
#> 402   TIME_PERIOD          Time period       2024-05-31
#> 403   TIME_PERIOD          Time period       2025-02-07
#> 404   TIME_PERIOD          Time period       2025-04-16
#> 405   TIME_PERIOD          Time period       2024-09-26
#> 406   TIME_PERIOD          Time period       2025-02-08
#> 407   TIME_PERIOD          Time period       2025-04-17
#> 408   TIME_PERIOD          Time period       2024-11-22
#> 409   TIME_PERIOD          Time period       2024-09-27
#> 410   TIME_PERIOD          Time period       2024-07-26
#> 411   TIME_PERIOD          Time period       2025-04-18
#> 412   TIME_PERIOD          Time period       2025-02-09
#> 413   TIME_PERIOD          Time period       2024-09-28
#> 414   TIME_PERIOD          Time period       2024-11-23
#> 415   TIME_PERIOD          Time period       2024-07-27
#> 416   TIME_PERIOD          Time period       2025-04-19
#> 417   TIME_PERIOD          Time period       2024-11-24
#> 418   TIME_PERIOD          Time period       2024-07-28
#> 419   TIME_PERIOD          Time period       2025-02-10
#> 420   TIME_PERIOD          Time period       2024-09-29
#> 421   TIME_PERIOD          Time period       2024-07-29
#> 422   TIME_PERIOD          Time period       2025-04-20
#> 423   TIME_PERIOD          Time period       2025-02-11
#> 424   TIME_PERIOD          Time period       2024-07-30
#> 425   TIME_PERIOD          Time period       2024-09-30
#> 426   TIME_PERIOD          Time period       2024-11-25
#> 427   TIME_PERIOD          Time period       2025-04-21
#> 428   TIME_PERIOD          Time period       2024-07-31
#> 429   TIME_PERIOD          Time period       2024-11-26
#> 430   TIME_PERIOD          Time period       2025-06-23
#> 431   TIME_PERIOD          Time period       2025-04-22
#> 432   TIME_PERIOD          Time period       2024-08-01
#> 433   TIME_PERIOD          Time period       2024-11-27
#> 434   TIME_PERIOD          Time period       2025-06-24
#> 435   TIME_PERIOD          Time period       2025-04-23
#> 436   TIME_PERIOD          Time period       2024-10-01
#> 437   TIME_PERIOD          Time period       2024-11-28
#> 438   TIME_PERIOD          Time period       2024-08-02
#> 439   TIME_PERIOD          Time period       2025-04-24
#> 440   TIME_PERIOD          Time period       2024-10-02
#> 441   TIME_PERIOD          Time period       2025-06-25
#> 442   TIME_PERIOD          Time period       2024-08-03
#> 443   TIME_PERIOD          Time period       2025-06-26
#> 444   TIME_PERIOD          Time period       2024-11-29
#> 445   TIME_PERIOD          Time period       2024-10-03
#> 446   TIME_PERIOD          Time period       2025-04-25
#> 447   TIME_PERIOD          Time period       2024-08-04
#> 448   TIME_PERIOD          Time period       2024-10-04
#> 449   TIME_PERIOD          Time period       2025-06-27
#> 450   TIME_PERIOD          Time period       2025-04-26
#> 451   TIME_PERIOD          Time period       2024-08-05
#> 452   TIME_PERIOD          Time period       2024-11-30
#> 453   TIME_PERIOD          Time period       2025-04-27
#> 454   TIME_PERIOD          Time period       2024-08-06
#> 455   TIME_PERIOD          Time period       2025-06-28
#> 456   TIME_PERIOD          Time period       2024-12-01
#> 457   TIME_PERIOD          Time period       2025-04-28
#> 458   TIME_PERIOD          Time period       2024-08-07
#> 459   TIME_PERIOD          Time period       2024-10-05
#> 460   TIME_PERIOD          Time period       2025-06-29
#> 461   TIME_PERIOD          Time period       2024-12-02
#> 462   TIME_PERIOD          Time period       2024-08-08
#> 463   TIME_PERIOD          Time period       2025-04-29
#> 464   TIME_PERIOD          Time period       2025-02-12
#> 465   TIME_PERIOD          Time period       2024-10-06
#> 466   TIME_PERIOD          Time period       2025-06-30
#> 467   TIME_PERIOD          Time period       2024-10-07
#> 468   TIME_PERIOD          Time period       2024-12-03
#> 469   TIME_PERIOD          Time period       2025-04-30
#> 470   TIME_PERIOD          Time period       2025-09-10
#> 471   TIME_PERIOD          Time period       2025-07-01
#> 472   TIME_PERIOD          Time period       2024-08-09
#> 473   TIME_PERIOD          Time period       2025-02-13
#> 474   TIME_PERIOD          Time period       2024-10-08
#> 475   TIME_PERIOD          Time period       2025-09-11
#> 476   TIME_PERIOD          Time period       2024-10-09
#> 477   TIME_PERIOD          Time period       2025-05-01
#> 478   TIME_PERIOD          Time period       2024-12-04
#> 479   TIME_PERIOD          Time period       2024-08-10
#> 480   TIME_PERIOD          Time period       2025-07-02
#> 481   TIME_PERIOD          Time period       2025-02-14
#> 482   TIME_PERIOD          Time period       2024-10-10
#> 483   TIME_PERIOD          Time period       2025-09-12
#> 484   TIME_PERIOD          Time period       2025-05-02
#> 485   TIME_PERIOD          Time period       2024-08-11
#> 486   TIME_PERIOD          Time period       2025-07-03
#> 487   TIME_PERIOD          Time period       2025-02-15
#> 488   TIME_PERIOD          Time period       2024-12-05
#> 489   TIME_PERIOD          Time period       2024-10-11
#> 490   TIME_PERIOD          Time period       2025-05-03
#> 491   TIME_PERIOD          Time period       2024-08-12
#> 492   TIME_PERIOD          Time period       2025-09-13
#> 493   TIME_PERIOD          Time period       2025-07-04
#> 494   TIME_PERIOD          Time period       2024-10-12
#> 495   TIME_PERIOD          Time period       2025-02-16
#> 496   TIME_PERIOD          Time period       2025-05-04
#> 497   TIME_PERIOD          Time period       2024-12-06
#> 498   TIME_PERIOD          Time period       2024-10-13
#> 499   TIME_PERIOD          Time period       2025-09-14
#> 500   TIME_PERIOD          Time period       2024-08-13
#> 501   TIME_PERIOD          Time period       2025-05-05
#> 502   TIME_PERIOD          Time period       2024-12-07
#> 503   TIME_PERIOD          Time period       2025-07-05
#> 504   TIME_PERIOD          Time period       2024-10-14
#> 505   TIME_PERIOD          Time period       2024-08-14
#> 506   TIME_PERIOD          Time period       2024-12-08
#> 507   TIME_PERIOD          Time period       2025-05-06
#> 508   TIME_PERIOD          Time period       2025-09-15
#> 509   TIME_PERIOD          Time period       2024-10-15
#> 510   TIME_PERIOD          Time period       2025-07-06
#> 511   TIME_PERIOD          Time period       2025-05-07
#> 512   TIME_PERIOD          Time period       2024-12-09
#> 513   TIME_PERIOD          Time period       2024-10-16
#> 514   TIME_PERIOD          Time period       2025-09-16
#> 515   TIME_PERIOD          Time period       2025-05-08
#> 516   TIME_PERIOD          Time period       2024-10-17
#> 517   TIME_PERIOD          Time period       2025-07-07
#> 518   TIME_PERIOD          Time period       2024-12-10
#> 519   TIME_PERIOD          Time period       2024-10-18
#> 520   TIME_PERIOD          Time period       2024-12-11
#> 521   TIME_PERIOD          Time period       2025-05-09
#> 522   TIME_PERIOD          Time period       2024-10-19
#> 523   TIME_PERIOD          Time period       2025-09-17
#> 524   TIME_PERIOD          Time period       2025-07-08
#> 525   TIME_PERIOD          Time period       2025-05-10
#> 526   TIME_PERIOD          Time period       2024-12-12
#> 527   TIME_PERIOD          Time period       2024-10-20
#> 528   TIME_PERIOD          Time period       2025-05-11
#> 529   TIME_PERIOD          Time period       2025-07-09
#> 530   TIME_PERIOD          Time period       2024-12-13
#> 531   TIME_PERIOD          Time period       2025-02-17
#> 532   TIME_PERIOD          Time period       2025-05-12
#> 533   TIME_PERIOD          Time period       2024-10-21
#> 534   TIME_PERIOD          Time period       2025-09-18
#> 535   TIME_PERIOD          Time period       2025-05-13
#> 536   TIME_PERIOD          Time period       2024-10-22
#> 537   TIME_PERIOD          Time period       2025-02-18
#> 538   TIME_PERIOD          Time period       2025-07-10
#> 539   TIME_PERIOD          Time period       2024-12-14
#> 540   TIME_PERIOD          Time period       2025-05-14
#> 541   TIME_PERIOD          Time period       2024-10-23
#> 542   TIME_PERIOD          Time period       2025-07-11
#> 543   TIME_PERIOD          Time period       2024-12-15
#> 544   TIME_PERIOD          Time period       2025-05-15
#> 545   TIME_PERIOD          Time period       2025-02-19
#> 546   TIME_PERIOD          Time period       2024-10-24
#> 547   TIME_PERIOD          Time period       2025-07-12
#> 548   TIME_PERIOD          Time period       2025-09-19
#> 549   TIME_PERIOD          Time period       2024-12-16
#> 550   TIME_PERIOD          Time period       2025-05-16
#> 551   TIME_PERIOD          Time period       2025-02-20
#> 552   TIME_PERIOD          Time period       2025-07-13
#> 553   TIME_PERIOD          Time period       2025-05-17
#> 554   TIME_PERIOD          Time period       2024-10-25
#> 555   TIME_PERIOD          Time period       2024-12-17
#> 556   TIME_PERIOD          Time period       2025-05-18
#> 557   TIME_PERIOD          Time period       2025-02-21
#> 558   TIME_PERIOD          Time period       2024-12-18
#> 559   TIME_PERIOD          Time period       2025-05-19
#> 560   TIME_PERIOD          Time period       2025-09-20
#> 561   TIME_PERIOD          Time period       2025-02-22
#> 562   TIME_PERIOD          Time period       2024-10-26
#> 563   TIME_PERIOD          Time period       2025-05-20
#> 564   TIME_PERIOD          Time period       2024-12-19
#> 565   TIME_PERIOD          Time period       2025-02-23
#> 566   TIME_PERIOD          Time period       2025-07-14
#> 567   TIME_PERIOD          Time period       2024-10-27
#> 568   TIME_PERIOD          Time period       2025-05-21
#> 569   TIME_PERIOD          Time period       2024-12-20
#> 570   TIME_PERIOD          Time period       2025-02-24
#> 571   TIME_PERIOD          Time period       2025-09-21
#> 572   TIME_PERIOD          Time period       2025-07-15
#> 573   TIME_PERIOD          Time period       2025-05-22
#> 574   TIME_PERIOD          Time period       2024-12-21
#> 575   TIME_PERIOD          Time period       2024-10-28
#> 576   TIME_PERIOD          Time period       2025-02-25
#> 577   TIME_PERIOD          Time period       2025-07-16
#> 578   TIME_PERIOD          Time period       2025-05-23
#> 579   TIME_PERIOD          Time period       2024-12-22
#> 580   TIME_PERIOD          Time period       2025-09-22
#> 581   TIME_PERIOD          Time period       2025-02-26
#> 582   TIME_PERIOD          Time period       2025-05-24
#> 583   TIME_PERIOD          Time period       2024-10-29
#> 584   TIME_PERIOD          Time period       2024-12-23
#> 585   TIME_PERIOD          Time period       2025-09-23
#> 586   TIME_PERIOD          Time period       2025-05-25
#> 587   TIME_PERIOD          Time period       2025-07-17
#> 588   TIME_PERIOD          Time period       2025-02-27
#> 589   TIME_PERIOD          Time period       2025-05-26
#> 590   TIME_PERIOD          Time period       2024-10-30
#> 591   TIME_PERIOD          Time period       2024-12-24
#> 592   TIME_PERIOD          Time period       2025-09-24
#> 593   TIME_PERIOD          Time period       2025-05-27
#> 594   TIME_PERIOD          Time period       2025-02-28
#> 595   TIME_PERIOD          Time period       2025-07-18
#> 596   TIME_PERIOD          Time period       2024-12-25
#> 597   TIME_PERIOD          Time period       2025-05-28
#> 598   TIME_PERIOD          Time period       2025-09-25
#> 599   TIME_PERIOD          Time period       2025-03-01
#> 600   TIME_PERIOD          Time period       2025-07-19
#> 601   TIME_PERIOD          Time period       2024-12-26
#> 602   TIME_PERIOD          Time period       2025-07-20
#> 603   TIME_PERIOD          Time period       2025-09-26
#> 604   TIME_PERIOD          Time period       2024-12-27
#> 605   TIME_PERIOD          Time period       2025-03-02
#> 606   TIME_PERIOD          Time period       2025-05-29
#> 607   TIME_PERIOD          Time period       2025-09-27
#> 608   TIME_PERIOD          Time period       2025-03-03
#> 609   TIME_PERIOD          Time period       2024-12-28
#> 610   TIME_PERIOD          Time period       2025-07-21
#> 611   TIME_PERIOD          Time period       2025-05-30
#> 612   TIME_PERIOD          Time period       2025-09-28
#> 613   TIME_PERIOD          Time period       2024-12-29
#> 614   TIME_PERIOD          Time period       2025-03-04
#> 615   TIME_PERIOD          Time period       2025-05-31
#> 616   TIME_PERIOD          Time period       2025-07-22
#> 617   TIME_PERIOD          Time period       2025-03-05
#> 618   TIME_PERIOD          Time period       2025-09-29
#> 619   TIME_PERIOD          Time period       2024-12-30
#> 620   TIME_PERIOD          Time period       2025-09-30
#> 621   TIME_PERIOD          Time period       2025-06-01
#> 622   TIME_PERIOD          Time period       2025-07-23
#> 623   TIME_PERIOD          Time period       2025-03-06
#> 624   TIME_PERIOD          Time period       2025-06-02
#> 625   TIME_PERIOD          Time period       2025-10-01
#> 626   TIME_PERIOD          Time period       2024-12-31
#> 627   TIME_PERIOD          Time period       2025-03-07
#> 628   TIME_PERIOD          Time period       2025-10-02
#> 629   TIME_PERIOD          Time period       2025-06-03
#> 630   TIME_PERIOD          Time period       2025-07-24
#> 631   TIME_PERIOD          Time period       2025-10-03
#> 632   TIME_PERIOD          Time period       2025-01-01
#> 633   TIME_PERIOD          Time period       2025-03-08
#> 634   TIME_PERIOD          Time period       2025-10-04
#> 635   TIME_PERIOD          Time period       2025-06-04
#> 636   TIME_PERIOD          Time period       2025-07-25
#> 637   TIME_PERIOD          Time period       2025-01-02
#> 638   TIME_PERIOD          Time period       2025-10-05
#> 639   TIME_PERIOD          Time period       2025-03-09
#> 640   TIME_PERIOD          Time period       2025-06-05
#> 641   TIME_PERIOD          Time period       2025-10-06
#> 642   TIME_PERIOD          Time period       2025-01-03
#> 643   TIME_PERIOD          Time period       2025-07-26
#> 644   TIME_PERIOD          Time period       2025-06-06
#> 645   TIME_PERIOD          Time period       2025-03-10
#> 646   TIME_PERIOD          Time period       2025-10-07
#> 647   TIME_PERIOD          Time period       2025-01-04
#> 648   TIME_PERIOD          Time period       2025-07-27
#> 649   TIME_PERIOD          Time period       2025-06-07
#> 650   TIME_PERIOD          Time period       2025-03-11
#> 651   TIME_PERIOD          Time period       2025-10-08
#> 652   TIME_PERIOD          Time period       2025-01-05
#> 653   TIME_PERIOD          Time period       2025-03-12
#> 654   TIME_PERIOD          Time period       2025-10-09
#> 655   TIME_PERIOD          Time period       2025-07-28
#> 656   TIME_PERIOD          Time period       2025-06-08
#> 657   TIME_PERIOD          Time period       2025-01-06
#> 658   TIME_PERIOD          Time period       2025-03-13
#> 659   TIME_PERIOD          Time period       2025-10-10
#> 660   TIME_PERIOD          Time period       2025-06-09
#> 661   TIME_PERIOD          Time period       2025-10-11
#> 662   TIME_PERIOD          Time period       2025-03-14
#> 663   TIME_PERIOD          Time period       2025-07-29
#> 664   TIME_PERIOD          Time period       2025-06-10
#> 665   TIME_PERIOD          Time period       2025-01-07
#> 666   TIME_PERIOD          Time period       2025-10-12
#> 667   TIME_PERIOD          Time period       2025-01-08
#> 668   TIME_PERIOD          Time period       2025-06-11
#> 669   TIME_PERIOD          Time period       2025-03-15
#> 670   TIME_PERIOD          Time period       2025-07-30
#> 671   TIME_PERIOD          Time period       2025-10-13
#> 672   TIME_PERIOD          Time period       2025-01-09
#> 673   TIME_PERIOD          Time period       2025-06-12
#> 674   TIME_PERIOD          Time period       2025-10-14
#> 675   TIME_PERIOD          Time period       2025-03-16
#> 676   TIME_PERIOD          Time period       2025-07-31
#> 677   TIME_PERIOD          Time period       2025-06-13
#> 678   TIME_PERIOD          Time period       2025-01-10
#> 679   TIME_PERIOD          Time period       2025-10-15
#> 680   TIME_PERIOD          Time period       2025-06-14
#> 681   TIME_PERIOD          Time period       2025-08-01
#> 682   TIME_PERIOD          Time period       2025-01-11
#> 683   TIME_PERIOD          Time period       2025-03-17
#> 684   TIME_PERIOD          Time period       2025-06-15
#> 685   TIME_PERIOD          Time period       2025-10-16
#> 686   TIME_PERIOD          Time period       2025-01-12
#> 687   TIME_PERIOD          Time period       2025-08-02
#> 688   TIME_PERIOD          Time period       2025-10-17
#> 689   TIME_PERIOD          Time period       2025-06-16
#> 690   TIME_PERIOD          Time period       2025-03-18
#> 691   TIME_PERIOD          Time period       2025-01-13
#> 692   TIME_PERIOD          Time period       2025-06-17
#> 693   TIME_PERIOD          Time period       2025-10-18
#> 694   TIME_PERIOD          Time period       2025-08-03
#> 695   TIME_PERIOD          Time period       2025-01-14
#> 696   TIME_PERIOD          Time period       2025-03-19
#> 697   TIME_PERIOD          Time period       2025-10-19
#> 698   TIME_PERIOD          Time period       2025-06-18
#> 699   TIME_PERIOD          Time period       2025-08-04
#> 700   TIME_PERIOD          Time period       2025-03-20
#> 701   TIME_PERIOD          Time period       2025-10-20
#> 702   TIME_PERIOD          Time period       2025-08-05
#> 703   TIME_PERIOD          Time period       2025-06-19
#> 704   TIME_PERIOD          Time period       2025-10-21
#> 705   TIME_PERIOD          Time period       2025-03-21
#> 706   TIME_PERIOD          Time period       2025-08-06
#> 707   TIME_PERIOD          Time period       2025-06-20
#> 708   TIME_PERIOD          Time period       2025-10-22
#> 709   TIME_PERIOD          Time period       2025-03-22
#> 710   TIME_PERIOD          Time period       2025-08-07
#> 711   TIME_PERIOD          Time period       2025-10-23
#> 712   TIME_PERIOD          Time period       2025-03-23
#> 713   TIME_PERIOD          Time period       2025-06-21
#> 714   TIME_PERIOD          Time period       2025-03-24
#> 715   TIME_PERIOD          Time period       2025-10-24
#> 716   TIME_PERIOD          Time period       2025-03-25
#> 717   TIME_PERIOD          Time period       2025-03-26
#> 718   TIME_PERIOD          Time period       2025-10-25
#> 719   TIME_PERIOD          Time period       2025-03-27
#> 720   TIME_PERIOD          Time period       2025-10-26
#> 721   TIME_PERIOD          Time period       2025-03-28
#> 722   TIME_PERIOD          Time period       2025-10-27
#> 723   TIME_PERIOD          Time period       2025-10-28
#> 724   TIME_PERIOD          Time period       2025-06-22
#> 725   TIME_PERIOD          Time period       2025-03-29
#> 726   TIME_PERIOD          Time period       2025-08-08
#> 727   TIME_PERIOD          Time period       2025-03-30
#> 728   TIME_PERIOD          Time period       2025-10-29
#> 729   TIME_PERIOD          Time period       2025-03-31
#> 730   TIME_PERIOD          Time period       2025-08-09
#> 731   TIME_PERIOD          Time period       2025-10-30
#> 732   TIME_PERIOD          Time period       2025-04-01
#> 733   TIME_PERIOD          Time period       2025-08-10
#> 734   TIME_PERIOD          Time period       2025-10-31
#> 735   TIME_PERIOD          Time period       2025-08-11
#> 736   TIME_PERIOD          Time period       2025-08-12
#> 737   TIME_PERIOD          Time period       2025-08-13
#> 738   TIME_PERIOD          Time period       2025-04-02
#> 739   TIME_PERIOD          Time period       2025-04-03
#> 740   TIME_PERIOD          Time period       2025-08-14
#> 741   TIME_PERIOD          Time period       2025-08-15
#> 742   TIME_PERIOD          Time period       2025-08-16
#> 743   TIME_PERIOD          Time period       2025-08-17
#> 744   TIME_PERIOD          Time period       2025-08-18
#> 745   TIME_PERIOD          Time period       2025-08-19
#> 746   TIME_PERIOD          Time period       2025-08-20
#> 747   TIME_PERIOD          Time period       2025-08-21
#> 748   TIME_PERIOD          Time period       2025-08-22
#> 749   TIME_PERIOD          Time period       2025-08-23
#> 750   TIME_PERIOD          Time period       2025-08-24
#> 751   TIME_PERIOD          Time period       2025-08-25
#> 752   TIME_PERIOD          Time period       2025-08-26
#> 753   TIME_PERIOD          Time period       2025-08-27
#> 754   TIME_PERIOD          Time period       2025-08-28
#> 755   TIME_PERIOD          Time period       2025-08-29
#> 756   TIME_PERIOD          Time period       2025-08-30
#> 757   TIME_PERIOD          Time period       2025-08-31
#> 758   TIME_PERIOD          Time period       2025-09-01
#> 759   TIME_PERIOD          Time period       2025-09-02
#> 760   TIME_PERIOD          Time period       2025-09-03
#> 761   TIME_PERIOD          Time period       2025-09-04
#> 762   TIME_PERIOD          Time period       2025-09-05
#> 763   TIME_PERIOD          Time period       2025-09-06
#> 764   TIME_PERIOD          Time period       2025-09-07
#> 765   TIME_PERIOD          Time period       2025-09-08
#> 766   TIME_PERIOD          Time period       2025-09-09
#> 767   TIME_PERIOD          Time period             2025
#> 768           AGE                  Age           Y_GE85
#> 769           AGE                  Age           Y_LT25
#> 770           AGE                  Age           Y25T49
#> 771           AGE                  Age           Y50T64
#> 772           AGE                  Age           Y65T74
#> 773           AGE                  Age           Y75T84
#> 774           AGE                  Age               _T
#> 775       MEASURE              Measure OBS_VALUE_NIVEAU
#> 776 OBS_STATUS_FR              Version                D
#> 777 OBS_STATUS_FR              Version             PROV
#>                                                                 MOD_LABEL
#> 1                                                       Number of deaths 
#> 2     Number of deaths from January 1st to the end of the reference month
#> 3               Average number of deaths per day over the past seven days
#> 4                                        Average number of deaths per day
#> 5                                                                  Female
#> 6                                                                    Male
#> 7                                                                   Total
#> 8                                                                  Annual
#> 9                                                                 Monthly
#> 10                                                                  Daily
#> 11                                                           Public place
#> 12                                       Other place or unknown location 
#> 13                                                                   Home
#> 14                                                    Healthcare facility
#> 15  Long-term care facility for dependent elderly people, retirement home
#> 16                                                                  Total
#> 17                                                                   2024
#> 18                                                                   2018
#> 19                                                                   2019
#> 20                                                                   2015
#> 21                                                                   2020
#> 22                                                                   2023
#> 23                                                                   2016
#> 24                                                                2024-01
#> 25                                                                2024-02
#> 26                                                                2024-03
#> 27                                                                2024-04
#> 28                                                                2024-05
#> 29                                                                2024-06
#> 30                                                                2024-07
#> 31                                                                2024-08
#> 32                                                                2024-09
#> 33                                                                2024-10
#> 34                                                                2024-11
#> 35                                                                2024-12
#> 36                                                                2025-01
#> 37                                                                2025-02
#> 38                                                                2025-03
#> 39                                                                2025-04
#> 40                                                                2025-05
#> 41                                                                2025-06
#> 42                                                                2025-07
#> 43                                                                2025-08
#> 44                                                                2025-09
#> 45                                                                2025-10
#> 46                                                                   2017
#> 47                                                                   2021
#> 48                                                                   2022
#> 49                                                                2020-09
#> 50                                                                2020-10
#> 51                                                                2020-11
#> 52                                                                2020-12
#> 53                                                                2020-01
#> 54                                                                2020-02
#> 55                                                                2020-03
#> 56                                                                2020-04
#> 57                                                                2020-05
#> 58                                                                2020-06
#> 59                                                                2020-07
#> 60                                                                2020-08
#> 61                                                                2021-01
#> 62                                                                2021-02
#> 63                                                                2021-03
#> 64                                                                2021-04
#> 65                                                                2021-05
#> 66                                                                2021-06
#> 67                                                                2021-07
#> 68                                                                2021-08
#> 69                                                                2021-09
#> 70                                                                2021-10
#> 71                                                                2021-11
#> 72                                                                2021-12
#> 73                                                                2022-01
#> 74                                                                2022-02
#> 75                                                                2022-03
#> 76                                                                2022-04
#> 77                                                                2022-05
#> 78                                                                2022-06
#> 79                                                                2022-07
#> 80                                                                2022-08
#> 81                                                                2022-09
#> 82                                                                2022-10
#> 83                                                                2022-11
#> 84                                                                2022-12
#> 85                                                                2023-05
#> 86                                                                2023-06
#> 87                                                                2023-07
#> 88                                                                2023-08
#> 89                                                                2023-09
#> 90                                                                2023-10
#> 91                                                                2023-11
#> 92                                                                2023-12
#> 93                                                                2023-01
#> 94                                                                2023-02
#> 95                                                                2023-03
#> 96                                                                2023-04
#> 97                                                             2024-01-01
#> 98                                                             2024-01-02
#> 99                                                             2024-01-03
#> 100                                                            2024-01-04
#> 101                                                            2024-01-05
#> 102                                                            2024-01-06
#> 103                                                            2024-01-07
#> 104                                                            2024-01-08
#> 105                                                            2024-01-09
#> 106                                                            2024-03-14
#> 107                                                            2024-01-10
#> 108                                                            2024-03-15
#> 109                                                            2024-01-11
#> 110                                                            2024-03-16
#> 111                                                            2024-01-12
#> 112                                                            2024-01-13
#> 113                                                            2024-03-17
#> 114                                                            2024-01-14
#> 115                                                            2024-01-15
#> 116                                                            2024-03-18
#> 117                                                            2024-01-16
#> 118                                                            2024-03-19
#> 119                                                            2024-01-17
#> 120                                                            2024-03-20
#> 121                                                            2024-01-18
#> 122                                                            2024-03-21
#> 123                                                            2024-03-22
#> 124                                                            2024-01-19
#> 125                                                            2024-01-20
#> 126                                                            2024-03-23
#> 127                                                            2024-01-21
#> 128                                                            2024-03-24
#> 129                                                            2024-03-25
#> 130                                                            2024-03-26
#> 131                                                            2024-01-22
#> 132                                                            2024-03-27
#> 133                                                            2024-01-23
#> 134                                                            2024-03-28
#> 135                                                            2024-01-24
#> 136                                                            2024-03-29
#> 137                                                            2024-03-30
#> 138                                                            2024-01-25
#> 139                                                            2024-03-31
#> 140                                                            2024-01-26
#> 141                                                            2024-04-01
#> 142                                                            2024-01-27
#> 143                                                            2024-04-02
#> 144                                                            2024-01-28
#> 145                                                            2024-04-03
#> 146                                                            2024-01-29
#> 147                                                            2024-04-04
#> 148                                                            2024-01-30
#> 149                                                            2024-04-05
#> 150                                                            2024-04-06
#> 151                                                            2024-01-31
#> 152                                                            2024-02-01
#> 153                                                            2024-04-07
#> 154                                                            2024-02-02
#> 155                                                            2024-04-08
#> 156                                                            2024-06-01
#> 157                                                            2024-02-03
#> 158                                                            2024-04-09
#> 159                                                            2024-04-10
#> 160                                                            2024-06-02
#> 161                                                            2024-02-04
#> 162                                                            2024-06-03
#> 163                                                            2024-04-11
#> 164                                                            2024-02-05
#> 165                                                            2024-06-04
#> 166                                                            2024-04-12
#> 167                                                            2024-02-06
#> 168                                                            2024-06-05
#> 169                                                            2024-02-07
#> 170                                                            2024-04-13
#> 171                                                            2024-06-06
#> 172                                                            2024-02-08
#> 173                                                            2024-04-14
#> 174                                                            2024-06-07
#> 175                                                            2024-02-09
#> 176                                                            2024-04-15
#> 177                                                            2024-06-08
#> 178                                                            2024-02-10
#> 179                                                            2024-04-16
#> 180                                                            2024-06-09
#> 181                                                            2024-02-11
#> 182                                                            2024-04-17
#> 183                                                            2024-06-10
#> 184                                                            2024-02-12
#> 185                                                            2024-06-11
#> 186                                                            2024-02-13
#> 187                                                            2024-04-18
#> 188                                                            2024-06-12
#> 189                                                            2024-02-14
#> 190                                                            2024-08-15
#> 191                                                            2024-06-13
#> 192                                                            2024-04-19
#> 193                                                            2024-02-15
#> 194                                                            2024-08-16
#> 195                                                            2024-06-14
#> 196                                                            2024-04-20
#> 197                                                            2024-02-16
#> 198                                                            2024-08-17
#> 199                                                            2024-06-15
#> 200                                                            2024-04-21
#> 201                                                            2024-02-17
#> 202                                                            2024-08-18
#> 203                                                            2024-04-22
#> 204                                                            2024-06-16
#> 205                                                            2024-02-18
#> 206                                                            2024-06-17
#> 207                                                            2024-02-19
#> 208                                                            2024-08-19
#> 209                                                            2024-04-23
#> 210                                                            2024-06-18
#> 211                                                            2024-02-20
#> 212                                                            2024-06-19
#> 213                                                            2024-08-20
#> 214                                                            2024-04-24
#> 215                                                            2024-06-20
#> 216                                                            2024-08-21
#> 217                                                            2024-02-21
#> 218                                                            2024-04-25
#> 219                                                            2024-06-21
#> 220                                                            2024-02-22
#> 221                                                            2024-04-26
#> 222                                                            2024-08-22
#> 223                                                            2024-06-22
#> 224                                                            2024-04-27
#> 225                                                            2024-02-23
#> 226                                                            2024-08-23
#> 227                                                            2024-06-23
#> 228                                                            2024-04-28
#> 229                                                            2024-08-24
#> 230                                                            2024-02-24
#> 231                                                            2024-06-24
#> 232                                                            2024-08-25
#> 233                                                            2024-10-31
#> 234                                                            2024-04-29
#> 235                                                            2024-11-01
#> 236                                                            2024-06-25
#> 237                                                            2024-02-25
#> 238                                                            2024-08-26
#> 239                                                            2024-02-26
#> 240                                                            2024-06-26
#> 241                                                            2024-11-02
#> 242                                                            2024-04-30
#> 243                                                            2024-08-27
#> 244                                                            2024-02-27
#> 245                                                            2024-06-27
#> 246                                                            2024-08-28
#> 247                                                            2024-02-28
#> 248                                                            2024-05-01
#> 249                                                            2024-06-28
#> 250                                                            2024-08-29
#> 251                                                            2024-11-03
#> 252                                                            2024-05-02
#> 253                                                            2024-02-29
#> 254                                                            2024-06-29
#> 255                                                            2024-08-30
#> 256                                                            2024-03-01
#> 257                                                            2024-11-04
#> 258                                                            2024-05-03
#> 259                                                            2024-08-31
#> 260                                                            2024-06-30
#> 261                                                            2024-03-02
#> 262                                                            2024-07-01
#> 263                                                            2024-09-01
#> 264                                                            2024-05-04
#> 265                                                            2024-07-02
#> 266                                                            2024-11-05
#> 267                                                            2024-05-05
#> 268                                                            2024-03-03
#> 269                                                            2024-07-03
#> 270                                                            2024-09-02
#> 271                                                            2024-11-06
#> 272                                                            2024-09-03
#> 273                                                            2024-03-04
#> 274                                                            2024-05-06
#> 275                                                            2024-07-04
#> 276                                                            2024-11-07
#> 277                                                            2024-03-05
#> 278                                                            2024-05-07
#> 279                                                            2024-09-04
#> 280                                                            2024-07-05
#> 281                                                            2024-11-08
#> 282                                                            2025-01-15
#> 283                                                            2024-07-06
#> 284                                                            2024-05-08
#> 285                                                            2024-09-05
#> 286                                                            2024-03-06
#> 287                                                            2024-07-07
#> 288                                                            2024-09-06
#> 289                                                            2024-11-09
#> 290                                                            2025-01-16
#> 291                                                            2024-05-09
#> 292                                                            2024-09-07
#> 293                                                            2024-07-08
#> 294                                                            2024-11-10
#> 295                                                            2025-01-17
#> 296                                                            2024-07-09
#> 297                                                            2024-03-07
#> 298                                                            2024-05-10
#> 299                                                            2024-09-08
#> 300                                                            2025-01-18
#> 301                                                            2024-07-10
#> 302                                                            2024-03-08
#> 303                                                            2024-11-11
#> 304                                                            2024-05-11
#> 305                                                            2024-09-09
#> 306                                                            2025-01-19
#> 307                                                            2024-07-11
#> 308                                                            2024-03-09
#> 309                                                            2024-11-12
#> 310                                                            2025-01-20
#> 311                                                            2024-07-12
#> 312                                                            2024-09-10
#> 313                                                            2024-05-12
#> 314                                                            2024-09-11
#> 315                                                            2025-01-21
#> 316                                                            2024-03-10
#> 317                                                            2024-07-13
#> 318                                                            2024-05-13
#> 319                                                            2024-11-13
#> 320                                                            2024-05-14
#> 321                                                            2024-03-11
#> 322                                                            2025-01-22
#> 323                                                            2024-07-14
#> 324                                                            2024-09-12
#> 325                                                            2025-01-23
#> 326                                                            2024-05-15
#> 327                                                            2024-03-12
#> 328                                                            2024-11-14
#> 329                                                            2024-07-15
#> 330                                                            2025-01-24
#> 331                                                            2024-09-13
#> 332                                                            2024-05-16
#> 333                                                            2024-07-16
#> 334                                                            2024-03-13
#> 335                                                            2025-01-25
#> 336                                                            2024-11-15
#> 337                                                            2024-07-17
#> 338                                                            2024-09-14
#> 339                                                            2024-05-17
#> 340                                                            2024-11-16
#> 341                                                            2025-04-04
#> 342                                                            2024-07-18
#> 343                                                            2025-01-26
#> 344                                                            2024-05-18
#> 345                                                            2024-11-17
#> 346                                                            2025-04-05
#> 347                                                            2024-09-15
#> 348                                                            2024-07-19
#> 349                                                            2024-05-19
#> 350                                                            2025-01-27
#> 351                                                            2025-04-06
#> 352                                                            2024-07-20
#> 353                                                            2024-11-18
#> 354                                                            2024-05-20
#> 355                                                            2025-01-28
#> 356                                                            2024-09-16
#> 357                                                            2025-04-07
#> 358                                                            2024-07-21
#> 359                                                            2024-05-21
#> 360                                                            2025-01-29
#> 361                                                            2024-07-22
#> 362                                                            2024-09-17
#> 363                                                            2024-11-19
#> 364                                                            2024-05-22
#> 365                                                            2025-04-08
#> 366                                                            2024-07-23
#> 367                                                            2024-09-18
#> 368                                                            2025-01-30
#> 369                                                            2024-05-23
#> 370                                                            2025-04-09
#> 371                                                            2024-11-20
#> 372                                                            2024-07-24
#> 373                                                            2025-04-10
#> 374                                                            2024-05-24
#> 375                                                            2024-09-19
#> 376                                                            2024-07-25
#> 377                                                            2024-05-25
#> 378                                                            2024-11-21
#> 379                                                            2025-01-31
#> 380                                                            2024-09-20
#> 381                                                            2025-04-11
#> 382                                                            2024-05-26
#> 383                                                            2025-02-01
#> 384                                                            2024-09-21
#> 385                                                            2025-02-02
#> 386                                                            2024-05-27
#> 387                                                            2025-04-12
#> 388                                                            2024-09-22
#> 389                                                            2025-02-03
#> 390                                                            2024-05-28
#> 391                                                            2025-02-04
#> 392                                                            2024-09-23
#> 393                                                            2025-04-13
#> 394                                                            2024-05-29
#> 395                                                            2025-02-05
#> 396                                                            2024-09-24
#> 397                                                            2025-04-14
#> 398                                                            2024-05-30
#> 399                                                            2025-02-06
#> 400                                                            2024-09-25
#> 401                                                            2025-04-15
#> 402                                                            2024-05-31
#> 403                                                            2025-02-07
#> 404                                                            2025-04-16
#> 405                                                            2024-09-26
#> 406                                                            2025-02-08
#> 407                                                            2025-04-17
#> 408                                                            2024-11-22
#> 409                                                            2024-09-27
#> 410                                                            2024-07-26
#> 411                                                            2025-04-18
#> 412                                                            2025-02-09
#> 413                                                            2024-09-28
#> 414                                                            2024-11-23
#> 415                                                            2024-07-27
#> 416                                                            2025-04-19
#> 417                                                            2024-11-24
#> 418                                                            2024-07-28
#> 419                                                            2025-02-10
#> 420                                                            2024-09-29
#> 421                                                            2024-07-29
#> 422                                                            2025-04-20
#> 423                                                            2025-02-11
#> 424                                                            2024-07-30
#> 425                                                            2024-09-30
#> 426                                                            2024-11-25
#> 427                                                            2025-04-21
#> 428                                                            2024-07-31
#> 429                                                            2024-11-26
#> 430                                                            2025-06-23
#> 431                                                            2025-04-22
#> 432                                                            2024-08-01
#> 433                                                            2024-11-27
#> 434                                                            2025-06-24
#> 435                                                            2025-04-23
#> 436                                                            2024-10-01
#> 437                                                            2024-11-28
#> 438                                                            2024-08-02
#> 439                                                            2025-04-24
#> 440                                                            2024-10-02
#> 441                                                            2025-06-25
#> 442                                                            2024-08-03
#> 443                                                            2025-06-26
#> 444                                                            2024-11-29
#> 445                                                            2024-10-03
#> 446                                                            2025-04-25
#> 447                                                            2024-08-04
#> 448                                                            2024-10-04
#> 449                                                            2025-06-27
#> 450                                                            2025-04-26
#> 451                                                            2024-08-05
#> 452                                                            2024-11-30
#> 453                                                            2025-04-27
#> 454                                                            2024-08-06
#> 455                                                            2025-06-28
#> 456                                                            2024-12-01
#> 457                                                            2025-04-28
#> 458                                                            2024-08-07
#> 459                                                            2024-10-05
#> 460                                                            2025-06-29
#> 461                                                            2024-12-02
#> 462                                                            2024-08-08
#> 463                                                            2025-04-29
#> 464                                                            2025-02-12
#> 465                                                            2024-10-06
#> 466                                                            2025-06-30
#> 467                                                            2024-10-07
#> 468                                                            2024-12-03
#> 469                                                            2025-04-30
#> 470                                                            2025-09-10
#> 471                                                            2025-07-01
#> 472                                                            2024-08-09
#> 473                                                            2025-02-13
#> 474                                                            2024-10-08
#> 475                                                            2025-09-11
#> 476                                                            2024-10-09
#> 477                                                            2025-05-01
#> 478                                                            2024-12-04
#> 479                                                            2024-08-10
#> 480                                                            2025-07-02
#> 481                                                            2025-02-14
#> 482                                                            2024-10-10
#> 483                                                            2025-09-12
#> 484                                                            2025-05-02
#> 485                                                            2024-08-11
#> 486                                                            2025-07-03
#> 487                                                            2025-02-15
#> 488                                                            2024-12-05
#> 489                                                            2024-10-11
#> 490                                                            2025-05-03
#> 491                                                            2024-08-12
#> 492                                                            2025-09-13
#> 493                                                            2025-07-04
#> 494                                                            2024-10-12
#> 495                                                            2025-02-16
#> 496                                                            2025-05-04
#> 497                                                            2024-12-06
#> 498                                                            2024-10-13
#> 499                                                            2025-09-14
#> 500                                                            2024-08-13
#> 501                                                            2025-05-05
#> 502                                                            2024-12-07
#> 503                                                            2025-07-05
#> 504                                                            2024-10-14
#> 505                                                            2024-08-14
#> 506                                                            2024-12-08
#> 507                                                            2025-05-06
#> 508                                                            2025-09-15
#> 509                                                            2024-10-15
#> 510                                                            2025-07-06
#> 511                                                            2025-05-07
#> 512                                                            2024-12-09
#> 513                                                            2024-10-16
#> 514                                                            2025-09-16
#> 515                                                            2025-05-08
#> 516                                                            2024-10-17
#> 517                                                            2025-07-07
#> 518                                                            2024-12-10
#> 519                                                            2024-10-18
#> 520                                                            2024-12-11
#> 521                                                            2025-05-09
#> 522                                                            2024-10-19
#> 523                                                            2025-09-17
#> 524                                                            2025-07-08
#> 525                                                            2025-05-10
#> 526                                                            2024-12-12
#> 527                                                            2024-10-20
#> 528                                                            2025-05-11
#> 529                                                            2025-07-09
#> 530                                                            2024-12-13
#> 531                                                            2025-02-17
#> 532                                                            2025-05-12
#> 533                                                            2024-10-21
#> 534                                                            2025-09-18
#> 535                                                            2025-05-13
#> 536                                                            2024-10-22
#> 537                                                            2025-02-18
#> 538                                                            2025-07-10
#> 539                                                            2024-12-14
#> 540                                                            2025-05-14
#> 541                                                            2024-10-23
#> 542                                                            2025-07-11
#> 543                                                            2024-12-15
#> 544                                                            2025-05-15
#> 545                                                            2025-02-19
#> 546                                                            2024-10-24
#> 547                                                            2025-07-12
#> 548                                                            2025-09-19
#> 549                                                            2024-12-16
#> 550                                                            2025-05-16
#> 551                                                            2025-02-20
#> 552                                                            2025-07-13
#> 553                                                            2025-05-17
#> 554                                                            2024-10-25
#> 555                                                            2024-12-17
#> 556                                                            2025-05-18
#> 557                                                            2025-02-21
#> 558                                                            2024-12-18
#> 559                                                            2025-05-19
#> 560                                                            2025-09-20
#> 561                                                            2025-02-22
#> 562                                                            2024-10-26
#> 563                                                            2025-05-20
#> 564                                                            2024-12-19
#> 565                                                            2025-02-23
#> 566                                                            2025-07-14
#> 567                                                            2024-10-27
#> 568                                                            2025-05-21
#> 569                                                            2024-12-20
#> 570                                                            2025-02-24
#> 571                                                            2025-09-21
#> 572                                                            2025-07-15
#> 573                                                            2025-05-22
#> 574                                                            2024-12-21
#> 575                                                            2024-10-28
#> 576                                                            2025-02-25
#> 577                                                            2025-07-16
#> 578                                                            2025-05-23
#> 579                                                            2024-12-22
#> 580                                                            2025-09-22
#> 581                                                            2025-02-26
#> 582                                                            2025-05-24
#> 583                                                            2024-10-29
#> 584                                                            2024-12-23
#> 585                                                            2025-09-23
#> 586                                                            2025-05-25
#> 587                                                            2025-07-17
#> 588                                                            2025-02-27
#> 589                                                            2025-05-26
#> 590                                                            2024-10-30
#> 591                                                            2024-12-24
#> 592                                                            2025-09-24
#> 593                                                            2025-05-27
#> 594                                                            2025-02-28
#> 595                                                            2025-07-18
#> 596                                                            2024-12-25
#> 597                                                            2025-05-28
#> 598                                                            2025-09-25
#> 599                                                            2025-03-01
#> 600                                                            2025-07-19
#> 601                                                            2024-12-26
#> 602                                                            2025-07-20
#> 603                                                            2025-09-26
#> 604                                                            2024-12-27
#> 605                                                            2025-03-02
#> 606                                                            2025-05-29
#> 607                                                            2025-09-27
#> 608                                                            2025-03-03
#> 609                                                            2024-12-28
#> 610                                                            2025-07-21
#> 611                                                            2025-05-30
#> 612                                                            2025-09-28
#> 613                                                            2024-12-29
#> 614                                                            2025-03-04
#> 615                                                            2025-05-31
#> 616                                                            2025-07-22
#> 617                                                            2025-03-05
#> 618                                                            2025-09-29
#> 619                                                            2024-12-30
#> 620                                                            2025-09-30
#> 621                                                            2025-06-01
#> 622                                                            2025-07-23
#> 623                                                            2025-03-06
#> 624                                                            2025-06-02
#> 625                                                            2025-10-01
#> 626                                                            2024-12-31
#> 627                                                            2025-03-07
#> 628                                                            2025-10-02
#> 629                                                            2025-06-03
#> 630                                                            2025-07-24
#> 631                                                            2025-10-03
#> 632                                                            2025-01-01
#> 633                                                            2025-03-08
#> 634                                                            2025-10-04
#> 635                                                            2025-06-04
#> 636                                                            2025-07-25
#> 637                                                            2025-01-02
#> 638                                                            2025-10-05
#> 639                                                            2025-03-09
#> 640                                                            2025-06-05
#> 641                                                            2025-10-06
#> 642                                                            2025-01-03
#> 643                                                            2025-07-26
#> 644                                                            2025-06-06
#> 645                                                            2025-03-10
#> 646                                                            2025-10-07
#> 647                                                            2025-01-04
#> 648                                                            2025-07-27
#> 649                                                            2025-06-07
#> 650                                                            2025-03-11
#> 651                                                            2025-10-08
#> 652                                                            2025-01-05
#> 653                                                            2025-03-12
#> 654                                                            2025-10-09
#> 655                                                            2025-07-28
#> 656                                                            2025-06-08
#> 657                                                            2025-01-06
#> 658                                                            2025-03-13
#> 659                                                            2025-10-10
#> 660                                                            2025-06-09
#> 661                                                            2025-10-11
#> 662                                                            2025-03-14
#> 663                                                            2025-07-29
#> 664                                                            2025-06-10
#> 665                                                            2025-01-07
#> 666                                                            2025-10-12
#> 667                                                            2025-01-08
#> 668                                                            2025-06-11
#> 669                                                            2025-03-15
#> 670                                                            2025-07-30
#> 671                                                            2025-10-13
#> 672                                                            2025-01-09
#> 673                                                            2025-06-12
#> 674                                                            2025-10-14
#> 675                                                            2025-03-16
#> 676                                                            2025-07-31
#> 677                                                            2025-06-13
#> 678                                                            2025-01-10
#> 679                                                            2025-10-15
#> 680                                                            2025-06-14
#> 681                                                            2025-08-01
#> 682                                                            2025-01-11
#> 683                                                            2025-03-17
#> 684                                                            2025-06-15
#> 685                                                            2025-10-16
#> 686                                                            2025-01-12
#> 687                                                            2025-08-02
#> 688                                                            2025-10-17
#> 689                                                            2025-06-16
#> 690                                                            2025-03-18
#> 691                                                            2025-01-13
#> 692                                                            2025-06-17
#> 693                                                            2025-10-18
#> 694                                                            2025-08-03
#> 695                                                            2025-01-14
#> 696                                                            2025-03-19
#> 697                                                            2025-10-19
#> 698                                                            2025-06-18
#> 699                                                            2025-08-04
#> 700                                                            2025-03-20
#> 701                                                            2025-10-20
#> 702                                                            2025-08-05
#> 703                                                            2025-06-19
#> 704                                                            2025-10-21
#> 705                                                            2025-03-21
#> 706                                                            2025-08-06
#> 707                                                            2025-06-20
#> 708                                                            2025-10-22
#> 709                                                            2025-03-22
#> 710                                                            2025-08-07
#> 711                                                            2025-10-23
#> 712                                                            2025-03-23
#> 713                                                            2025-06-21
#> 714                                                            2025-03-24
#> 715                                                            2025-10-24
#> 716                                                            2025-03-25
#> 717                                                            2025-03-26
#> 718                                                            2025-10-25
#> 719                                                            2025-03-27
#> 720                                                            2025-10-26
#> 721                                                            2025-03-28
#> 722                                                            2025-10-27
#> 723                                                            2025-10-28
#> 724                                                            2025-06-22
#> 725                                                            2025-03-29
#> 726                                                            2025-08-08
#> 727                                                            2025-03-30
#> 728                                                            2025-10-29
#> 729                                                            2025-03-31
#> 730                                                            2025-08-09
#> 731                                                            2025-10-30
#> 732                                                            2025-04-01
#> 733                                                            2025-08-10
#> 734                                                            2025-10-31
#> 735                                                            2025-08-11
#> 736                                                            2025-08-12
#> 737                                                            2025-08-13
#> 738                                                            2025-04-02
#> 739                                                            2025-04-03
#> 740                                                            2025-08-14
#> 741                                                            2025-08-15
#> 742                                                            2025-08-16
#> 743                                                            2025-08-17
#> 744                                                            2025-08-18
#> 745                                                            2025-08-19
#> 746                                                            2025-08-20
#> 747                                                            2025-08-21
#> 748                                                            2025-08-22
#> 749                                                            2025-08-23
#> 750                                                            2025-08-24
#> 751                                                            2025-08-25
#> 752                                                            2025-08-26
#> 753                                                            2025-08-27
#> 754                                                            2025-08-28
#> 755                                                            2025-08-29
#> 756                                                            2025-08-30
#> 757                                                            2025-08-31
#> 758                                                            2025-09-01
#> 759                                                            2025-09-02
#> 760                                                            2025-09-03
#> 761                                                            2025-09-04
#> 762                                                            2025-09-05
#> 763                                                            2025-09-06
#> 764                                                            2025-09-07
#> 765                                                            2025-09-08
#> 766                                                            2025-09-09
#> 767                                                                  2025
#> 768                                                 85 years old or older
#> 769                                                    Less than 25 years
#> 770                                                   From 25 to 49 years
#> 771                                                   From 50 to 64 years
#> 772                                                   From 65 to 74 years
#> 773                                                   From 75 to 84 years
#> 774                                                                 Total
#> 775                                                                 Value
#> 776                                                                 Final
#> 777                                                           Provisional
```
