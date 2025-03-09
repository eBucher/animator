#' Combine multiple dataframes with different columns together
#'
#' @param ... One or more dataframes
#'
#' @details This function is similar to `rbind()` in that multiple dataframes
#' can be appended on top of each other. Unlike `rbind()` though, the dataframes
#' do not have to have the same columns. A dataframe that is missing a column
#' that another dataframe has will have its portion of the final output filled
#' in with NAs.
#'
#' This function can be used when series of actions were created in multiple
#' dataframes and some are relying on default values and don't contain the
#' same columns as others.
#'
#' @return A dataframe with all of the rows from the original dataframes
#' appended onto each other and missing column values filled in with NAs.
#'
combine <- function(...) {

    dots <- list(...)

    if(length(dots) == 0) {
        stop("At least one dataframe must be passed to combine()")
    }

    combined_df <- NULL
    for(df in dots) {
        combined_df <- combine_two_dfs(combined_df, df)
    }

    return(combined_df)
}


combine_two_dfs <- function(df1, df2) {
    df1_names <- names(df1)
    df2_names <- names(df2)

    if(is.null(df1)) {
        return(df2)
    }
    if(is.null(df2)) {
        return(df1)
    }

    for(col_name in df1_names) {
        if(col_name %in% df2_names == FALSE) {
            df2[[col_name]] <- NA
        }
    }
    for(col_name in df2_names) {
        if(col_name %in% df1_names == FALSE) {
            df1[[col_name]] <- NA
        }
    }

    return(rbind(df1, df2))
}
