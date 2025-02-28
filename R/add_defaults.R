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
        images_df$endOpacity <- 1
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
