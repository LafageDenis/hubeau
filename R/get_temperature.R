#' Retrieve data from API "Ecoulement des cours d'eau"
#'
#' @description
#' The data originate from the "Naîades" database. The cover 760 temperature stations.
#' Available endpoints are:
#'
#' - `get_temperature_station` retrieves site data and locations
#' - `get_temperature_chronique` retrieves temperature information
#'
#' See the API documentation for available filter parameters: \url{https://hubeau.eaufrance.fr/page/api-temperature-continu}
#'
#' @inheritParams doApiQuery
#' @inherit convert_list_to_tibble return return
#'
#' @export
#' @rdname get_temperature
#' @examples
#' if(interactive()) {
#' # Retrieve 2022 observation campaigns in the Jura French department
#' get_ecoulement_campagnes(
#'   list(code_departement = "39",
#'        date_campagne_min = "2022-01-01",
#'        date_campagne_max = "2022-12-31")
#' )
#'
#' # Retrieve river stations in Nantes
stations_Nantes <- get_temperature_station(
  list(code_commune = "44190",
       fields = "code_station,libelle_cours_eau,libelle_commune")
)
stations_Nantes
#'
#' # Get the query parameters for the requested API/endpoint
#' list_params(api = "ecoulement",
#'                      endpoint = "observations")
#'
#' # Retrieve the river flow data in the Jura departement in 2022 with
#' # a selection of the fields
#' onde_39 <- get_ecoulement_observations(
#'   list(code_departement = "39",
#'        date_observation_min = "2022-01-01",
#'        date_observation_max = "2022-12-31",
#'        fields = "code_station,libelle_station,date_observation,libelle_ecoulement")
#' )
#' onde_39
#'}
get_temperature_station <- function(params)
{
  l <- doApiQuery(
    api = "temperature",
    endpoint = "station",
    params = params
  )

  convert_list_to_tibble(l)
}


#' @rdname get_chronique
#' @export
get_temperature_chronique <- function(params)
{
  l <- doApiQuery(
    api = "temperature",
    endpoint = "chronique",
    params = params
  )

  convert_list_to_tibble(l)
}
