# melodi 1.0.0
- Relèvement du seuil de `get_data` à **100 000** lignes (amélioration de l'API Melodi)
- Centralisation en **options** des paramètres techniques d'appel à l'API, 
plutôt qu'en paramètre ou caché dans les fonctions
  - En tant qu'utilisateur, si besoin de changer un paramètre, 
  simplement lancer : `options(rmelodi.base_url_api = "https://...")`
- Relectures diverses de code (styler)

# melodi 0.3.1
- Correction d'exemples ne fonctionnant plus ou pas lisible dans la doc
- Adaptation des tests à vcr 2 (suppression du helper, relance des cassettes)

# melodi 0.3.0
- #5 : ajout de fonctions permettant de récupérer les libellés des codes associés à un jeu de données : 
`get_range_geo` (géographie) and `get_range` (toutes les autres dimensions)

# melodi 0.2.0
- #16 : `get_all_data` : au lieu de construire la requête d'accès et les noms des fichiers dans le zip manuellement, récupération de l'URL via le catalogue (plus fiable et permet de gérer le cas où le CSV du DS est millésimé)
- #17 : `get_catalog` : ajout des millésimes géo et niveaux géographiques

# melodi 0.1.1
- Version initiale github
