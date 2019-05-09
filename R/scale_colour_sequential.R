#' Sequential colour scales
#'
#' This scale maps ordinal or continuous values onto scale varying from very light grey to sepcified colour
#' (or other way round if reverse = TRUE).
#' All colours from basic palette are supported with default red.
#'
#' @param ... Arguments passed on to \link[ggplot2]{continuous_scale}
#' @param colour first boundary of scale. Name of one of \link{knmf_colours} or corresponding integer
#' @param second.colour second boundary of scale. Name of one of \link{knmf_colours} or corresponding integer
#' @param reverse logical. FALSE (default) if selected colour should
#' represent low values and light grey high values, TRUE otherwise.
#'
#' @importFrom ggplot2 scale_colour_gradientn scale_fill_gradientn
#' @export

scale_colour_sequential <- function(..., colour = "red", reverse = FALSE, second.colour = "grey90"){
  if (!(colour %in% names(knmf_colours)) & !(colour %in% seq(1,8))) {
    stop("Wrong colour specufication. Possible values are names of knmf_colours or
         integers from 1 to 8")
  }
  scale_colour_gradient(..., low = knmf_colours[colour], high = second.colour)
}

#' @rdname scale_colour_sequential
#' @export
#'
scale_color_sequential <- scale_colour_sequential

#' @rdname scale_colour_sequential
#' @export
#'
scale_fill_sequential <- function(..., colour = "red", reverse = FALSE, second.colour = "grey90"){
  if (!(colour %in% names(knmf_colours)) & !(colour %in% seq(1,8))) {
    stop("Wrong colour specufication. Possible values are names of knmf_colours or
         integers from 1 to 8")
  }
  scale_fill_gradient(..., low = knmf_colours[colour], high = second.colour)
}
