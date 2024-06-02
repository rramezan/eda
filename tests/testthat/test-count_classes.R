test_that("`count_classes` should return a data frame, or tibble,
with the number of rows corresponding to the number of unique classes
in the `class_col` from the original dataframe. The new dataframe
will have a `class column` whose values are the unique classes,
and a `count` column, whose values will be the number of observations
for each  class", {
  # "expected use cases" tests to be added here
})

test_that("`count_classes` should return an empty data frame, or tibble,
if the input to the function is an empty data frame", {
  # "edge cases" test to be added here
})

test_that("`count_classes` should throw an error when incorrect types
are passed to the `data_frame` argument", {
  # "error" tests to be added here
})



# Function inputes for tests cases ---------------------
set.seed(2024)

two_classes_2_obs <- data.frame(class_labels = rep(c("class1",
                                                     "class2"), 2),
                                values = round(runif(4), 1))
two_classes_2_and_1_obs <- data.frame(class_labels = c(rep("class1", 2),
                                                       "class2"),
                                      values = round(runif(3), 1))
one_class_2_obs <- data.frame(class_labels = c("class1", "class1"),
                              values = round(runif(2), 1))
empty_df  <- data.frame(class_labels = character(0),
                        values = double(0))
two_classes_two_obs_as_list <- list(class_labels = rep(c("class1",
                                                         "class2"), 2),
                                    values = round(runif(4), 1))


# Expected function oputputs for test cases -------------------------
two_classes_2_obs_output <- data.frame(class = c("class1", "class2"),
                                       count = c(2,2))
two_classes_2_and_1_obs_output <- data.frame(class = c("class1", "class2"),
                                             count = c(2, 1))
one_class_2_obs_output <- data.frame(class = "class1",
                                     count = 2)
empty_df_output <- data.frame(class = character(0),
                              count = numeric(0))



test_that("Message to print if test fails", expect_*(...))






test_that("`count_classes` should return a data frame, or tibble,
with the number of rows corresponding to the number of unique classes
in the `class_col` from the original dataframe. The new dataframe
will have a `class column` whose values are the unique classes,
and a `count` column, whose values will be the number of observations
for each  class", {
  expect_s3_class(count_classes(two_classes_2_obs, class_labels),
                  "data.frame")
  expect_equal(count_classes(two_classes_2_obs, class_labels),
               two_classes_2_obs_output, ignore_attr = TRUE)
  expect_equal(count_classes(two_classes_2_and_1_obs, class_labels),
               two_classes_2_and_1_obs_output, ignore_attr = TRUE)
})






test_that("`count_classes` should return an empty data frame, or tibble,
if the input to the function is an empty data frame", {
  expect_equal(count_classes(one_class_2_obs, class_labels),
               one_class_2_obs_output, ignore_attr = TRUE)
  expect_equal(count_classes(empty_df, class_labels),
               empty_df_output, ignore_attr = TRUE)
})



test_that("`count_classes` should throw an error when incorrect types
are passed to the `data_frame` argument", {
  expect_error(count_classes(two_classes_two_obs_as_list, class_lables))
})


