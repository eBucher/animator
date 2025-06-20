#' Create an empty dataframe that contains the columns needed for the `images_df`
#' argument in the `compile()` function.
#'
#' @details The columns that are compatible in images dataframes are listed below.
#' Any that are marked as optional can either contain NAs to use their default
#' value, or the whole column can be omitted if the default behavior is desired
#' for every action.
#' * **startTime** (numeric) - How many seconds into the animation that the image should
#' start to appear.
#' * **endTime** (numeric) - How many seconds into the animation that the image should
#' disappear.
#' * **startX** (numeric) - The X coordinate where the center of the image will
#' begin.
#' * **startY** (numeric) - The Y coordinate where the center of the image will
#' begin.
#' * **endX** (numeric) - The X coordinate where the center of the image will
#' end.
#' * **endY** (numeric) - The Y coordinate where the center of the image will
#' end.
#' * **startWidth** (numeric) - How many pixels wide the image should initially be.
#' * **startHeight** (numeric) - How many pixels tall the image should initially be.
#' * **endWidth** (numeric, optional) - How many pixels wide the image should be
#' by the endTime. If set as NA or if the column is not provided, the image's
#' width will not change.
#' * **endHeight** (numeric, optional) - How many pixels tall the image should be
#' by the endTime. If set as NA or if the column is not provided, the image's width
#' will not change.
#' * **startOpacity** (numeric, optional) - How opaque the image should be when it
#' first appears, between 0 and 1. 0 is completely transparent and 1 is completely
#' opaque. If set as NA or if the column is not provided, the image will be completely
#' opaque.
#' * **endOpacity** (numeric, optional) - How opaque the image should be by its
#' endTime, between 0 and 1. 0 is completely transparent and 1 is completely
#' opaque. If set as NA or if the column is not provided, the opacity of the image
#' will not change.
#' * **image** (character) - An absolute or relative path to an image file (png,
#' jpg, gif).
images_template <- function() {
    data.frame(
        startTime = numeric(0),
        endTime = numeric(0),
        startX = numeric(0),
        startY = numeric(0),
        endX = numeric(0),
        endY = numeric(0),
        startWidth = numeric(0),
        startHeight = numeric(0),
        endWidth = numeric(0), # Optional
        endHeight = numeric(0), # Optional
        startOpacity = numeric(0), #Optional
        endOpacity = numeric(0), #Optional
        image = character(0)
    )
}




#' Create an empty dataframe that contains the columns needed for the `text_df`
#' argument in the `compile()` function.
#'
#' @details The columns that are compatible in text dataframes are listed below.
#' Any that are marked as optional can either contain NAs to use their default
#' value, or the whole column can be omitted if the default behavior is desired
#' for every action.
#' * **startTime** (numeric) - How many seconds into the animation that the text should
#' start to appear.
#' * **endTime** (numeric) - How many seconds into the animation that the text should
#' disappear.
#' * **startX** (numeric) - The X coordinate where the left side of the text will
#' begin.
#' * **startY** (numeric) - The Y coordinate where the center of the text will
#' begin.
#' * **endX** (numeric) - The X coordinate where the left of the text will
#' end.
#' * **endY** (numeric) - The Y coordinate where the center of the text will
#' end.
#' * **font** (character) - A string in the form of an [HTML canvas's font property](https://www.w3schools.com/tags/canvas_font.asp).
#' For example, "bold 12px arial".
#' * **fillStyle** (character, optional) - The color of the text. Can either be a [color name](https://www.w3schools.com/tags/ref_colornames.asp)
#'  supported by your internet browser such as "green" or a hexcode such as "#FFD700".
#'  If set to NA or if the column is not provided, the text will be black.
#' * **text** (character) - The text to display.
text_template <- function() {
    data.frame(
        startTime = numeric(0),
        endTime = numeric(0),
        startX = numeric(0),
        startY = numeric(0),
        endX = numeric(0),
        endY = numeric(0),
        font = character(0),
        fillStyle = character(0),
        text = character(0)
    )
}
