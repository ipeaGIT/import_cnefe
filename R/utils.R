#' Detect year from a single file path
#'
#' @param filename A local file path
#' @return A vector.
#'
#' @keywords internal
detect_year_from_string <- function(string){
  yyyy <- regmatches(string, gregexpr("\\d{4}", string))[[1]]
  yyyy <- unique(yyyy)
  yyyy <- yyyy[ yyyy != '2500' ]
  return(yyyy)
}

extract_url <- function(x){
  links <- RCurl::getURL(x) |>
    rvest::read_html() |>
    rvest::html_nodes(xpath = '//td/a[@href]') |>
    rvest::html_attr('href')
  return(links)
}
