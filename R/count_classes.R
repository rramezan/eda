count_classes <- function(data_frame, class_col) {
  if (!is.data.frame(data_frame)) {
    stop("`data_frame` should be a data frame or data frame extension (e.g. a tibble)")
  }

  data_frame |>
    group_by({{ class_col }}) |>
    summarize(count = n()) |>
    rename("class" = {{ class_col }})
}
