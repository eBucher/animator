compile <- function(path = ".", bg, warn = TRUE, images_df = NULL, text_df = NULL) {

    # Set up a folder to store all the output files
    output_path <- set_up_empty_animation_folder(path, warn)
    if(is.null(output_path)) {
        return(NULL)
    }

    # Copy files necessary for the animation into the folder
    files_to_copy <- list.files(system.file(package = "animator"))
    for(f in files_to_copy) {
        file.copy(from = system.file(f, package = "animator"), to = output_path)
    }

    # Copy over all the images into an assets subfolder
    assets_folder_path <- paste0(output_path, "assets")
    dir.create(assets_folder_path)
    if(!is.null(images_df)) {
        images_to_copy <- unique(images_df$image)
        for(image_path in images_to_copy) {
            file.copy(image_path, assets_folder_path)
            # Replace each image file path in images_df with the new path that
            # it is stored at, relative to the animation_output folder
            images_df$image[images_df$image == image_path] <- paste0("assets/", basename(image_path))
        }
    }
    file.copy(bg, assets_folder_path)

    images_json <- add_image_defaults(images_df) |>
        jsonlite::toJSON()
    text_json <- add_text_defaults(text_df) |>
        jsonlite::toJSON()
    js_var_string <- paste0('var bgImagePath = "assets/', basename(bg), '";\n\n')
    js_var_string <- paste0(js_var_string, "var movementData = ", images_json, ";\n\n")
    js_var_string <- paste0(js_var_string, "var textData = ", text_json, ";\n\n")
    writeLines(js_var_string, paste0(output_path, "movementData.js"))
}


# Either create a folder called animation_folder in the specified location if one
# doesn't already exist or clear out the old one.
set_up_empty_animation_folder <- function(path, warn) {
    if(file.exists(path) == FALSE) {
        stop(path, " was not found. Pass a path to the compile() function that already exists.")
    }

    # Add a / to the end of the path if it's not already on there
    last_char_on_path <- substr(path, nchar(path), nchar(path))
    if(last_char_on_path != "/") {
        path <- paste0(path, "/")
    }

    output_path <- paste0(path, "animation_output/")
    if(file.exists(output_path) == TRUE) {
        # Make sure the user is fine with overwriting anything old. If they type anything other than a confirmation, the abort the function.
        if(warn == TRUE) {
            response <- readline(paste0(output_path, "already exists. Should the files in the folder be overwritten with your new animation? (y/n) "))
            if(!response %in% c("y", "Y", "yes", "Yes")) {
                cat("No changes have been made.\n")
                return(NULL)
            }
        }
        # Delete all the files in the animation_output folder
        unlink(paste0(output_path, "*"), recursive = TRUE, force = TRUE)
    } else {
        dir.create(output_path)
    }
    return(output_path)
}
