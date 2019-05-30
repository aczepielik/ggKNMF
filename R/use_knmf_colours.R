#' Make KMNF colours default
#'
#' Set KNMF colours as default for ggplot plots
#'
#' @importFrom ggplot2 update_geom_defaults

knmf_geom_updates <- function(){
  update_geom_defaults("point", list(size = 2))
  update_geom_defaults("smooth", list(colour = knmf_colours["red"], size = 1.5))
  update_geom_defaults("bar", list(fill = knmf_colours["black"]))
  update_geom_defaults("col", list(fill = knmf_colours["black"]))
  update_geom_defaults("boxplot", list(outlier.color = knmf_colours["red"]))
  update_geom_defaults("density", list(alpha = 0.85))
}

#' KNMF colours
#'
#' Apply colour scheme to scales and deafult some deafult colour values
#'
#' @param scales logical. If TRUE (default) \code{colour} and \code{fill} scales use KNMF colours
#' @param geom_defaults logical. If TRUE (default) some standard colour settings are overwritten for KNMF colours
#' (e.g. outliers in boxplots are red. See Details.)
#' @export
#'
use_knmf_colours <- function(scales = TRUE, geom_defaults = TRUE){

  if (geom_defaults) {
  ggKNMF_colour_scales <- attach(NULL, name = "ggKNMF_colour_scales")

  assign("scale_colour_discrete", scale_colour_discrete_knmf, pos = ggKNMF_colour_scales)
  assign("scale_fill_discrete", scale_fill_discrete_knmf, pos = ggKNMF_colour_scales)
  assign("scale_colour_continuous", scale_colour_continuous_knmf, pos = ggKNMF_colour_scales)
  assign("scale_fill_continuous", scale_fill_continuous_knmf, pos = ggKNMF_colour_scales)
  assign("scale_colour_ordinal", scale_colour_ordinal_knmf, pos = ggKNMF_colour_scales)
  assign("scale_fill_ordinal", scale_fill_ordinal_knmf, pos = ggKNMF_colour_scales)
  }

  if (scales) {
    knmf_geom_updates()
  }
}

#' @rdname use_knmf_colours
#' @export

reset_knmf_colours <- function(scales = TRUE, geom_defaults = TRUE){
  if (scales) {
    if ("ggKNMF_colour_scales" %in% search()) {
      detach("ggKNMF_colour_scales")
    }
  }

  if (geom_defaults) {
      update_geom_defaults("point", list(size = 1.5))
      update_geom_defaults("smooth", list(colour = "#3366FF", size = 1))
      update_geom_defaults("bar", list(fill = "grey35"))
      update_geom_defaults("col", list(fill = "grey35"))
      update_geom_defaults("boxplot", list(outlier.color = "grey20"))
      update_geom_defaults("density", list(alpha = NA))
  }
}
