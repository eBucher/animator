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
        endWidth = numeric(0),
        endHeight = numeric(0),
        startOpacity = numeric(0),
        endOpacity = numeric(0),
        image = character(0)
    )
}


text_template <- function() {
    data.frame(
        starTime = numeric(0),
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
