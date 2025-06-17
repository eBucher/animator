#' Basic checks to see if there are any simple problems that would cause the compile() function to crash
#'
#' @details All arguments passed to this function should match the arguments passed to compile()
validate_compile_input <- function(path, bg, warn, images_df, text_df, size) {
    if(file.exists(path) == FALSE) {
        stop(path, " was not found. Pass a path to the compile() function that already exists.")
    }

    if(file.exists(bg) == FALSE) {
        stop(bg, " was not found. Pass a relative or absolute path to an existing image as the 'bg' argument.")
    }

    if(is.logical(warn) == FALSE) {
        stop("The 'warn' argument must either be TRUE or FALSE. ", warn, " was received.")
    }

    if(is.data.frame(images_df) == FALSE && is.null(images_df) == FALSE) {
        stop("The 'images_df' argument must be a dataframe.")
    }

    if(is.data.frame(text_df) == FALSE && is.null(text_df) == FALSE) {
        stop("The 'text_df' argument must be a dataframe.")
    }

    if(length(size) != 2 && !is.null(size)) {
        stop("The size argument must be null or a vector with two elements in the form of c(width, height).")
    }


    # Make sure all the necessary columns are present in the dataframes

    required_image_cols <- c("startTime", "endTime", "startX", "startY", "endX", "endY", "startWidth", "startHeight", "image")
    for(col in required_image_cols) {
        if(col %in% colnames(images_df) == FALSE) {
            stop(col, " is a required column in images_df but has not been provided.")
        }
    }


    required_text_cols <- c("startTime", "endTime", "startX", "startY", "endX", "endY", "font", "text")
    for(col in required_image_cols) {
        if(col %in% colnames(images_df) == FALSE) {
            stop(col, " is a required column in text_df but has not been provided.")
        }
    }

    return(TRUE)
}
