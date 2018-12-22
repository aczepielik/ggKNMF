#' KNMF ggplot theme
#'
#' Comlete theme specyfing background, lines, axes, legend and fonts. Default parameters are the same as in
#' ggplot2 complete themes  like theme_gray, theme_bw, theme_mininal etc.
#'
#' A simplistic theme with white background, thin axis lines and dashed, grey major grid. It is set as
#' default when package ggKNMF is loaded.
#'
#'     By default uses Roboto Condensed fonts which must be installed by the user.
#'
#' @param base_size base font size. Particular text elements are scaled relatively to this.
#' @param base_family base font family. Default is "Roboto Condensed".
#' If you don't have it installed consider using "sans" value for stable and nice performance.
#' @param base_line_size base size for line elements. Particular line elements are scaled relatively to this.
#' @param base_rect_size base size for rect elements. Particular rect elements are scaled relatively to this.
#'
#' @export
#' @import ggplot2
#' @examples
#' \dontrun{
#' ggplot(mtcars, aes(hp, fill = as.factor(gear))) + geom_density() +
#' facet_wrap(~as.factor(am)) +
#' labs(title = "Density plot", subtitle = "Two facets") + ggKNMF::theme_knmf()
#' }
#'
theme_knmf <- function(base_size = 11, base_family = "Roboto Condensed",
                       base_line_size = base_size/22,
                       base_rect_size = base_size/22){
  theme_grey(base_size = base_size, base_family = base_family,
             base_line_size = base_line_size, base_rect_size = base_rect_size) %+replace%
    theme(plot.title = element_text(size = rel(1.7), face = "bold",
                                    hjust = 0, margin = margin(b = 3)),
          plot.subtitle = element_text(size = rel(1),
                                       hjust = 0, margin = margin(b = 6)),
          panel.background = element_rect(fill = "white", colour = NA),
          panel.border = element_blank(),
          panel.grid.major.x = element_line(size = rel(1/4), linetype = 2, colour = "grey50"),
          panel.grid.major.y = element_line(size = rel(1/3), linetype = 2, colour = "grey50"),
          panel.grid.minor = element_blank(),
          axis.line = element_line(colour = "black", size = rel(1/3)),
          axis.text = element_text(size = rel(0.8)),
          strip.background = element_rect(fill = "grey10"),
          strip.text = element_text(color = "white", margin = margin(rel(2), rel(2), rel(2), rel(2))),
          legend.key = element_blank(),
          complete = TRUE)
}

