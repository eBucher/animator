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
