.onAttach <- function(libname, pkgname){
  use_knmf_colours()

  backup_theme <- theme_set(theme_knmf())
  assign("backup_theme", backup_theme, pos = "ggKNMF_colour_scales")
}

.onUnload <- function(libname, pkgname){
  curr_theme <- theme_get()
  if (identical(curr_theme, theme_knmf())){
    theme_set(get("backup_theme", pos = "ggKNMF_colour_scales"))
  }

  reset_knmf_colours()
}
