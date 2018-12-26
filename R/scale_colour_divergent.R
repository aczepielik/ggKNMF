#' @name scale_colour_divergent
#' @aliases scale_color_divergent
#' @aliases scale_fill_divergent
#'
#' @title Divergent colour scales
#'
#' To be added
#'
#' @param ... Arguments passed on to \link[ggplot2]{continuous_scale}
#' @param low lower boundary of scale. Name of one of \link{knmf_colours} or corresponding integer
#' @param high upper boundary of scale. Name of one of \link{knmf_colours} or corresponding integer
#' @param mid colour of midpoint. Any valid colour specyfication.
#' @param midpoint to be added
#' @param na.value to be added
#'
#' @importFrom ggplot2 scale_colour_gradient2 scale_fill_gradient2
#' @export

scale_colour_divergent <- function(..., low = "black", mid = "white", high = "red", midpoint = 0,
                                    na.value = "grey50"){
  low.check <- !(low %in% names(knmf_colours)) & !(low %in% seq(1,8))
  high.check <- !(high %in% names(knmf_colours)) & !(high %in% seq(1,8))

  if (low.check | high.check) {
    stop("Wrong colour specufication. Possible values are names of knmf_colours or
         integers from 1 to 8")
  }
  scale_colour_gradient2(..., low = knmf_colours[low], high = knmf_colours[high],
                         mid = mid, midpoint = midpoint, na.value = na.value)
}

#' @rdname scale_colour_divergent
#' @export
#'
scale_color_divergent <- scale_colour_divergent

#' @rdname scale_colour_divergent
#' @export
#'
scale_fill_divergent <- function(..., low = "black", mid = "white", high = "red", midpoint = 0,
                                  na.value = "grey50"){
  low.check <- !(low %in% names(knmf_colours)) & !(low %in% seq(1,8))
  high.check <- !(high %in% names(knmf_colours)) & !(high %in% seq(1,8))

  if (low.check | high.check) {
    stop("Wrong colour specufication. Possible values are names of knmf_colours or
         integers from 1 to 8")
  }
  scale_fill_gradient2(..., low = knmf_colours[low], high = knmf_colours[high],
                         mid = mid, midpoint = midpoint, na.value = na.value)
}
