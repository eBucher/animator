add_image_defaults <- function(images_df) {

    if(is.null(images_df)) {
        return(images_df)
    }

    col_names <- colnames(images_df)
    if(!"endWidth" %in% col_names) {
        images_df$endWidth <- images_df$startWidth
    }
    if(!"endHeight" %in% col_names) {
        images_df$endHeight <- images_df$startHeight
    }
    if(!"startOpacity" %in% col_names) {
        images_df$startOpacity <- 1
    }
    if(!"endOpacity" %in% col_names) {
        images_df$endOpacity <- images_df$startOpacity
    }
    return(images_df)
}


add_text_defaults <- function(text_df) {

    if(is.null(text_df)) {
        return(text_df)
    }

    col_names <- colnames(text_df)
    if(!"fillStyle" %in% col_names) {
        text_df$fillStyle <- "black"
    }
    return(text_df)
}


#' Replace NA values in optional columns with default values
#'
#' @param df Either an images or text dataframe
#'
#' @return A modified version of the provided df dataframe whose NA values in
#' the optional columns have been replaced.
replace_nas_with_defaults <- function(df) {
    col_names <- colnames(df)
    # IMAGE DEFAULTS
    if("endWidth" %in% col_names) {
        df$endWidth[is.na(df$endWidth)] <- df$startWidth[is.na(df$endWidth)]
    }
    if("endHeight" %in% col_names) {
        df$endHeight[is.na(df$endHeight)] <- df$startHeight[is.na(df$endHeight)]
    }
    if("startOpacity" %in% col_names) {
        df$startOpacity[is.na(df$startOpacity)] <- 1
    }
    if("endOpacity" %in% col_names) {
        df$endOpacity[is.na(df$endOpacity)] <- df$startOpacity[is.na(df$endOpacity)]
    }

    # TEXT DEFAULTS
    if("fillStyle" %in% col_names) {
        df$fillStyle[is.na(df$fillStyle)] <- "black"
    }

    return(df)
}
