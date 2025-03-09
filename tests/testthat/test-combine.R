test_that("combine returns the original dataframe if only 1 is provided", {
    df1 <- data.frame(
        a = c(1, 2, 3),
        b = c(4, 5, 6),
        c = c(7, 8, 9)
    )
    testthat::expect_equal(df1, combine(df1))
})


test_that("combine can combine multiple dataframes", {
    df1 <- data.frame(
        a = c(1, 2, 3),
        b = c(4, 5, 6),
        c = c(7, 8, 9)
    )
    df2 <- data.frame(
        a = c(10, 20, 30),
        x = c(4, 5, 6),
        c = c(7, 8, 9)
    )
    df3 <- data.frame(
        x = c(1, 2, 3),
        y = c(4, 5, 6),
        z = c(7, 8, 9)
    )
    expected <- data.frame(
        a = c(1, 2, 3, 10, 20, 30, NA, NA, NA),
        b = c(4, 5, 6, NA, NA, NA, NA, NA, NA),
        c = c(7, 8, 9, 7, 8, 9, NA, NA, NA),
        x = c(NA, NA, NA, 4, 5, 6, 1, 2, 3),
        y = c(NA, NA, NA, NA, NA, NA, 4, 5, 6),
        z = c(NA, NA, NA, NA, NA, NA, 7, 8, 9)
    )
    testthat::expect_equal(expected, combine(df1, df2, df3))
})


test_that("combine_two_dfs works when df1 has a column that df2 doesn't", {
  df1 <- data.frame(
      a = c(1, 2, 3),
      b = c(4, 5, 6),
      c = c(7, 8, 9)
  )
  df2 <- data.frame(
      a = c(100, 200, 300),
      c = c(700, 800, 900)
  )
  expected <- data.frame(
      a = c(1, 2, 3, 100, 200, 300),
      b = c(4, 5, 6, NA, NA, NA),
      c = c(7, 8, 9, 700, 800, 900)
  )
  testthat::expect_equal(expected, combine_two_dfs(df1, df2) )
})


test_that("combine_two_dfs works when df2 has a column that df1 doesn't", {
    df1 <- data.frame(
        a = c(100, 200, 300),
        c = c(700, 800, 900)
    )
    df2 <- data.frame(
        a = c(1, 2, 3),
        b = c(4, 5, 6),
        c = c(7, 8, 9)
    )
    expected <- data.frame(
        a = c(100, 200, 300, 1, 2, 3),
        c = c(700, 800, 900, 7, 8, 9),
        b = c(NA, NA, NA, 4, 5, 6)
    )
    testthat::expect_equal(expected, combine_two_dfs(df1, df2) )
})


test_that("combine_two_dfs returns df1 if df2 is null", {
    df1 <- data.frame(
        a = c(100, 200, 300),
        c = c(700, 800, 900)
    )
    testthat::expect_equal(df1, combine_two_dfs(df1, NULL) )
})


test_that("combine_two_dfs returns df2 if df1 is null", {
    df1 <- data.frame(
        a = c(100, 200, 300),
        c = c(700, 800, 900)
    )
    testthat::expect_equal(df1, combine_two_dfs(df1, NULL) )
})


test_that("combine_two_dfs doesn't change the structure of both dataframes have the same columns", {
    df1 <- data.frame(
        a = c(1, 2, 3),
        c = c(4, 5, 6)
    )
    df2 <- data.frame(
        a = c(100, 200, 300),
        c = c(400, 500, 600)
    )
    testthat::expect_equal(rbind(df1, df2), combine_two_dfs(df1, df2) )
})


test_that("combine_two_dfs works when two columns with the same name have different data types", {
    df1 <- data.frame(
        a = c(1, 2, 3),
        c = c(4, 5, 6)
    )
    df2 <- data.frame(
        a = c("A", "B", "C"),
        c = c(400, 500, 600),
    )
    testthat::expect_equal(rbind(df1, df2), combine_two_dfs(df1, df2) )
})
