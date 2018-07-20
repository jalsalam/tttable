#' Create a new tttable
#'
#' `tttable()` initializes a new tttable object. This objects includes slots for input data, an arrangement, and annotations. (later perhaps to add theme information and other things)
#' @export
tttable <- function(data = NULL, arrangement = arr(), ...) {

  t <- structure(list(
    data = data,
    arrangement = arrangement,
    theme = list(),
    annotations = list()

  ), class = c("tt_table"))

  t
}

#' @export
print.tt_table <- function(x, ...) {

  cat("Printing `min_build2(tttable) and arrangement as placeholder\n\nTable:\n")
  print(min_build2(x))
  cat("\n")
  print(x$arrangement)

  invisible(x)
}
