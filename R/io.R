read_name_from_lib <- function(libpath, name) {
  readRDS(paste0(libpath, name, ".rstore"))
}

read_names_from_lib <- function(libpath, names) {
  names %>%
    setNames(., .) %>%
    purrr::map(~read_name_from_lib(libpath, .))
}

write_name_to_lib <- function(libpath, name, value) {
  saveRDS(value, paste0(libpath, name, ".rstore"))
}

write_names_to_lib <- function(libpath, list) {
  purrr::walk2(names(list), list, ~write_name_to_lib(libpath, .x, .y))
}

delete_name_from_lib <- function(libpath, name) {
  file.remove(libpath, name, ".rstore")
}

delete_names_from_lib <- function(libpath, names) {
  purrr::map(names, ~delete_name_from_lib(libpath, .))
}

