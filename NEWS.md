# melodi 1.1.0
- Mise au carré pour soumission au CRAN : lint, résolution notes, mise au place check par github actions

# melodi 1.0.2
- `get_data` : gestion des cas où OBS_VALUE est nommé autrement que OBS_VALUE_NIVEAU, notamment sur DS_IPC_PRINC (#16)

# melodi 1.0.1
- `get_range_geo` : ajout GEO_OBJECT_LABEL et amélioration des performances par usage de purrr au lieu de boucles (#12)

# melodi 1.0.0
- Relèvement du seuil de `get_data` à **100 000** lignes (amélioration de l'API Melodi)
- Centralisation en **options** des paramètres techniques d'appel à l'API, plutôt qu'en paramètre (ou caché) dans les fonctions
  - En tant qu'utilisateur, si besoin de changer un paramètre, 
  simplement lancer : `options(rmelodi.base_url_api = "https://...")`
- Relectures diverses de documentation et du code (styler)

# melodi 0.3.1
- Correction d'exemples ne fonctionnant plus ou pas lisible dans la doc
- Adaptation des tests à vcr 2 (suppression du helper, relance des cassettes)

# melodi 0.3.0
- `get_range_geo` (géographie) and `get_range` (toutes les autres dimensions) : 
nouvelles fonctions permettant de récupérer les libellés des codes associés à un jeu de données (#5)

# melodi 0.2.0
- `get_all_data` : au lieu de construire la requête d'accès et les noms des fichiers dans le zip manuellement, 
récupération de l'URL via le catalogue : plus fiable et permet de gérer le cas où le CSV du DS est millésimé (#16)
- `get_catalog` : ajout des millésimes géo et niveaux géographiques (#17)

# melodi 0.1.1
- Version initiale publiée publiquement
