# animator

A simple tool for programmatically creating animations by storing sequences of actions and movements as rows within dataframes.

## Installation

This package is currently under development. To install the latest dev version:

``` r
devtools::install_github("ebucher/animator")
```
# Demos

## "How do I move an image around the screen?"

Simply create a dataframe specifying where you want the image to start and end and then call the `compile()` function.

``` r
images_df <- data.frame(
    startTime = c(0),
    endTime = c(3),
    startX = c(100),
    startY = c(100),
    endX = c(200),
    endY = c(100),
    startWidth = c(32),
    startHeight = c(32),
    image = c(paste0(system.file(package = 'animator'), "/red_square.png"))
)

animator::compile(
    bg = c(paste0(system.file(package = 'animator'), "/white_background.png")), 
    images_df = images_df
)

browseURL("./animation_output/index.html")
```

## "What if I want to move it in multiple directions?"

Each time you want the image to move, add a new row to your `images_df` dataframe
indicating where you want it to move next.

``` r
images_df <- data.frame(
    startTime = c(0, 3, 6, 9),
    endTime = c(3, 6, 9, 12),
    startX = c(100, 200, 200, 100),
    startY = c(100, 100, 200, 200),
    endX = c(200, 200, 100, 100),
    endY = c(100, 200, 200, 100),
    startWidth = c(32, 32, 32, 32),
    startHeight = c(32, 32, 32, 32),
    image = c(paste0(system.file(package = 'animator'), "/red_square.png"))
)

animator::compile(
    bg = c(paste0(system.file(package = 'animator'), "/white_background.png")), 
    images_df = images_df
)

browseURL("./animation_output/index.html")
```

## "Can multiple images be shown?"

Sure! The `image` column in `images_df` can be used to specify a path for each
action being displayed in the animation.

``` r
images_df <- data.frame(
    startTime = c(0, 0),
    endTime = c(3, 3),
    startX = c(200, 200),
    startY = c(200, 200),
    endX = c(100, 300),
    endY = c(100, 100),
    startWidth = c(32),
    startHeight = c(32),
    image = c(
        paste0(system.file(package = 'animator'), "/red_square.png"),
        paste0(system.file(package = 'animator'), "/blue_square.png")
    )
)

animator::compile(
    bg = c(paste0(system.file(package = 'animator'), "/white_background.png")), 
    images_df = images_df
)

browseURL("./animation_output/index.html")
```

## "How about text?"

Of course. Similar to `images_df`, `text_df` can be used to add text to the animation.

``` r
images_df <- data.frame(
    startTime = c(0),
    endTime = c(3),
    startX = c(100),
    startY = c(100),
    endX = c(200),
    endY = c(100),
    startWidth = c(32),
    startHeight = c(32),
    image = c(paste0(system.file(package = 'animator'), "/red_square.png"))
)

text_df <- data.frame(
    startTime = c(0),
    endTime = c(3),
    startX = c(60),
    startY = c(70),
    endX = c(160),
    endY = c(70),
    font = "16px Arial",
    fillStyle = "#000000",
    text = "Hello world!"
)

animator::compile(
    bg = c(paste0(system.file(package = 'animator'), "/white_background.png")), 
    images_df = images_df,
    text_df = text_df
)

browseURL("./animation_output/index.html")
```

## "Can the size change? Or the opacity?"

By default, the package assumes that the image won't change opacity or size. With
the help of some optional parameters though, the size and opacity can also be changed.

``` r
images_df <- data.frame(
    startTime = c(0),
    endTime = c(3),
    startX = c(100),
    startY = c(100),
    endX = c(200),
    endY = c(100),
    startWidth = c(32),
    startHeight = c(32),
    endWidth = c(64),
    endHeight = c(64),
    startOpacity = c(1),
    endOpacity = c(0),
    image = c(paste0(system.file(package = 'animator'), "/red_square.png"))
)

animator::compile(
    bg = c(paste0(system.file(package = 'animator'), "/white_background.png")), 
    images_df = images_df
)

browseURL("./animation_output/index.html")
```

## "What about a more interesting example?"

Here's an example with 1,000 images being randomly moved around the screen at
the same time.

``` r
images_df <- data.frame(
    startTime = 0,
    endTime = 10,
    startX = sample(1:300, 1000, replace = TRUE),
    startY = sample(1:300, 1000, replace = TRUE),
    endX = sample(1:300, 1000, replace = TRUE),
    endY = sample(1:300, 1000, replace = TRUE),
    startWidth = c(4, 4),
    startHeight = c(4, 4),
    opacity = 1,
    image = c("inst/red_square.png", "inst/blue_square.png")
)

animator::compile(
    bg = c(paste0(system.file(package = 'animator'), "/white_background.png")), 
    images_df = images_df,
    size = c(300, 300)
)

browseURL("./animation_output/index.html")
```
