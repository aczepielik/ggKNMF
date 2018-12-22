#' @name scale_colour_discrete_knmf
#' @aliases scale_color_discrete_knmf
#' @aliases scale_fill_discrete_knmf
#'
#' @title Discrete colour scale with ggKNMF basic palette
#'
#' This scale maps values of categorical variables onto colours from \link{knmf_colours}.
#' All eight colours should be well distinguishable and first six are colour-blind safe.
#'
#' @param ... Arguments passed on to \link[ggplot2]{discrete_scale}
#' @param start integer from 1 to 8. From Which value of \link{knmf_colours} should the scale start
#' taking values. Remember that setting it above one constrains munber of colurs you can use.
#' @param reverse logical. If values from \link{knmf_colours} should be taken in reverse order.
#' @param na.value Colour for NA
#'
#' @importFrom ggplot2 discrete_scale

knmf_palette <- function(start = 1, reverse = FALSE){
  function(n){
    if (start + n > 8) {
      stop("Too many colours requested. KNMF palette consists of 8 colours.")
    } else if (n <= 0) {
      stop("Must request at least one colour.")
    }

    selection <- as.vector(knmf_colours[seq(start, start + n, 1)])
    ifelse(reverse, return(rev(selection)), return(selection))
  }
}

#' @rdname scale_colour_discrete_knmf
#' @examples
#' ggplot(mtcars, aes(hp, mpg, colour = as.factor(cyl))) + geom_point() +
#' scale_colour_discrete_knmf()
#' @export

scale_colour_discrete_knmf <- function(..., start = 1, reverse = FALSE,
                                       na.value = "grey40"){
  discrete_scale("colour", "KMNF", palette = knmf_palette(start, reverse), na.value = na.value, ...)
}

#' @rdname scale_colour_discrete_knmf
#' @export
scale_color_discrete_knmf <- scale_colour_discrete_knmf

#' @rdname scale_colour_discrete_knmf
#' @examples
#' ggplot(mtcars, aes(x = as.factor(carb), y = ..count.., fill = as.factor(carb))) +
#' geom_bar() + scale_fill_discrete_knmf()
#'
#' ggplot(mtcars, aes(hp, fill = as.factor(gear))) +
#' geom_density(alpha = 0.8) + scale_fill_discrete_knmf()
#' @export

scale_fill_discrete_knmf <- function(..., start = 1, reverse = FALSE,
                                     na.value = "grey40"){
  discrete_scale("fill", "KMNF", palette = knmf_palette(start, reverse), na.value = na.value, ...)
}
