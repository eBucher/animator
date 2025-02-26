add_image_defaults <- function(images_df) {
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
