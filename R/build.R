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

#' Build table into a matrix
#'@examples
#'t1 <- tttable(toy, arr("V1", "V2"))
#'min_build2(t1)
#'t2 <- tttable(toy, arr(c("V1", "V2")))
#'min_build2(t2)
#'t3 <- tttable(toy, arr(cols = c("V1", "V2")))
#'min_build2(t3)
min_build2 <- function(tt) {

  data <- dplyr::arrange_at(tt$data, dplyr::vars(!!!tt$arrangement$rows, !!!tt$arrangement$cols))

  row_vars <- tt$arrangement$rows
  col_vars <- tt$arrangement$cols

  if(length(row_vars) >= 1) {
    row_data <- dplyr::distinct(data, !!!row_vars)
    nrows <- nrow(row_data)
    row_labs <- tidyr::unite(row_data, "labs", !!!row_vars, sep = "|")[["labs"]]

  } else {
    nrows <- 1
    row_labs <- "All"
  }

  if(length(col_vars) >= 1) {
    col_data <- dplyr::distinct(data, !!!col_vars)
    ncols <- nrow(col_data)
    col_labs <- tidyr::unite(col_data, "labs", !!!col_vars, sep = "|")[["labs"]]

  } else {
    ncols <- 1
    col_labs <- "All"
  }

  res <- matrix(data$Value, nrow = nrows, dimnames = list(row_labs, col_labs))
  res
}


