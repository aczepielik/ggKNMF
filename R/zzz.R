.onAttach <- function(libname, pkgname){
  old_theme <- theme_set(theme_knmf())

  use_knmf_colours()
}

.onUnload <- function(libname, pkgname){
  reset_knmf_colours()
}
