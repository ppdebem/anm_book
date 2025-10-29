library(httr)
library(sf)

# Barragens ---------------------------------------------------------------

url <- parse_url("https://geo.anm.gov.br/arcgis/rest/services/Producao/Barragens_Dashboard_Publico/FeatureServer")
url$path <- paste0(url$path, "/0/query")

url$query <- list(
  where = "1=1",
  outFields = "*",
  f = "geojson"
)

request <- build_url(url)

barragens <- read_sf(request)

st_write(barragens, ".data/barragens.gpkg", append = FALSE)


# Processos ---------------------------------------------------------------

processos <- read_sf("/vsizip//vsicurl/https://app.anm.gov.br/dadosabertos/SIGMINE/PROCESSOS_MINERARIOS/BRASIL.zip")

st_write(processos, '.data/processos.gpkg', append = FALSE)


# Estruturas --------------------------------------------------------------

# estruturas <- c("complexos", "usinas", "pilhas", "minas", "est_apoio", "barragens")
# 
# for(i in 1:length(estruturas)){
#   url <- parse_url("https://geo.anm.gov.br/arcgis/rest/services/Hosted/Estruturas_RAL_Ano_Base_2024/FeatureServer")
#   url$path <- paste(url$path, i, "query", sep = "/")
#   
#   url$query <- list(
#     where = "1=1",
#     outFields = "*",
#     f = "geojson"
#   )
#   
#   request <- build_url(url)
#   
#   st_write(read_sf(request), paste0(".data/", estruturas[i], ".gpkg"))
# }

# Complexos Ano Base 2024 (1)
# Usinas Ano Base 2024 (2)
# Pilhas Ano Base 2024 (3)
# Minas Ano Base 2024 (4)
# Estrutuas de Apoio Ano Base 2024 (5)
# Barragens Ano Base 2024 (6)

