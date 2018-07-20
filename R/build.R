#' Build table content sufficient for rendering
#'
#' `min_build()` works only for single-valued row and column specifications and return a data frame (so column values must be uniform)
min_build <- function(tt) {

  stopifnot(length(tt$arrangement$rows) == 1)
  stopifnot(length(tt$arrangement$cols) == 1)

  row_var <- tt$arrangement$rows[[1]]
  col_var <- tt$arrangement$cols[[1]]

  df <- tt$data %>%
    tidyr::spread(!!col_var, Value) %>%
    as.data.frame()

  df
}


