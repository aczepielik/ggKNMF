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

#' @export

reset_knmf_colours <- function(scales = TRUE, geom_defaults = TRUE){
  if (scales) {
  detach("ggKNMF_colour_scales")
  }

  if (geom_defaults) {
    #to be added
  }
}
