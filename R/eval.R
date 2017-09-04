#' Create a data store
#'
#' Creates a data store in the form of a function which can
#' be used to save arbitrary r objects to or read them from
#' a directory.
#'
#' @param path the path to the store folder

#'
#' @return A function which can be used to save to or read from
#' the data store.
store <- function(path) {
  function(expr, ...) {

    dots <- lazyeval::lazy_dots(...)
    if(missing(expr) && length(dots) > 0) {

      if(any(names(dots) == "")) stop("Missing argument names.")

      # Evaluate and save named arguments to disk
      write_names_to_lib(path, lazyeval::lazy_eval(dots))

    } else if(!missing(expr)) {
      substitute(expr) %>%
        as.character %>%
        read_name_from_lib(path, .)
    } else {
      stop("Cannot read and write to store in same call.")
    }

  }
}