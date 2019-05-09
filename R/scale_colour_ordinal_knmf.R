#' Ordinal KNMF colour scale
#'
#' Maps ordered factors to sequence of colours
#'
#' @param colour Dominant colour in scale. Currently \emph{red} and \emph{blue} are supported
#' with corresponding \code{\link{knmf_colours}}
#' @param reverse logical. Sholud oreder of colurs be reversed. As default colours go from dark for low values to
#' high for high values
#' @param ... arguments passes on to \code{discrete_scale}
#'
#' @importFrom ggplot2 discrete_scale
#' @export

scale_colour_ordinal_knmf <- function(..., colour = "red", reverse = FALSE){
  discrete_scale(aesthetics = c("colour", "color"), scale_name = "colour_ordinal",
                 palette = monochrome_palette(colour = colour, reverse = reverse))
}

#' @rdname scale_colour_ordinal_knmf
#' @export

scale_color_ordinal_knmf <- scale_colour_ordinal_knmf

#' @rdname scale_colour_ordinal_knmf
#' @export
#'
scale_fill_ordinal_knmf <- function(..., colour = "red", reverse = FALSE){
  discrete_scale(aesthetics = "fill", scale_name = "colour_ordinal",
                 palette = monochrome_palette(colour = colour, reverse = reverse))
}
