#' @name scale_colour_continuous_knmf
#' @aliases scale_color_continuous_knmf
#' @aliases scale_fill_continuous_knmf
#'
#' @title Continuous, monochromatic colour scales
#'
#' This scale maps values of continuous variables onto monochromatic color scale.
#' Currently only red and blue colours are supported with default red
#'
#' @param ... Arguments passed on to \link[ggplot2]{discrete_scale}
#' @param colour either "red" or "blue". Choose color for the scale
#' @param reverse logical. FALSE (default) if dark colour should represent low values and bright high values
#' TRUE otherwise
#'
#' @importFrom ggplot2 scale_colour_gradientn scale_fill_gradientn
#' @importFrom grDevices colorRampPalette

monochrome_palette <- function(colour = "red", reverse = FALSE, ...){
  if (colour != "red" & colour != "blue") {
    stop("Only red and blue palettes are supported. Specify 'colour' argument as one of {'red', 'blue'}")
  } else  if (colour == "red") {
    boundaries <- knmf_colours[c("black", "red", "yellow")]
    if (reverse) boundaries <- rev(boundaries)
  } else {
    boundaries <- c("grey30", knmf_colors["blue"], "#ffd272")
    if (reverse) boundaries <- rev(boundaries)
  }

  colorRampPalette(boundaries, ...)
}

#' @rdname scale_colour_continuous_knmf
#' @examples
#' \dontrun{
#' ggplot(mtcars, aes(hp, mpg, colour = drat)) + geom_point() + scale_colour_continuous_knmf()
#' ggplot(mtcars, aes(hp, mpg, colour = drat)) + geom_point() +
#' scale_colour_continuous_knmf(colour = "blue")
#' }
#' @export
#'
scale_colour_continuous_knmf <- function(..., colour = "red", reverse = FALSE){
  scale_color_gradientn(colours = monochrome_palette(colour, reverse)(256), ...)
}

#' @rdname scale_colour_continuous_knmf
#' @export
scale_color_continuous_knmf <- scale_colour_continuous_knmf

#' @rdname scale_colour_continuous_knmf
#' @export
scale_fill_continuous_knmf <- function(..., colour = "red", reverse = FALSE){
  scale_fill_gradientn(colours = monochrome_palette(colour, reverse)(256), ...)
}
