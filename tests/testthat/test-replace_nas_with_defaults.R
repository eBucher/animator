test_that("replace_nas_with_defaults inserts defaults that are fixed values", {
  df <- data.frame(
      startOpacity = c(0.5, NA, 1),
      endOpacity = c(NA, NA, 0)
  )

  expected <- data.frame(
      startOpacity = c(0.5, 1, 1),
      endOpacity = c(0.5, 1, 0)
  )

  testthat::expect_equal(replace_nas_with_defaults(df), expected)
})


test_that("replace_nas_with_defaults inserts defaults that are based on another column", {
    df <- data.frame(
        startWidth = c(100, 200, 300),
        endWidth = c(500, NA, NA)
    )

    expected <- data.frame(
        startWidth = c(100, 200, 300),
        endWidth = c(500, 200, 300)
    )

    testthat::expect_equal(replace_nas_with_defaults(df), expected)
})


test_that("replace_nas_with_defaults works when entire columns have NAs", {
    df <- data.frame(
        startWidth = c(100, 200, 300),
        endWidth = c(NA, NA, NA),
        startOpacity = c(NA, NA, NA)
    )

    expected <- data.frame(
        startWidth = c(100, 200, 300),
        endWidth = c(100, 200, 300),
        startOpacity = c(1, 1, 1)
    )

    testthat::expect_equal(replace_nas_with_defaults(df), expected)
})
