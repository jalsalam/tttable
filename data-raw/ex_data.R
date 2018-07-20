#ex_data.R

toy <- tibble::tibble(
  V1 = c("A", "A", "B", "B"),
  V2 = c("C", "D", "C", "D"),
  Summarizer = rep("Count", 4),
  Value = c(1, 2, 3, 4)
)

# Note: in this case all of the values are a single data type, but in general summarizers may have different data types (e.g., integers, doubles, characters, possibly different formatting, etc), and so likely in general the Value column needs to be a list

use_data(toy, overwrite = TRUE)
